/*
    NAME: repetitive_cleanup.sqf
    VERSION: 1.9

    DESCRIPTION:
    Can delete everything that is not really needed
    dead bodies, dropped items, smokes, chemlights, explosives, empty groups
    Works even on Altis, it eats only items which are/were 100m from all units

    USAGE:
    in server's init
    [
        60, // seconds to delete dead bodies (0 means don't delete)
        5*60, // seconds to delete dead vehicles (0 means don't delete)
        3*60, // seconds to delete immobile vehicles (0 means don't delete)
        2*60, // seconds to delete dropped weapons (0 means don't delete)
        10*60, // seconds to deleted planted explosives (0 means don't delete)
        0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
    ] execVM 'repetitive_cleanup.sqf';

    will delete dead bodies after 60 seconds (1 minute)
    will delete dead vehicles after 5*60 seconds (5 minutes)
    will delete immobile vehicles after 3*60 seconds (3 minutes)
    will delete weapons after 2*60 seconds (2 minutes)
    will delete planted explosives after 10*60 seconds (10 minutes)
    will not delete any smokes/chemlights since its disabled (set to 0)

    If you want something to withstand the clean up, paste this into it's init:
    this setVariable["persistent",true];
*/

if (!isServer) exitWith {}; // isn't server         

#define PUSH(A,B) A set [count (A),B];
#define REM(A,B) A=A-[B];

private ["_ttdBodies","_ttdVehiclesDead","_ttdVehiclesImmobile","_ttdWeapons","_ttdPlanted","_ttdSmokes","_addToCleanup","_unit","_objectsToCleanup","_timesWhenToCleanup","_removeFromCleanup"];

_ttdBodies=[_this,0,0,[0]] call BIS_fnc_param;
_ttdVehiclesDead=[_this,1,0,[0]] call BIS_fnc_param;
_ttdVehiclesImmobile=[_this,2,0,[0]] call BIS_fnc_param;
_ttdWeapons=[_this,3,0,[0]] call BIS_fnc_param;
_ttdPlanted=[_this,4,0,[0]] call BIS_fnc_param;
_ttdSmokes=[_this,5,0,[0]] call BIS_fnc_param;

if({_x>0}count _this==0) exitWith {}; // all times are 0, we do not want to run this script at all

_objectsToCleanup=[];
_timesWhenToCleanup=[];

_addToCleanup = {
    _object = _this select 0;
    if(!(_object getVariable["persistent",false])) then {
        _newTime = (_this select 1)+time;
        _index = _objectsToCleanup find _object;
        if(_index == -1) then {
            PUSH(_objectsToCleanup,_object)
            PUSH(_timesWhenToCleanup,_newTime)
        } else {
            _currentTime = _timesWhenToCleanup select _index;
            if(_currentTime>_newTime) then {
                _timesWhenToCleanup set[_index, _newTime];
            };
        };
    };
};

_removeFromCleanup = {
    _object = _this select 0;
    _index = _objectsToCleanup find _object;
    if(_index != -1) then {
        _objectsToCleanup set[_index, 0];
        _timesWhenToCleanup set[_index, 0];
    };
};

while{true} do {
    sleep 10;
    {
        _unit = _x;
        if (_ttdWeapons>0) then {
            {
                {
                    [_x, _ttdWeapons] call _addToCleanup;
                } forEach (getpos _unit nearObjects [_x, 100]);
            } forEach ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"];
        };

        if (_ttdPlanted>0) then {
            {
                {
                    [_x, _ttdPlanted] call _addToCleanup;
                } forEach (getpos _unit nearObjects [_x, 100]);
            } forEach ["TimeBombCore"];
        };

        if (_ttdSmokes>0) then {
            {
                {
                    [_x, _ttdSmokes] call _addToCleanup;
                } forEach (getpos _unit nearObjects [_x, 100]);
            } forEach ["SmokeShell"];
        };

    } forEach allUnits;

    {
        if ((count units _x)==0) then {
            deleteGroup _x;
        };
    } forEach allGroups;

    if (_ttdBodies>0) then {
        {
            [_x, _ttdBodies] call _addToCleanup;
        } forEach allDeadMen;
    };

    if (_ttdVehiclesDead>0) then {
        {
            if(_x == vehicle _x) then { // make sure its vehicle
                [_x, _ttdVehiclesDead] call _addToCleanup;
            };
        } forEach (allDead - allDeadMen); // all dead without dead men == mostly dead vehicles
    };

    if (_ttdVehiclesImmobile>0) then {
        {
            if(!canMove _x && {alive _x}count crew _x==0) then {
                [_x, _ttdVehiclesImmobile] call _addToCleanup;
            } else {
                [_x] call _removeFromCleanup;
            };
        } forEach vehicles;
    };

    REM(_objectsToCleanup,0)
    REM(_timesWhenToCleanup,0)

    {
        if(isNull(_x)) then {
            _objectsToCleanup set[_forEachIndex, 0];
            _timesWhenToCleanup set[_forEachIndex, 0];
        } else {
            if(_timesWhenToCleanup select _forEachIndex < time) then {
                deleteVehicle _x;
                _objectsToCleanup set[_forEachIndex, 0];
                _timesWhenToCleanup set[_forEachIndex, 0];
            };
        };
    } forEach _objectsToCleanup;

    REM(_objectsToCleanup,0)
    REM(_timesWhenToCleanup,0)
};
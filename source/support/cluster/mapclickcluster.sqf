/*
    File: mapclickcluster.sqf

    Author: Kibot

    Description:
        Wrapper script for cluster.sqf, provides guard against lack of CP points, waits for player to mark strike location

    Parameter(s):
        _this select 0 - NUMBER - Number of ordinance salvos
        _this select 1 - NUMBER - Radius of 'Strike Area'
        _this select 2 - NUMBER - Interval between salvos (in seconds)
        _this select 3 - NUMBER - Number of ordinance rounds per salvo
        _this select 4 - NUMBER - Support type enumerator (1 - Artillery, 2 - Mortar Shell, 3 - JDAM)
        _this select 5 - NUMBER - Cost of Support type
        _this select 6 - STRING - Ammo type used for salvos
    
    Usage: 
        _null = [1, 250, 1, 90, 1, 6, 'grenade'] execVM 'support\cluster\mapclickcluster.sqf';

    Returns: 
        - Nil -
*/

params["_salvos", "_radius", "_interval", "_rps", "_supportype", "_cost", "_ammotype"];

_timer = 60;
clicked = false;

// IF NOT ENOUGH PTS
if (commandpointsblu1<_cost) exitWith {
    ["info",["Support","You don't have enough command points"]] call bis_fnc_showNotification;
    sleep 30;
    if (_supportype==1) exitWith {
        _art = [player1,"artillery"] call BIS_fnc_addCommMenuItem;
    };

    if (_supportype==2) exitWith {
        _art = [player1,"mortar"] call BIS_fnc_addCommMenuItem;
    };

    if (_supportype==3) exitWith {
        _art = [player1,"JDAM"] call BIS_fnc_addCommMenuItem;
    };
};

_pos = [];
hint "Click on your map to give the coordinates or wait 60 seconds to cancel the strike";
OnMapSingleClick format["_null = [_pos,%2,%3,%4,%5,%6,%7,'%8'] execVM 'support\cluster\cluster.sqf';clicked=true;onMapSingleClick ''",_pos,_salvos,_radius,_interval,_rps,_supportype,_cost,_ammotype];

// TIMER
while {_timer>0 AND !clicked} do {
    _timer = _timer-1; // remove 1 to timer
    sleep 1;
};

// TIMER ELLAPSED OR CLICKED
sleep 60;
OnMapSingleClick "";

if (_supportype==1) exitWith {
    _art = [player1,"cluster"] call BIS_fnc_addCommMenuItem;
};

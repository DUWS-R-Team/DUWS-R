/*
	
	AUTHOR: aeroson
	NAME: repetitive_cleanup.sqf
	VERSION: 1.7
	
	DESCRIPTION:
	Can delete everything that is not really needed 
	dead bodies, dropped items, smokes, chemlights, explosives, empty groups
	Works even on Altis, it eats only items which are 100m from all units
	
	USAGE:
	in server's init
	[
		60, // seconds to delete dead bodies (0 means don't delete) 
		5*60, // seconds to delete dead vehicles (0 means don't delete)
		2*60, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'repetitive_cleanup.sqf';	
	
	will delete dead bodies after 60 seconds (1 minute)
	will delete dead vehicles after 5*60 seconds (5 minutes)
	will delete weapons after 2*60 seconds (2 minutes)
	will delete planted explosives after 10*60 seconds (10 minutes)
	will not delete any smokes/chemlights since its disabled (set to 0)
		
*/

if (!isServer) exitWith {}; // isn't server         

#define PUSH(A,B) A set [count (A),B];
#define REM(A,B) A=A-[B];

private ["_ttdBodies","_ttdVehicles","_ttdWeapons","_ttdPlanted","_ttdSmokes","_delete","_unit"];


_ttdBodies=[_this,0,0,[0]] call BIS_fnc_param;
_ttdVehicles=[_this,1,0,[0]] call BIS_fnc_param;
_ttdWeapons=[_this,2,0,[0]] call BIS_fnc_param;
_ttdPlanted=[_this,3,0,[0]] call BIS_fnc_param;
_ttdSmokes=[_this,4,0,[0]] call BIS_fnc_param;

if (_ttdWeapons<=0 && _ttdPlanted<=0 && _ttdSmokes<=0 && _ttdBodies<=0 && _ttdVehicles<=0) exitWith {};


_objects=[];
_items=[];

_delete = {
	_object = _this select 0;
	_time = _this select 1;
	if(_objects find _object == -1) then {
		PUSH(_objects,_object)
		PUSH(_items,_time+time)
	};    
};


while{true} do {

	sleep 10;
    	
	if (_ttdBodies>0) then {
		{
			if(!isPlayer _x) then { 	 
				[_x, _ttdBodies] call _delete;
			}; 
		} forEach allDeadMen;
	};	
	
	if (_ttdVehicles>0) then {		
		{
			if(!isPlayer _x) then { 	 
				[_x, _ttdVehicles] call _delete;
			}; 
		} forEach (allDead - allDeadMen);
	};


	{	
	    _unit = _x;
	    
		if (_ttdWeapons>0) then {
			{
				{ 	 
					[_x, _ttdWeapons] call _delete;			
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"];
		};
		
		if (_ttdPlanted>0) then {
			{
				{ 
					[_x, _ttdPlanted] call _delete;  
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["TimeBombCore"];
		};
		
		if (_ttdSmokes>0) then {
			{
				{ 	 
					[_x, _ttdSmokes] call _delete; 
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["SmokeShell"];
		};
	
	} forEach allUnits;
	
	{
		if ((count units _x)==0) then {
			deleteGroup _x;
		};
	} forEach allGroups;
		

	{        
		if(isNull(_x)) then {
			_objects set[_forEachIndex, 0];
			_items set[_forEachIndex, 0];
		} else {
			if(_items select _forEachIndex < time) then {
				deleteVehicle _x;
				_objects set[_forEachIndex, 0];
				_items set[_forEachIndex, 0];			 	
			};
		};	
	} forEach _objects;
	
	REM(_objects,0)
	REM(_items,0)
				
};

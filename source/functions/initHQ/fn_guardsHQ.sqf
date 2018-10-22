params ["_centerPos"];

// patrolling guard
_groupPatrol = [ [(_centerPos select 0)+40, (_centerPos select 1)+40], WEST, [Blufor_Rifleman,Blufor_Rifleman,Blufor_AT_Specialist,Blufor_Engineer,Blufor_Medic,Blufor_Recon_Scout,Blufor_AT_Specialist,Blufor_AA_Specialist],[],[],[0.6,0.8,0.7]] call BIS_fnc_spawnGroup;

_groupPatrol setCombatMode "YELLOW";
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+40, (_centerPos select 1)+40], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)-40, (_centerPos select 1)+40], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	
	
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)-40, (_centerPos select 1)-40], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	

    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+40, (_centerPos select 1)-40], 0];
    _wp setWaypointType "MOVE";
	
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+40, (_centerPos select 1)+40], 0];
    _wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

// ADD Infinite Ammo eventhandler
{
_x addEventHandler ["Fired",{(_this select 0) setvehicleammo 1}];
_x addEventHandler ["HandleDamage", {false}];
} forEach (units _groupPatrol);

_centerPos = _this select 0;

// patrolling guard
_groupPatrol = [ [(_centerPos select 0)+40, (_centerPos select 1)+40], WEST, ["B_Soldier_F","B_Soldier_F","B_Soldier_AT_F","B_engineer_F","B_medic_F","B_recon_F","B_Soldier_AT_F","B_Soldier_AA_F"],[],[],[0.6,0.8,0.7]] call BIS_fnc_spawnGroup;

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

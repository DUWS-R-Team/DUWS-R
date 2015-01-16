_centerPos = _this select 0;

// Create the guards
_groupGuard = createGroup WEST;
_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 setpos [(_centerPos select 0)-6.5, (_centerPos select 1)-1.6];
_HQguard1 setdir 270;
[_HQguard1,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard2 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard2 setpos [(_centerPos select 0)-6.5, (_centerPos select 1)-4.7];
_HQguard2 setdir 270;
[_HQguard2,"GUARD","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard3 = _groupGuard createUnit ["B_Soldier_TL_F", _centerPos, [], 0, "FORM"]; 
_HQguard3 setpos [(_centerPos select 0), (_centerPos select 1)-7.58];
_HQguard3 setdir 180;
[_HQguard3,"LEAN","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard4 = _groupGuard createUnit ["B_Soldier_LAT_F", _centerPos, [], 0, "FORM"]; 
_HQguard4 setpos [(_centerPos select 0), (_centerPos select 1)-9];
_HQguard4 setdir 0;
[_HQguard4,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;




// patrolling guard
_groupPatrol = createGroup WEST;
_HQguard5 = _groupPatrol createUnit ["B_Soldier_GL_F", _centerPos, [], 0, "FORM"]; 
_HQguard5 setpos [(_centerPos select 0)+10, (_centerPos select 1)+10];

_groupPatrol setCombatMode "YELLOW";
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+10, (_centerPos select 1)+10], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)-10, (_centerPos select 1)+10], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	
	
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)-10, (_centerPos select 1)-10], 0];
    _wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	

    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+10, (_centerPos select 1)-10], 0];
    _wp setWaypointType "MOVE";
	
    _wp = _groupPatrol addWaypoint [[(_centerPos select 0)+10, (_centerPos select 1)+10], 0];
    _wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
	
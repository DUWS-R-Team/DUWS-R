_pos = getpos player;

_plane1 = createVehicle ["B_UAV_02_CAS_F", _pos,[], 0, "FLY"];
_plane1 setpos [_pos select 0, _pos select 1, (_pos select 2) + 1000];
_planegroup1 = createvehiclecrew _plane1; 

sleep 2;

_wp1 = _planegroup1 addWaypoint [_pos,0];
_wp1 setWaypointType "GUARD";
[_planegroup1, 1] setWaypointCombatMode "BLUE";
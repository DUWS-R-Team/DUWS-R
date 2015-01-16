// usage: [position, radius] execvm "createpatrol.sqf"
// radius: 50 for patrol inside and around base, 500 for medium lenght skirmish, 1300 for island

_position = _this select 0;
_radius   = _this select 1;



_group = [_position, WEST, ["B_Soldier_TL_F","B_Soldier_F"]] call BIS_fnc_spawnGroup;
_patrolRadius = round(_radius/3);
[_group, _position, _patrolRadius] call bis_fnc_taskPatrol;



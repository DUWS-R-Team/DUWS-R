
// radius: 50 for patrol inside and around base, 500 for medium lenght skirmish, 1300 for island

params ["_position","_radius"];

_group = [_position, WEST, [Blufor_Teamleader,Blufor_Rifleman]] call BIS_fnc_spawnGroup;
_patrolRadius = round(_radius/3);
[_group, _position, _patrolRadius] call bis_fnc_taskPatrol;
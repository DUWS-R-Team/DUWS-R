// usage: [position, radius] execvm "createoppatrol.sqf"
// radius: 50 for patrol inside and around base, 500 for medium lenght skirmish, 1300 for island

_position = _this select 0;
_radius   = _this select 1;


// hint format["%1",_position];

_group = [_position, EAST, ["O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_GL_F"],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_patrolRadius = round(_radius/2);
[_group, _position, _patrolradius] call bis_fnc_taskPatrol;

// ADD QRF eventhandler
_EH = leader _group addEventHandler ["Fired", {[_this select 0] spawn QRF_test}];
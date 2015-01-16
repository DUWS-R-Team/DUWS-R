_position = _this select 0;


// hint format["%1",_position];

_group = [_position, EAST, ["O_Soldier_SL_F","O_Soldier_AA_F","O_Soldier_AT_F","O_Soldier_GL_F","O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_GL_F"],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
[_group, _position] call bis_fnc_taskDefend;

// ADD QRF eventhandler
_EH = leader _group addEventHandler ["Fired", {[_this select 0] spawn QRF_test}];
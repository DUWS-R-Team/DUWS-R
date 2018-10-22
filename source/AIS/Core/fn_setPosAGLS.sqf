// from Killzone Kid

/*
	//---This will place player exactly on top deck of Cargo HQ on Stratis:
		[player, [2437.18,5693.47,0]] call AIS_Core_fnc_setPosAGLS;
		
	//---This will place player 2m above top deck of Cargo HQ on Stratis:
		[player, [2437.18,5693.47,2]] call AIS_Core_fnc_setPosAGLS;
		
	//---This will place player 2m below top deck of Cargo HQ on Stratis:
		[player, [2437.18,5693.47,-2]] call AIS_Core_fnc_setPosAGLS;
*/

params ["_obj", "_pos", "_offset"];

_offset = _pos select 2;
if (isNil "_offset") then {_offset = 0};
_pos set [2, worldSize]; 
_obj setPosASL _pos;
_pos set [2, vectorMagnitude (_pos vectorDiff getPosVisual _obj) + _offset];

_obj setPosASL _pos;
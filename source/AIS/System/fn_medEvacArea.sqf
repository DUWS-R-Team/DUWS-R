/*
 * Author: Psycho
 
 * Check Unit if is in range of a medevac object. 
 
 * Arguments:
	0: Unit (Object)
	1: Injured (Object)
 
 * Return value:
	Bool
 */
 
params ["_player", "_injured"];

private _return = false;
{
	_x params [["_obj", objNull], ["_radius", 0, [0]]];
	if (_return) exitWith {true};
	if (!isNull _obj) then {
		if (_radius > 0) then {
			if ([_obj, _radius] call AIS_Core_fnc_inRange) exitWith {_return = true};
		};
	};
} count AIS_MEDEVAC_STATIONS;


_return
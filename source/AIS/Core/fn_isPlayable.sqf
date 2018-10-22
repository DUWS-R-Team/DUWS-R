/*
 * Author: Psycho
 
 * Check if a unit is a playable unit.
 
 * Arguments:
	0: Unit (Object)

 * Return value:
	BOOL (true if playable)
*/

params ["_unit"];
private _isplayable = false;
if (isPlayer _unit) exitWith {true};

_isplayable = if (isMultiplayer) then {
	if (_unit in playableUnits) then {true} else {false};
} else {
	if (_unit in switchableUnits) then {true} else {false};
};


_isplayable
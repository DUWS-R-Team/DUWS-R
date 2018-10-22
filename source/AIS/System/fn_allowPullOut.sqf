/*
 * Author: psycho
 
 * Check Unit if get a unit out of a vehicle is possible
 
 * Arguments:
	0: Vehicle (Object)
 
 * Return value:
	Bool
 */

private _targetVehicle = _this;

private _crew = crew _targetVehicle;
private _isUncInside = false;

if (count _crew > 0) then {
	{
		if (_x getVariable ["ais_unconscious", false]) then {
			if (_x call AIS_System_fnc_checkUnload) exitWith {_isUncInside = true};
		};
		true
	} count _crew;
};


_isUncInside
/*
 * Author: Psycho
 
 * Check if uncoscious Unit can load in a vehicle..
 
 * Arguments:
	0: Vehicle (Object)
 
 * Return value:
	Bool
 */

private _targetVehicle = _this;

_canload = [false, true] select (count ([_targetVehicle] call AIS_System_fnc_getCargoIndex) > 0);


_canload
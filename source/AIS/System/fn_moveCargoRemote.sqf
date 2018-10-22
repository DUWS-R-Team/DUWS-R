/*
 * Author: Psycho
 
 * Load a unit into a vehicles cargo or turret seat. Function is everytime called by a player. Checks if the unit is local, if not, use remoteExec.
 
 * Arguments:
	0: Unit (Object)
	1: Vehicle (Object)
	2: In/Out (Number)		// 0 = Out / 1 = In
 
 * Return value:
	-
*/

params ["_injured", "_vehicle", "_handling"];

private _VehicleIndex = [_vehicle] call AIS_System_fnc_getCargoIndex;


if (_handling > 0) then {
	_injured assignAsCargoIndex [_vehicle, _VehicleIndex select 1];
	_injured moveInCargo [_vehicle, _VehicleIndex select 1];
} else {
	unassignVehicle _injured;
	moveOut _injured;
};


true
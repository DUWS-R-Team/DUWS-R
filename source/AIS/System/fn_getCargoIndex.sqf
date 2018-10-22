/*
 * Author: Psycho
 
 * Get a free cargo seat position for given vehicle.
 
 * Arguments:
	0: Vehicle (Object)
 
 * Return value:
	[vehicle, cargo index] (ARRAY) (empty Array if nothing found)
 */

params ["_targetVehicle"];
private _VehicleIndex = [];

// check if free cargo seats are avalible
private _allCargoSeats = [];
_allCargoSeats = fullcrew [_targetVehicle, "cargo", true];
if ( count _allCargoSeats > 0) then {
	{
		if (isNull (_x select 0)) exitWith {
			_VehicleIndex = [_targetVehicle, _x select 2];
		};
		true
	} count _allCargoSeats;
};

if (count _VehicleIndex > 0) exitWith {_VehicleIndex};


// check if free turret seats are avalible if no cargo seats there
private _allTurretSeats = [];
_VehicleIndex = [];
_allTurretSeats = fullcrew [_targetVehicle, "Turret", true];
if ( count _allTurretSeats > 0) then {
	{
		if (isNull (_x select 0)) exitWith {
			_VehicleIndex = [_targetVehicle, _x select 2];
		};
		true
	} count _allTurretSeats;
};


_VehicleIndex
/*
	* Author: psycho
 
	* Check if a unit can be unload from a vehicle at the actual situation
 
	* Arguments:
		0: Unit (Object)

	* Example:
		[player] call AIS_System_fnc_checkUnload;
 
	* Return value:
		Bool
*/
 
params ["_unit"];
private _vehicle = vehicle _unit;


if (surfaceIsWater position _unit) exitWith {false};

((speed _vehicle < 2) && {((getPosATL _vehicle) select 2) < 2})
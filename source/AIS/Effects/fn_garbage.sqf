/*
 * Author: Alwarren
 
 * Remove ambient medical equimpment from the ground. If euqipment is marked as "do not delete", the loop will set it to delete list for the next time the function is called.
 
 * Arguments:
	-
	
 * Example:
	[player] call AIS_Effects_fnc_garbage;
 
 * Return value:
	-
*/

if (!local player) exitWith {};
private _delete = false;

if (count ais_medequip_array > 0) then {
	{
		if (count _x > 1) then {
			if ((_x select 0) > 0) then {
				deleteVehicle (_x select 1);
				ais_medequip_array set [_forEachIndex, objNull];
			} else {
				_x set [0,1];
			};
		} else {
			ais_medequip_array set [_forEachIndex, objNull];
			_delete = true;
		};
	} forEach ais_medequip_array;
};

ais_medequip_array = ais_medequip_array - [objNull];


true
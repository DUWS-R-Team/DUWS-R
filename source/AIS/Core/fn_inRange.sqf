/*
	Author: [C-L-F] NetFusion

	Description:
	Checks whether an object is in a given range to player.

	Parameter(s):
	0: OBJECT - the object which should be checked.
	1: NUMBER - the range to check.

	Returns:
	- BOOL - true if the object in in range, false if not.

	Example:
	[object, 10] call AIS_Core_fnc_inRange;
*/

params [
	["_object", objNull, [player]],
	["_distance", 15, [0]]
];

_return = if (!isNull _object && {player distance2D _object < _distance}) then {
	true
} else {
	false
};


_return
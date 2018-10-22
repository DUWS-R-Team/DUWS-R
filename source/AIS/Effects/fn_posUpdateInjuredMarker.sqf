/*
 * Author: Psycho
 
 * Update the marker position every 5 seconds until the marker is deleted.
 
 * Arguments:
	0: Unit (Object)
	1: Marker (String)
 
 * Return value:
	-
	
* Exapmle:
	-
 */

params ["_unit"];
_marker = _unit getVariable ["ais_unitMarker", Nil];

if (!isNil "_marker") then {
	if (_unit getVariable ["ais_unconscious", false]) then {
		_marker setMarkerPosLocal (getPos _unit);
		
		_acc_time = diag_tickTime + 5;
		[{diag_tickTime > (_this select 1)}, {[_this select 0] call AIS_Effects_fnc_posUpdateInjuredMarker}, [_unit, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
	};
	
	if (!alive _unit || {isNull _unit}) then {
		_unit call AIS_Effects_fnc_removeInjuredMarker;
	};
};


true
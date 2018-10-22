/*
 * Author: Psycho
 
 * Create a local marker for unconcious units
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	the marker itself
	
* Exapmle:
	player call AIS_Effects_fnc_injuredMarker
 */

private _unit = _this;
private _mark = "";

_str = name _unit;
_marker = format ["%1_ais_marker", _str];

if (!isNil {_unit getVariable ["ais_unitMarker", Nil]}) then {
	_unit call AIS_Effects_fnc_removeInjuredMarker;
};

_mark = [_marker, position _unit, "ICON", "Color1_FD_F", [0.7, 0.7], format ["%1 down", _str], 0, "loc_Hospital"] call AIS_Core_fnc_createLocalMarker;
_unit setVariable ["ais_unitMarker", _marker];

_acc_time = diag_tickTime + 5;
[{diag_tickTime > (_this select 1)}, {[_this select 0] call AIS_Effects_fnc_posUpdateInjuredMarker}, [_unit, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;


_mark
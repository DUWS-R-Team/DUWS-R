/*
 * Author: Psycho
 
 * Delete a local unconcsious marker
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	-
	
* Exapmle:
	player call AIS_Effects_fnc_removeInjuredMarker;
 */
 
private _unit = _this;
private _marker = _unit getVariable ["ais_unitMarker", Nil];

if (!isNil "_marker") then {
	deleteMarkerLocal _marker;
	_unit setVariable ["ais_unitMarker", Nil];
};


true
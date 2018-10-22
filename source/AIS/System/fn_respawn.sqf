/*
 * Author: Psycho
 
 * Re-initialize a respawned unit.
 
 * Arguments:
	0: Unit (Object)
	1: Corpse (Object)
 
 * Return value:
	-
*/

params ["_unit", "_corpse"];


_unit setVariable ["ais_unconscious", false, true];
_unit setVariable ["ais_stabilized", false, true];
_unit setVariable ["ais_fireDamage", 0];
_unit setVariable ["AIS_UnitIsDead", false];
_unit setCaptive false;

if (isPlayer _unit) then {
	if (local player) then {showHud true};
	if (AIS_TOGGLE_RADIO) then {
		[true] call AIS_Effects_fnc_toggleRadio;
	};
} else {
	_unit stop false;
	{_unit enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM"];
};
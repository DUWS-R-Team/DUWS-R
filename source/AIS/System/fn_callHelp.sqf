/*
 * Author: Psycho
 
 * Call for help and also start to check if a AI can help you.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	BOOL (true if help is called, false if not)
*/

params ["_unit"];

if (!isNull (_unit getVariable ["ais_hasHelper", objNull])) exitWith {};

if ((_unit getVariable ["callHelpDelay", 0]) > diag_tickTime) exitWith {["You already have called for help!"] call AIS_Core_fnc_dynamicText; false};
_unit setVariable ["callHelpDelay", diag_tickTime + 9];

[""] call AIS_Core_fnc_dynamicText;
[_unit] call AIS_Effects_fnc_helpScream;

if (rating _unit < -1999) exitWith {false};

[_unit, objNull] call AIS_System_fnc_findAIHelper;
true
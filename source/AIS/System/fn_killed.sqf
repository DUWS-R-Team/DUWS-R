/*
 * Author: Psycho
 
 * Clean up the unit if they got killed. Is called by the killed EH.
 
 * Arguments:
	0: Unit (Object)
	1: Killer (Object)
 
 * Return value:
	-
*/

params ["_unit", "_killer"];

if (!(isNull (_unit getVariable ["ais_DragDrop_Torso", objNull]))) then {
	[_unit] call AIS_System_fnc_release;
};
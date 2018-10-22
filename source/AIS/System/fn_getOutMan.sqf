/*
 * Author: Psycho
 
 * Check if a unconscious unit is pulled out of the vehicle by a AI order and set the correct anim-state. Is called by the getOutMan EH.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	-
 */
 
params ["_injured"];

if (_injured getVariable ["ais_unconscious", false]) then {
	if (!(_injured getVariable ["ais_man_pullOut", false])) then {
		[_injured, "agonyStart"] remoteExec ["playActionNow", 0, false];
	};
};


true
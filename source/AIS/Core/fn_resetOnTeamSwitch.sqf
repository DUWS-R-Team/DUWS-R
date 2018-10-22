/*
 * Author: Psycho
 
 * Handle unit state after a teamswtich was performed.
 
 * Arguments:
	0: Player New (Object)
	1: Unit Old (Object)
 
 * Return value:
	-
*/

params ["_new_player", "_old_player"];


removeAllActions _old_player;
_old_player enableAI "TEAMSWITCH";

AIS_Core_realSide = getNumber (configfile >> "CfgVehicles" >> (typeOf _new_player) >> "side");

if (_old_player getVariable ["ais_unconscious", false]) then {
	ais_character_changed = true;	// reset blood splatter screen
};

if (_new_player getVariable ["ais_unconscious", false]) then {
	[_new_player] call AIS_System_fnc_bloodloss;
};


true
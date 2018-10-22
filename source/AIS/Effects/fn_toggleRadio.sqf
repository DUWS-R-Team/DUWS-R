/*
 * Author: Psycho
 
 * Enable/disable the TFAR and/or ACRE radios when player is unconscious.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Bool
 */


_canUse = param [0, true, [true]];

if (_canUse) then {
	player setVariable ["tf_globalVolume", 1];
	player setVariable ["tf_voiceVolume", 1];
	player setVariable ["tf_unable_to_use_radio", false];
	
	player setVariable ["acre_sys_core_isDisabled", false, true];
	player setVariable ["acre_sys_core_globalVolume", 1];
	
} else {

	player setVariable ["tf_globalVolume", 0.4];
	player setVariable ["tf_voiceVolume", 0];
	player setVariable ["tf_unable_to_use_radio", true];
	
	player setVariable ["acre_sys_core_isDisabled", true, true];
	player setVariable ["acre_sys_core_globalVolume", 0];
};

true
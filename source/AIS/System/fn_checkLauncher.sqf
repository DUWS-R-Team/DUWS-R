/*
 * Author: Psycho
 
 * Check if the unit have a launcher.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	BOOL (true when Launcer is present)
*/

_ret = if (SecondaryWeapon _this isEqualTo "") then {false} else {true};

_ret
// From biwiki:
// Param templates currently don't work with PBO missions manually copied to MPMissions folder. Unpacked missions, Steam missions and missions which are part of an addon works correctly.
// So I just copied the file into the mission instead.

#ifndef TIMEACCELERATION_DEFAULT
	#define TIMEACCELERATION_DEFAULT 1
#endif

class TimeAcceleration
{
	title = $STR_usract_time_inc;
	values[] = {1,2,5,10,20};
	texts[] = {
		"x1",
		"x2",
		"x5",
		"x10",
		"x20"
	};
	default = TIMEACCELERATION_DEFAULT;
	function = "BIS_fnc_paramTimeAcceleration";
};

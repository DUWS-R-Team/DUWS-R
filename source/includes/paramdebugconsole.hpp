// From biwiki:
// Param templates currently don't work with PBO missions manually copied to MPMissions folder. Unpacked missions, Steam missions and missions which are part of an addon works correctly.
// So I just copied the file into the mission instead.

#ifndef DEBUGCONSOLE_DEFAULT
	#define DEBUGCONSOLE_DEFAULT	0
#endif

class DebugConsole
{
	title = $STR_A3_paramDebugConsole_title;
	values[] = {0,1};
	texts[] = {$STR_DISABLED,$STR_ENABLED};
	default = DEBUGCONSOLE_DEFAULT;
};

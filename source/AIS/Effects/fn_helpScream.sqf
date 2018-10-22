/*
 * Author: Psycho
 
 * Play a random screaming sound when a unit go unconcsious
 
 * Arguments:
	0: Unit (Object)
	1: audible distance (optional)
 
 * Return value:
	-
	
* Exapmle:
	[player, 30] call AIS_Effects_fnc_helpScream;
*/

params [
	["_injured", objNull],
	["_dist", 50, [0]]
];


// playSound is global
_helpsound = format ["a3\sounds_f\characters\human-sfx\%1\%2", ais_personal_soundset select 0, selectRandom (ais_personal_soundset select 1)];
playSound3D [_helpsound, _injured, false, getPosASL _injured, 1.5, 1, _dist];	


true
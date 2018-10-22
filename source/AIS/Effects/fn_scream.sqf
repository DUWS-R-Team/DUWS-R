/*
 * Author: Psycho
 
 * Play a random screaming sound when a unit go unconcsious
 
 * Arguments:
	0: Unit (Object)
	1: audible distance (optional)
 
 * Return value:
	-
	
* Exapmle:
	[player, 30] call AIS_Effects_fnc_Scream;
*/	

params [
	["_injured", objNull],
	["_dist", 50, [0]]
];

// playSound is global
if (random 3 > 1.7) then {
	_deathsound = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Max_%2.wss", selectRandom [4,5,6,7,8,9], selectRandom [1,2,3,4,5]];
	playSound3D [_deathsound, _injured, false, getPosASL _injured, 1.5, 1, _dist];	
};


true
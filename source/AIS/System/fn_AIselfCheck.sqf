/*
 * Author: Psycho
 
 * Check if no player is in this group. (only AI's) If it is so, the AI will call for other AI's to help him. Otherwise a AI-only group cant be revive.
 
 * Arguments:
	0: Injured Unit (Object)
 
 * Return value:
	Nothing
*/

params ["_injured_ai"];

// breack the self check loop if help is no longer needed or possible.
if (!alive _injured_ai) exitWith {};
if (!(_injured_ai getVariable ["ais_unconscious", false])) exitWith {};

// injured is in handling. check some seconds later if handlin was interrupted.
if (!isNull (_injured_ai getVariable ["ais_hasHelper", objNull])) then {
	private _acc_time = (diag_tickTime + 30);
	[{diag_tickTime > (_this select 1)}, {[(_this select 0)] call AIS_System_fnc_AIselfCheck}, [_injured_ai, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
};


// searching for players in the group
private _group_with_player = false;
private _all_members = (units group _injured_ai) - [_injured_ai];
if (count _all_members > 0) then {
	{if (isPlayer _x) exitWith {_group_with_player = true};true} count _all_members;
};

// do nothing if players in group
if (_group_with_player) exitWith {};

// if no player is present call for help (with a short delay)
private _acc_time = (diag_tickTime + 40);
[{diag_tickTime > (_this select 2)}, {_this call AIS_System_fnc_findAIHelper}, [_injured_ai, objNull, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;


true
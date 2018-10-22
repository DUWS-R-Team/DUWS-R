/*
 * Author: Psycho
 
 * Calculate the time till the AI units will die (Revive-Time) and check if the get revived.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	-
*/

params ["_unit"];
if (!canSuspend) exitWith {[_unit] spawn AIS_System_fnc_bloodlossAI};
if (!local _unit) exitWith {};


// AI help AI
[_unit] call AIS_System_fnc_AIselfCheck;

// get the revive time
_revive_time = [_unit] call AIS_System_fnc_calculateLifeTime;
_unit setBleedingRemaining _revive_time;

// no reset of this variable until the unit fall in a completely new unconsciou state. 
private _ai_time_over = diag_tickTime + _revive_time;

// wait until something happens
waitUntil {
	!alive _unit ||
	{!(_unit getVariable ["ais_unconscious", false])} ||
	{_unit getVariable ["ais_stabilized", false]} ||
	{diag_tickTime > _ai_time_over}
};


if (diag_tickTime > _ai_time_over) exitWith {[_unit] call AIS_Damage_fnc_goToDead};

if (_unit getVariable ["ais_stabilized", false]) then {
	waitUntil {!alive _unit || {!(_unit getVariable ["ais_unconscious", false])}};
};

if (!alive _unit) exitWith {_unit call AIS_System_fnc_restoreFaks};

_unit stop false;
{_unit enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];

/*

... place to some AI stuff after revive if necessary...


*/


true
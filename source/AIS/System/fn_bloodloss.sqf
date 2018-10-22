/*
 * Author: Psycho
 
 * Calculate the time till the unit will die (Revive-Time) and control the injury-effects.
 
 * Arguments:
	0: Unit (Object)
	1: Killer (Object)
 
 * Return value:
	-
*/
params ["_unit"];
if (!local _unit) exitWith {};


// Function use disableSerialisation and can corrupt some other functions in the same frame. So it need a delay till next frame.
[{call AIS_Effects_fnc_bloodSplatterScreen}] call AIS_Core_fnc_onNextFrame;

// shacking gun
addCamShake [15, 999, 0.7];

//if (tcb_ais_bloodParticle) then {[_unit] call tcb_fnc_setBleeding};		// not implemented yet

// get the revive time
_revive_time = [_unit] call AIS_System_fnc_calculateLifeTime;
_unit setBleedingRemaining _revive_time;

// no reset of this variable until the unit fall in a completely new unconsciou state. 
ais_start_unc_time = diag_tickTime;

// start the timer and the visula effetcs
private _acc_time = diag_tickTime + 1;
[{diag_tickTime >= (_this select 2)}, {_this call AIS_Effects_fnc_bleeding}, [_unit, _revive_time, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;


true
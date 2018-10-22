/*
 * Author: Psycho
 
 * Visual bleeding effects and counter for revive time. Will self-run in a loop till unit get revived/stabilized or died.
 
 * Arguments:
	0: Unit (Object)
	1: Revive Time (Number)
 
 * Return value:
	-
*/

params ["_unit"];

// breack out if unit died or revived
if (!alive _unit || {!(_unit getVariable ["ais_unconscious", false])}) exitWith {
	_unit setBleedingRemaining 10;
	_unit setFatigue 0.6;
	resetCamShake;
	titleText ["", "PLAIN DOWN", 1];
	
	{_x ppEffectEnable false; true} count ais_ppEff;
	ppEffectDestroy ais_ppEff;
};

// breack out if unit get new damage (no longer stabilized)
if (!(_unit getVariable ["ais_stabilized", false])) exitWith {
	_unit setBleedingRemaining 10;
	_unit setFatigue 1;
	addCamShake [15, 999, 0.7];
	
	// Function use disableSerialisation and can corrupt some other functions in the same frame. So it need a delay till next frame.
	[{call AIS_Effects_fnc_bloodSplatterScreen}] call AIS_Core_fnc_onNextFrame;
	
	// get the revive time
	_revive_time = [_unit] call AIS_System_fnc_calculateLifeTime;
	_unit setBleedingRemaining _revive_time;
	
	// loop
	private _acc_time = diag_tickTime + 1;
	[{diag_tickTime >= (_this select 2)}, {_this call AIS_Effects_fnc_bleeding}, [_unit, _revive_time, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
};



titleText ["You are stabilized.", "PLAIN DOWN", 1.5];
_unit setFatigue 0.6;

// init pp effects
ais_ppEff = [];
ais_ppEff = ppEffectCreate [["radialBlur", 17091], ["colorCorrections", 1580]];
{_x ppEffectEnable true; nil} count ais_ppEff;

// set visual pp effects
(ais_ppEff select 1) ppEffectAdjust [
	0.9 + (random 0.2),							// brightness, image brightness (0 - black, 1 - unchanged, 2 - white )
	1,											// contrast, image contrast (1 - normal contrast)
	0,											// offset, image contrast offset (0 - unchanged )
	random 0.7 max 0.2, 0, 0.05, random 0.6,	// color for blending ( R,G,B - color, A - blend factor (0 - original color, 1 - blend color ))
	0.2, 0, 0.5, 0.9,							// color for colorization ( R,G,B - color, A - saturation (0 - original color, 1 - B&W multiplied by colorize color))
	0.199, 0.587, 0.114, 1						// RGB weights for desaturation (0.299, 0.587, 0.114, NA)
];
(ais_ppEff select 1) ppEffectCommit 0.5;


// loop
private _acc_time = diag_tickTime + 1.5;
[{diag_tickTime >= (_this select 1)}, {_this call AIS_Effects_fnc_stabil}, [_unit, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
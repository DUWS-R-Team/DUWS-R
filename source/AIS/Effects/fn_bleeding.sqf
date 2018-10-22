/*
 * Author: Psycho
 
 * Visual bleeding effects and counter for revive time. Will self-run in a loop till unit get revived/stabilized or died.
 
 * Arguments:
	0: Unit (Object)
	1: Revive Time (Number)
 
 * Return value:
	-
*/

params ["_unit", "_revive_time"];

// breack out if unit died or revived
if (!alive _unit || {!(_unit getVariable ["ais_unconscious", false])}) exitWith {
	_unit setBleedingRemaining 10;
	_unit setFatigue 0.6;
	resetCamShake;
	titleText ["", "PLAIN DOWN", 1];
	
	{_x ppEffectEnable false; true} count ais_ppEff;
	ppEffectDestroy ais_ppEff;
};

// breack out if unit get stabilized
if (_unit getVariable ["ais_stabilized", false]) exitWith {
	_unit setBleedingRemaining 10;
	_unit setFatigue 0.7;
	addCamShake [12, 999, 0.9];
	titleText ["You are stabilized.", "PLAIN DOWN", 1];
	
	// loop
	private _acc_time = diag_tickTime + 1.5;
	[{diag_tickTime >= (_this select 1)}, {_this call AIS_Effects_fnc_stabil}, [_unit, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
};


// get the revive time
_revive_time = [_unit] call AIS_System_fnc_calculateLifeTime;
_unit setBleedingRemaining _revive_time;

private _timeleft = (ais_start_unc_time + _revive_time) - diag_tickTime;

// to late
if (_timeleft <= 0) exitWith {
	_unit setBleedingRemaining 5;
	resetCamShake;
	titleText ["", "PLAIN DOWN", 1];
	
	{_x ppEffectEnable false; true} count ais_ppEff;
	ppEffectDestroy ais_ppEff;
	
	[_unit, objNull] call AIS_Damage_fnc_goToDead;
};

if (AIS_SHOW_COUNTDOWN) then {
	[titleText ["It's to late for you.","PLAIN DOWN",1], titleText [format ["Bleedout in %1 Seconds", floor _timeleft],"PLAIN DOWN",0.2]] select (_timeleft > 3);
};

_unit setFatigue 1;

// init pp effects
ais_ppEff = [];
ais_ppEff = ppEffectCreate [["radialBlur", 17091], ["colorCorrections", 1580]];
{_x ppEffectEnable true; nil} count ais_ppEff;

// set visual pp effects
_brightness = (_timeleft / _revive_time) + (random 0.1);
(ais_ppEff select 1) ppEffectAdjust [
	_brightness,											// brightness, image brightness (0 - black, 1 - unchanged, 2 - white )
	1,											// contrast, image contrast (1 - normal contrast)
	0,											// offset, image contrast offset (0 - unchanged )
	random 0.9 max 0.3, 0, 0.05, random 0.75,	// color for blending ( R,G,B - color, A - blend factor (0 - original color, 1 - blend color ))
	0.2, 0, 0.5, 0.9,							// color for colorization ( R,G,B - color, A - saturation (0 - original color, 1 - B&W multiplied by colorize color))
	0.199, 0.587, 0.114, 1						// RGB weights for desaturation (0.299, 0.587, 0.114, NA)
];
(ais_ppEff select 1) ppEffectCommit 0.5;


// loop
private _acc_time = diag_tickTime + 1;
[{diag_tickTime >= (_this select 2)}, {_this call AIS_Effects_fnc_bleeding}, [_unit, _revive_time, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
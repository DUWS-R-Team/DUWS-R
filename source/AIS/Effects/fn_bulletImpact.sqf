/*
 * Author: Psycho
 
 * Impact effect on bullet hit.
 
 * Arguments:
	0: Unit (Object)
	1: Strength (Number)
	
 * Example:
	[player, 0.5] call AIS_Effects_fnc_bulletImpact;
 
 * Return value:
	-
*/

params ["_unit", "_strength"];

if (!local player) exitWith {};
if (_unit getVariable "ais_unconscious") exitWith {};


if (isNull objectParent _unit && {cameraView in ["INTERNAL", "GUNNER"]}) then {
	
	_strength = if (_strength < 0.2) then {0.2 + (random 0.3)} else {_strength};
	_strength = if (_strength > 5) then {4 + (random 1)} else {_strength};
	private _power = _strength + 4;
	enableCamShake true;

	addCamShake [_power, 0.4, 30];
	private _color = (1 - _strength) max 0.15;

	// set color corrections
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, _color],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [1.8];
	"dynamicBlur" ppEffectCommit 0;

	// set effect duration, depending on hit strength
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit _strength;
	
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit _strength;
};


true
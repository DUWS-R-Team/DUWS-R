/*
 * Author: Psycho
 
 * Calculate the needed time to stabilize a unit.
 
 * Arguments:
	0: Unit (Object)
	1: Injured (Object)
 
 * Return value:
	NUMBER (Stabilize Time)
*/

params ["_unit", "_injured"];

private _calculated_stabilize_time = AIS_STABILIZETIME;

// A bigger factor mean we have a bigger deviation in revive time depending in our real damage deviation. (recommended values between 0.5 and 2.0)
_ais_variation_factor = 0.7;
// If the unit stay at this avg damage we are near the basic revive time. If the real damage is less or stronger also the real revive time will change. (no big changes recommended!)
_ais_avg_damage_factor = 6;

// get real damage (all body parts + overall damage)
private _summary_damage = 0;
{
	_summary_damage = _summary_damage + (((getAllHitPointsDamage _injured) select 2) select _x);
	true
} count [0,1,2,3,4,5,6,7,8,9,10];
_summary_damage = _summary_damage + (damage _injured);

// calculate revive time
_calculated_stabilize_time = (AIS_STABILIZETIME + ((_ais_variation_factor * (_summary_damage - _ais_avg_damage_factor)) * 2)) max (AIS_STABILIZETIME / 2);

// rezise the time if the helper is a medic
if (_unit call AIS_System_fnc_isMedic) then {
	_calculated_stabilize_time = _calculated_stabilize_time / 1.5;
};


_calculated_stabilize_time
/*
 * Author: Psycho
 
 * Calculate the real revive time. Time depends on real summary damage of all body parts.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	NUMBER (Life Time)
*/

params ["_unit"];

private _calculated_life_time = AIS_BLEEDOUT_TIME;

// A bigger factor mean we have a bigger deviation in revive time depending in our real damage deviation. (recommended values between 0.5 and 2.0)
_ais_variation_factor = 1.0;
// If the unit stay at this avg damage we are near the basic revive time. If the real damage is less or stronger also the real revive time will change. (no big changes recommended!)
_ais_avg_damage_factor = 6;

// get real damage (all body parts + overall damage)
private _summary_damage = 0;
{
	_summary_damage = _summary_damage + (((getAllHitPointsDamage _unit) select 2) select _x);
	true
} count [0,1,2,3,4,5,6,7,8,9,10];
_summary_damage = _summary_damage + (damage _unit);

// calculate life time
_calculated_life_time = if (_unit getVariable ["AIS_noBleedOut", false]) then {
	999999999
} else {
	AIS_BLEEDOUT_TIME + ((_ais_variation_factor * (_ais_avg_damage_factor - _summary_damage)) * 10);
};


_calculated_life_time
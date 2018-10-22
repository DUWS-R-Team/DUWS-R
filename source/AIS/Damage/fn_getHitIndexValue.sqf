/*
 * Author: Psycho
 
 * Give back a wanted hitDamageIndex. Index number or correspondending Hitpart.
 
 * Arguments:
	0: Unit (Object)
	1: Hitindex or Hitpart (Number OR String)
 
 * Return value:
	["Hitpart" , IndexNumber, partDamage]
 */

params [
	"_unit",
	["_hitValue", 0, [0,""]]
];


_ret = if (_hitValue isEqualType 0) then {

	if (_hitValue > 10 || _hitValue < 0) exitWith {diag_log format ["AIS ERROR: AIS_Damage_fnc_getHitIndexValue, input number is out of range: %1", _hitValue]; ["",_hitValue, 0]};
	[((getAllHitPointsDamage _unit) select 1) select _hitValue, _hitValue, ((getAllHitPointsDamage _unit) select 2) select _hitValue]
	
} else {

	_hitValue = toLower _hitValue;
	private _num = ((getAllHitPointsDamage _unit) select 1) find _hitValue;
	
	if (_num < 0) then {
		[_hitValue, -1, damage _unit]
	} else {
		[_hitValue, _num, ((getAllHitPointsDamage _unit) select 2) select _num]
	};
	
};


_ret
/*
 * Author: Psycho
 
 * give back the last damage of the specific body part
 
 * Arguments:
	0: Unit (Object)
	1: hitPartIndex (Number)
 
 * Return value:
	damage
 */

params ["_unit", "_hitPartIndex"];

_return_part_damage = [damage _unit, _unit getHitIndex _hitPartIndex] select (_hitPartIndex >= 0);



_return_part_damage
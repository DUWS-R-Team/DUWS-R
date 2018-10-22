/*
 * Author: Psycho
 
 * Reveal near units after revive.
 
 * Arguments:
	0: Revived Unit (Object)
	1: Range (Number) [optional]
 
 * Return value:
	Nothing
*/


params [
	["_unit", player, [player]],
	["_range", 50, [50]]
];

_list = _unit nearEntities ["CAManBase", _range];
_side = _unit getVariable ["ais_side", civilian];

{
	if ((side _x) isEqualTo _side) then {
		_unit reveal [_x, 4];
	};
	true

} count _list;


true
/*
 * Author: psycho
 
 * Set a object / Vehicle in function of a medevac point and make it public. Usable for spawned objects for example. Public function.
 
 * Arguments:
	0: Vehicle (Object)
	1: Distance (Number)
 
 * Return value:
	changed AIS_MEDEVAC_STATIONS array.
	Return a Bool if no new object was added. (error)
 */

params [["_obj",objNull,[objNull]], ["_distance",0,[0]]];
private _return = false;

if (!isNull _obj) then {
	_index = AIS_MEDEVAC_STATIONS pushBackUnique [_obj, _distance];
	if (_index != -1) then {_return = true};
} else {
	_return = false;
};

if (_return) exitWith {
	publicVariable "AIS_MEDEVAC_STATIONS";
	AIS_MEDEVAC_STATIONS
};


_return
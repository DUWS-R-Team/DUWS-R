/*
 * Author: Psycho
 
 * Stop to drag another unit.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	-
*/

params ["_unit"];
private _target = _unit getVariable "ais_DragDrop_Torso";
private _pos = getPos _target;

_unit setVariable ["ais_DragDrop_Torso", objNull];
_target setVariable ["ais_DragDrop_Player", objNull, true];
_unit setVariable ["ais_CarryDrop_Torso", false];

_target setVariable ["ais_hasHelper", objNull, true];
_unit playAction "released";

detach _unit;
detach _target;

if (alive _target) then {
	[_target, "AinjPpneMstpSnonWrflDb_release"] remoteExec ["switchMove", 0];
	//[_target, _pos] call AIS_Core_fnc_setPosAGLS;
	_target setPos _pos;
};


true
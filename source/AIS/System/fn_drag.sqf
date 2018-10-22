/*
 * Author: Psycho
 
 * Start to drag a unit.
 
 * Arguments:
	0: Unit Drager (Object)
	1: Unit wounded (Object)
 
 * Return value:
	-
*/


params ["_unit", "_target"];

_unit setVariable ["ais_DragDrop_Torso", _target];
_target setVariable ["ais_DragDrop_Player", _unit, true];

_target setVariable ["ais_hasHelper", _unit, true];


detach _unit;
detach _target;

[_target, "AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove", 0];
[_unit, "grabDrag"] remoteExec ["playActionNow", 0, false];
//waitUntil {animationState _unit in ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]};

_attachPoint = [0, 1.1, 0.05];
_target attachTo [_unit, _attachPoint];
[_target, 180] remoteExec ["setDir", 0, false];

// release the injured if the helper getin a vehicle
[
	{isNull ((_this select 1) getVariable ["ais_DragDrop_Player", objNull]) || {!(isNull objectParent (_this select 0))}},
	{if (!(isNull objectParent (_this select 0))) then {[(_this select 0)] call AIS_System_fnc_release}},
	[_unit,_target]
] call AIS_Core_fnc_waitUntilAndExecute;

/*
 * Author: Psycho
 
 * Load a unit into a vehicles cargo or turret seat.
 
 * Arguments:
	0: Unit (Object)
	1: Vehicle (Object)
 
 * Return value:
	-
*/

params ["_unit", "_vehicle"];

_injured = _unit getVariable ['ais_DragDrop_Torso', objNull];
[_unit] call AIS_System_fnc_release;

_injured setVariable ["ais_man_pullOut", false, true];

// move the wounded in the vehicle
[[_injured, _vehicle, 1], {_this call AIS_System_fnc_moveCargoRemote}] remoteExec ["call"];

// unconscious animation in cargo seat
[{[(_this select 0), 'unconscious'] remoteExec ["playActionNow", 0, false]}, [_injured]] call AIS_Core_fnc_onNextFrame;


true
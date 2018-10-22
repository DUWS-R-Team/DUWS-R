/*
 * Author: Psycho
 
 * Set the unit in unconcsious state for PLAYERS. Set all variables and handle things around.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	[player] call AIS_System_fnc_unconsciousPlayer;
 */

params ["_unit"];

// set the variables
_unit setVariable ["ais_unconscious", true, true];
_unit setVariable ["ais_CarryDrop_Torso", false];

// if player drag or carry someone release the body
if (!(isNull (_unit getVariable ["ais_DragDrop_Torso", objNull]))) then {
	[_unit] call AIS_System_fnc_release;
};

// do some actions for some special situations...
if (count attachedObjects _unit > 0) then {
	{detach _x} forEach (attachedObjects _unit);
};
if (animationState _unit in ["ladderriflestatic", "laddercivilstatic"]) then {
    _unit action ["ladderOff", (nearestBuilding _unit)];
};

// animation and other actions across the network
[_unit, true] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0, false];


// camera actions
if (dialog) then {closeDialog 0};
titleCut ["","BLACK IN", 1.5];
if (visibleMap) then {openMap false};
showHud false;
_unit switchCamera "INTERNAL";
if (sunOrMoon isEqualTo 0) then {
	_unit action ["nvGogglesOff", _unit];
};

// remove medic euqipment from unconscious unit
[_unit] call AIS_System_fnc_removeFaks;

// disable radios
if (AIS_TOGGLE_RADIO) then {
	[false] call AIS_Effects_fnc_toggleRadio;
};

// random screaming
[_unit, 50] call AIS_Effects_fnc_Scream;

// set unit as captive
[_unit, true] remoteExec ["setCaptive", 0, false];
_unit addEventHandler ["fired", {
	private _shooter = _this select 0;
	[_shooter, false] remoteExec ["setCaptive", 0, false];
}];

// value >= 0.5 break the crawl-feature from agony action! (canMove false)
if ((_unit getHitIndex 10) > 0.49) then {
	[{(_this select 0) setHitIndex [10, 0.49]}, [_unit]] call AIS_Core_fnc_onNextFrame;
};

// countdown and visual effects
[_unit] call AIS_System_fnc_bloodloss;

// correkt animation if unit get pushed out of a vehicle on other ways except the pull-out action
_unit addEventHandler ["getOutMan", {_this call AIS_System_fnc_getOutMan}];

// disable teamSwitch while unc
if (teamswitchenabled) then {
	enableTeamswitch false;
	ais_reenable_teamswitch = true;
};

true
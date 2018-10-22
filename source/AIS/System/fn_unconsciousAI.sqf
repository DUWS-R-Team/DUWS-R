/*
 * Author: Psycho
 
 * Set the unit in unconcsious state for Non-players. Set all variables and handle things around.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	[unit] call AIS_System_fnc_unconsciousAI;
 */


params ["_unit"];

// set the variables
_unit setVariable ["ais_unconscious", true, true];

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

// animation and other actions across the network to all players
//[_unit, true] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", [-2,0] select hasInterface, false];
[[_unit, true], {
    if (!isDedicated) then {
        _this call AIS_System_fnc_unconcsiousRemote;
    };
}] remoteExec ["call"];

// AI actions
_unit stop true;
{_unit disableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];

// remove medic euqipment from unconscious unit
[_unit] call AIS_System_fnc_removeFaks;

// random screaming
[_unit, 50] call AIS_Effects_fnc_Scream;

// set unit as captive
[_unit, true] remoteExec ["setCaptive", 0, false];

// countdown for AI's
[_unit] spawn AIS_System_fnc_bloodlossAI;

// correkt animation if unit get pushed out of a vehicle on other ways except the pull-out action
_unit addEventHandler ["getOutMan", {_this call AIS_System_fnc_getOutMan}];

// avoid to switching in while unc
removeSwitchableUnit _unit;

true
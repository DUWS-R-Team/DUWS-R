/*
 * Author: Psycho
 
 * Start to init a unit which is local to a player.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	[_unit] call AIS_System_fnc_loadAISlocalToPlayer;
 */
 
params ["_unit"];
if (_unit getVariable ["AIS_noReviveInit", false]) exitWith {};

if (!isNil {_unit getVariable "ais_aisInit"}) then {
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "Respawn";
	_unit removeAllEventHandlers "HandleHeal";
	[_unit] call AIS_Core_fnc_setVariables;
};
_unit setVariable ["ais_aisInit", true];


_unit removeAllEventHandlers "handleDamage";
_unit addEventHandler ["HandleDamage", {_this call AIS_Damage_fnc_handleDamage}];

_unit removeAllEventHandlers "Killed";
_unit addEventHandler ["Killed", {_this call AIS_System_fnc_killed}];

_unit removeAllEventHandlers "Respawn";
if ([_unit] call AIS_Core_fnc_isPlayable) then {
	_unit addEventHandler ["Respawn", {_this call AIS_System_fnc_respawn}];
};

_unit removeAllEventHandlers "HandleHeal";
_unit addEventHandler ["HandleHeal", {_this call AIS_System_fnc_handleHeal}];


true
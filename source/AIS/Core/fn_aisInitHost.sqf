// this script run on the server/host for every unit which should be added to the revive system. It run's once by starting the mission.
params ["_unit"];
if (_unit getVariable ["AIS_noReviveInit", false]) exitWith {};

if (!isNil {_unit getVariable "ais_aisInit"}) then {
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "Respawn";
	_unit removeAllEventHandlers "HandleHeal";
	[_unit] call AIS_Core_fnc_setVariables;
};
_unit setVariable ["ais_aisInit", true];


// set damage EH only for local and non-player units!
// last check if unit is local
if (local _unit && !(isPlayer _unit)) then {
	[_unit] spawn {
		_unit = _this select 0;

		waitUntil {!isNil {_unit getVariable "BIS_fnc_feedback_hitArrayHandler"} || {time > 0}};
		_unit removeAllEventHandlers "handleDamage";
		["%1 --- add damageEH to AI %2", diag_ticktime, _unit] call BIS_fnc_logFormat;
		ais_hdEH = _unit addEventHandler ["HandleDamage", {_this call AIS_Damage_fnc_handleDamage}];
		
		ais_hkEH = _unit addEventHandler ["Killed", {_this call AIS_System_fnc_killed}];
		
		if ([_unit] call AIS_Core_fnc_isPlayable) then {
			ais_hrEH = _unit addEventHandler ["Respawn", {_this call AIS_System_fnc_respawn}];
		};
		_unit removeAllEventHandlers "HandleHeal";
		ais_hhEH = _unit addEventHandler ["HandleHeal", {_this call AIS_System_fnc_handleHeal}];
	};
};
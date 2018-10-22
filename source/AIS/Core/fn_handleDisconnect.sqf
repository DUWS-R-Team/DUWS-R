/*
 * Author: Psycho
 
 * Server side handling of disconnected players. The disconnected entity get transfered to the server and re-init the AIS.
 
 * Arguments:
	0: Entity (Object, old player)
 
 * Return value:
	-
	
 * Attention!
 Override: If this EH code returns true, the unit, previously occupied by player, gets transferred to the server, becomes AI and continues to live, even with description.ext param disabledAI = 1;
*/


params ["_entity"];

// delete unit if mission designer have set disabledAI param set to 1
_deleteEntity = false;
_deleteEntity = if ((getMissionConfigValue "disabledAI") isEqualType 0) then {
	_back = if ((getMissionConfigValue ["disabledAI", 0]) > 0) then {true} else {false};_back
} else {
	_back = if ((toUpper((getMissionConfigValue ["disabledAI", "false"]))) isEqualTo "TRUE") then {true} else {false};_back
};

if (_deleteEntity) exitWith {
	if (local _entity) then {
		if (!isNull objectParent _entity) then {
			unassignVehicle _entity;
			moveOut _entity;
		};
		deleteVehicle _entity;
	};
	false
};

// othrwise re-init the unit on the new owner (server)
if (!isNil {_entity getVariable "ais_unconscious"}) then {
	_entity call AIS_Core_fnc_aisInitHost;
};


true
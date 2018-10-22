// this script run only by the player!
private _player = _this;
if (_player != player) exitWith {["%1 --- exit aisInitPlayer cause it's not the local player itself %2", diag_ticktime, _player] call BIS_fnc_logFormat};
if (isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {["AIS: AIS shutdown itself cause ACE medical system is also running. ACE medical and AIS cant work at the same time."] call BIS_fnc_logFormat};

if (_player getVariable ["AIS_noReviveInit", false]) exitWith {};

// set damage EH local to the player
if (local _player) then {
	[_player] call AIS_Core_fnc_setVariables;
	
	[_player] spawn {
		_player = _this select 0;
		waitUntil {!isNil {_player getVariable "BIS_fnc_feedback_hitArrayHandler"} || {time > 0}};
		_player removeAllEventHandlers "handleDamage";	// make sure nothing else working byside
		//["%1 --- add damageEH to player %2", diag_ticktime, _player] call BIS_fnc_logFormat;
		_player addEventHandler ["HandleDamage", {_this call AIS_Damage_fnc_handleDamage}];
		
		_player addEventHandler ["Killed", {_this call AIS_System_fnc_killed}];
		
		_player addEventHandler ["Respawn", {_this call AIS_System_fnc_respawn}];
		
		_player addEventHandler ["HandleHeal", {_this call AIS_System_fnc_handleHeal}];
		
		waitUntil {!isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call AIS_System_fnc_keyHandler}];
	};
};

// AI is local to the group leader on dedicated environment
if (!isServer && (count (units group player) > 1)) then {
	if (leader group _player isEqualTo _player) then {
		
		[_player] spawn {
			_player = _this select 0;
			_groupWithoutPlayers = ((units group _player) - (allUnits select {isPlayer _x}));
			{[_x] call AIS_Core_fnc_setVariables; true} count _groupWithoutPlayers;
			
			waitUntil {!isNil {_player getVariable "BIS_fnc_feedback_hitArrayHandler"} || {time > 0}};
			{
				_x removeAllEventHandlers "handleDamage";
				//["%1 --- add damageEH to groupmember of %3's group: %2", diag_ticktime, _x, _player] call BIS_fnc_logFormat;
				_x addEventHandler ["HandleDamage", {_this call AIS_Damage_fnc_handleDamage}];
				
				_x removeAllEventHandlers "Killed";
				_x addEventHandler ["Killed", {_this call AIS_System_fnc_killed}];
				
				_x removeAllEventHandlers "Respawn";
				if ([_x] call AIS_Core_fnc_isPlayable) then {
					_x addEventHandler ["Respawn", {_this call AIS_System_fnc_respawn}];
				};
				
				_x addEventHandler ["HandleHeal", {_this call AIS_System_fnc_handleHeal}];
				
				true
			} count _groupWithoutPlayers;
		};
	
	};
};


// add handleHeal local to the player for every unit and set the correct anim-state (local)
private _allPlayers = allUnits select {isPlayer _x};	// doesn't use allPlayers at this point, cause it can be delayed in self-hosted env.
private _ais_revive_units = toLower AIS_REVIVE_INIT_UNITS;
private _init_units = call {
	if (_ais_revive_units isEqualTo "allunits") exitWith {allUnits};
	if (_ais_revive_units isEqualTo "allplayers") exitWith {_allPlayers};	// at this point only as a dummy. Cause everytime every player will auto-init, regardless what the setup will say.
	if (_ais_revive_units isEqualTo "allplayables") exitWith {if (isMultiplayer) then {playableUnits} else {switchableUnits}};
	if (_ais_revive_units isEqualTo "allunitsblufor") exitWith {allUnits select {(side _x) isEqualTo blufor}};
	if (_ais_revive_units isEqualTo "allunitsopfor") exitWith {allUnits select {(side _x) isEqualTo opfor}};
	if (_ais_revive_units isEqualTo "allunitsindfor") exitWith {allUnits select {(side _x) isEqualTo resistance}};
	if (_ais_revive_units isEqualTo "allunitscivilian") exitWith {allUnits select {(side _x) isEqualTo civilian}};
	diag_log "AIS ERROR: Issue in Setup-File found! Parameter AIS_REVIVE_UNITS wrong defined."; []
};
{
	_x removeAllEventHandlers "HandleHeal";
	_x addEventHandler ["HandleHeal", {_this call AIS_System_fnc_handleHeal}];
	
	if (_x getVariable ["ais_unconscious", false]) then {
		if (!isNull(_x getVariable ["ais_DragDrop_Player", objNull])) then {
			_x switchMove "AinjPpneMrunSnonWnonDb";
		} else {
			_x playActionNow "agonyStart";
		};
	};
	
	true
} count _init_units;


ais_medequip_array = [];
if (AIS_TOGGLE_RADIO) then {
	[true] call AIS_Effects_fnc_toggleRadio;
};

// JIP in a unconscious AI... and avoid cheating by left in lobby...
if (_player getVariable ["ais_unconscious", false]) then {
	[{[(_this select 0)] call AIS_System_fnc_setUnconscious}, [_player]] call AIS_Core_fnc_onNextFrame;
};

inGameUISetEventHandler ["Action", "_this call AIS_System_fnc_overrideHealAction"];


_respawnDelay = getMissionConfigValue ["respawnDelay", 0];
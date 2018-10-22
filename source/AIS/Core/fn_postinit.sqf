if (ais_ace_shutdown) exitWith {["AIS: AIS shutdown itself cause ACE mod was detected. ACE and AIS cant work at the same time."] call BIS_fnc_logFormat};
#include "..\AIS_SETUP.sqf"

if (isServer) then {
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

	// run the init for all units present by game/mission start
	_init_units = _init_units - _allPlayers;
	//diag_log format ["ais init units: %1", _init_units];
	if (count _init_units > 0) then {
		{
			[_x] call AIS_Core_fnc_aisInitHost;
			true
		} count _init_units;
	};
	
	addMissionEventHandler ["HandleDisconnect", {_this call AIS_Core_fnc_handleDisconnect}];
};

if (isNil "AIS_MEDEVAC_STATIONS") then {
	AIS_MEDEVAC_STATIONS = [];
} else {
	if !(AIS_MEDEVAC_STATIONS isEqualType []) then {
		AIS_MEDEVAC_STATIONS = [];
		["AIS: AIS_MEDEVAC_STATIONS wasnt defined in the correct way."] call BIS_fnc_logFormat;
	};
};

if (isDedicated || !hasInterface) exitWith {};

// This is needed to provide a player object for zeus controlled units. Important to ensure that player is not null here (which is done in autoload).
AIS_Core_realPlayer = player;
AIS_Core_realPlayer call AIS_Core_fnc_aisInitPlayer;
AIS_Core_realSide = getNumber (configfile >> "CfgVehicles" >> (typeOf AIS_Core_realPlayer) >> "side");

[{
    // There is no command to get the current player but BI has an variable in mission namespace we can use.
	private _currentPlayer = missionNameSpace getVariable ["bis_fnc_moduleRemoteControl_unit", player];	// Psycho: isNull until a unit is remote controlled
    
    // If the player changed we trigger an event and update the global variable.
    if (AIS_Core_realPlayer != _currentPlayer) then {
		removeAllActions AIS_Core_realPlayer;
		AIS_Core_realPlayer enableAI "TEAMSWITCH";
		
        ["AIS_playerChanged", [_currentPlayer, AIS_Core_realPlayer]] call AIS_Core_fnc_triggerEvent;
		
        AIS_Core_realPlayer = _currentPlayer;
		AIS_Core_realSide = getNumber (configfile >> "CfgVehicles" >> (typeOf AIS_Core_realPlayer) >> "side");
    };
}] call AIS_Core_fnc_onEachFrame;

true call AIS_Core_fnc_Interaction_loop;

if (AIS_SHOW_DIARYINFO) then {
	call AIS_System_fnc_diary;
};

true spawn {
	waitUntil {time > 0};
	AIS_Core_3DEHId = addMissionEventHandler ["Draw3D", {_this call AIS_Effects_fnc_draw3D}];
};
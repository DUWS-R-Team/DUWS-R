/*
 * Author: Psycho
 
 * Disable the respawn button for given time.
 
 * Arguments:
	1: Key (Number)
 
 * Return value:
	Bool
*/
disableSerialization;
waitUntil {!(isNull (findDisplay 49))};

_downTime = player getVariable ["ais_protector_delay", 0];
private _delay = _downTime + AIS_DISABLE_RESPAWN_BUTTON - 6;
private _ctrl = (findDisplay 49) displayCtrl 1010;

while {!isNull (findDisplay 49) && {diag_tickTime < _delay}} do {
	_ctrl ctrlEnable false;
	_ctrl ctrlSetText format ["Respawn Disabled (%1 sec)", [(_delay - diag_tickTime)] call AIS_System_fnc_secondsToString];
	uisleep 0.08;
};

if (!ctrlEnabled _ctrl) then {
	_ctrl ctrlEnable true;
	_ctrl ctrlSetText "Respawn";
};


true
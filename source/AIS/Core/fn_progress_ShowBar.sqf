/*
 * Author: NetFusion
 * modified/changed by Psycho
 
 * Generate progress bar dialog and pass trough the code what's to do after finish or abort the progress.
 
 * Arguments:
	0: Title (String)
	1: duration in sec (Integer)
	2: callback (Code)
	3: arguments for callback (Object or Array)
	4: onAbort (optional) (Code)
	5: doAbort (optional) (Bool)
 
 * Return value:
	nothing
*/




private _title = _this select 0;
_duration = _this select 1;
_callback = _this select 2;
_arguments = _this select 3;
_onAbort = if (count _this > 4) then {_this select 4} else {{}};
_doAbort = if (count _this > 5) then {_this select 5} else {false};		// added by Psycho
_endTime = time + _duration;
_affectingObject = if (typeName _arguments == "ARRAY") then {_arguments select 0} else {_arguments};

if (typeName _affectingObject == "OBJECT") then {
    if (_affectingObject getVariable ["AIS_Core_Progress_inUse", false]) exitWith {
		["Object in use" call XOrangeText] call AIS_Core_fnc_dynamicText;
    };

    _affectingObject setVariable ["AIS_Core_Progress_inUse", true, true];
};

closeDialog 0;
createDialog "AIS_Core_Progress_BarDlg";

_texts = player getVariable ["AIS_Core_displayText", []];
_texts pushBack ("(" + _title + ")");
player setVariable ["AIS_Core_displayText", _texts, true];

disableSerialization;
_progressBar = uiNamespace getVariable "AIS_Core_Progress_ProgressBar";

_progressBar ctrlSetPosition [safeZoneX + 0.298906 * safeZoneW, safeZoneY + 0.082 * safeZoneH, 0.407344 * safeZoneW, 0.011 * safeZoneH];
_progressBar ctrlCommit (_duration / accTime);

_time = time;

//waitUntil {!dialog || time > _endTime || !alive player || _doAbort};
while {dialog && {time < _endTime} && {alive player} && {!_doAbort}} do {
	sleep 0.5;
	[_title, ((time - _time) / (_duration)) min 1] spawn AIS_Core_fnc_progress_showBarText;
};

closeDialog 0;

_texts = _texts - ["(" + _title + ")"];
player setVariable ["AIS_Core_displayText", _texts, true];

if (time > _endTime) then {
    _arguments spawn _callback;
} else {
    ["Abbort..."] call AIS_Core_fnc_dynamicText;
    _arguments spawn _onAbort;
};

if (typeName _affectingObject == "OBJECT") then {
    _affectingObject setVariable ["AIS_Core_Progress_inUse", false, true];
};
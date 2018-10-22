/*
	Author: NetFusion
	Description:
	Continuously checks whether an action should be added to the cursorTarget.
	Parameter(s):
	- 
    Remarks:
    * Should only be called once per mission.
    
	Returns:
	-
	Example:
	-
*/

AIS_Core_lastCursorTarget = objNull;

[{
    _cursorTarget = cursorTarget;
    if (_cursorTarget isEqualTo AIS_Core_lastCursorTarget || {player distance _cursorTarget > 15}) exitWith {};	// psycho: prevent cycling trough cursorTargets more than 15m away (engine limitation is 15m for every action)
    AIS_Core_lastCursorTarget = _cursorTarget;
    
	private _objActions = _cursorTarget getVariable ["AIS_Core_actionStorage", []];
    {
        _x params ["_onObject", "_text", "_distance", "_condition", "_callback", "_args", "_formated"];
        
        if (!(_x in _objActions)) then {
            if ((_onObject isEqualType "" && {_cursorTarget isKindOf _onObject}) || (_onObject isEqualType objNull && {_cursorTarget isEqualTo _onObject})) then {
                private _action = _cursorTarget addAction [_text, _callback, _args, 1.5, true, true, "", _condition, _distance];
                _objActions pushBack _x;
				
				if (_formated != "") then {
					_cursorTarget setUserActionText [
						_action,
						_text,
						format [_formated, _text],
						""
					];
				};
            };
        };
        nil
    } count (missionNamespace getVariable ["AIS_Core_actionStorage", []]);

	_cursorTarget setVariable ["AIS_Core_actionStorage", _objActions]; //@todo maybe init array and remove this line - this requires module dependencies
}] call AIS_Core_fnc_onEachFrame;
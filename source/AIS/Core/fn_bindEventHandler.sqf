/*
    Arma Mission Enhancement - Core\Events\fn_bindEventHandler.sqf
    
    Author: NetFusion

    Description:
    Bind an EH for a custom event. This EH will be called when the event is triggered.
	
    Parameter(s):
    - 0: STRING - the name of the event
    - 1: CODE   - the code which get called (_this select 0 will be the data, _this select 1 will be the params)
    - 2: ARRAY  - the params passed to the code (optional)
	
    Returns:
    -
    Example:
	
    ["playerChanged", { hint "Player has changed"; }] call AIS_Core_fnc_bindEventHandler;
*/


params ["_name", "_code", ["_params", []]];

// Form the name of the EH storage
_name = format ["AIS_Core_eventHandlersFor%1", _name];

// Push the data on the EH array (specific by name).
private _eventHandlers = missionNamespace getVariable [_name, []];
_eventHandlers pushBack [_code, _params];
missionNamespace setVariable [_name, _eventHandlers];
/*
    Arma Mission Enhancement - Core\Events\fn_triggerEvent.sqf
    
    Author: NetFusion

    Description:
    Triggers an custom event. This should call all previously bound EH for the specific event.

    Parameter(s):
    - 1: STRING - the name of the event
    - 2: ARRAY  - the data which gets passed to all EH (optional)

    Returns:
    -

    Example:
    ["myEvent", [1, 2, 3]] call AIS_Core_fnc_triggerEvent;
*/


params ["_name", ["_data", []]];

//player sideChat ("Event: " + _name);

// Form the name of the EH storage
_name = format ["AIS_Core_eventHandlersFor%1", _name];
private _eventHandlers = missionNamespace getVariable [_name, []];

// Set the default return value to false.
AIS_Core_eventReturn = nil;

// Cycle through all EHs and call them with the given data and their params
{
    _x params ["_code", "_params"];

    [_data, _params] call _code;
    nil
} count _eventHandlers;

//@todo find a better way for returning stuff
if (!isNil "AIS_Core_eventReturn") then {
    AIS_Core_eventReturn
} else {
    nil
};

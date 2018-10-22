/*
    Arma Mission Enhancement - Core\Events\fn_onEachFrame.sqf
    
    Author: NetFusion
	
    Description:
    Adds an OEF EHs. The EH will be called on each frame with a custom delay between the calls.
	
    Parameter(s):
    - 1: CODE   - the code which is called (_this select 0 will be the EH id, _this select 1 will be the params)
    - 2: SCALAR - the delay between two code calls in seconds (optional)
    - 3: ARRAY  - the parameters which get passed to the code on call (optional)
	
    Returns:
    -
	
    Example:
    [{ hint (str diagFrameNo); }] call AIS_Core_fnc_onEachFrame;
*/


params [
	"_code",
	["_delay", 0],
	["_params", []]
];

// Push the data on the OEF EH array.
private _onEachFrameData = missionNamespace getVariable ["AIS_Core_onEachFrameData", []];
_onEachFrameData pushBack [_code, _delay, diag_tickTime + _delay, _params];
missionNamespace setVariable ["AIS_Core_onEachFrameData", _onEachFrameData];
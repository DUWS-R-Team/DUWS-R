/*
    Arma Mission Enhancement - Core\Events\fn_initEvents.sqf
    Author: NetFusion
    Changed: Psycho - expand function with "next-frame" and "waitUntil" elements
	
    Description:
    Adds a loop which call all OEF EHs. Will be called by autoload for client and server. There is no need to call it manually.
	
    Parameter(s):
    -
	
    Returns:
    -
	
    Example:
    -
*/

AIS_nextFrameNo = diag_frameno + 1;
// PostInit can be 2 frames after preInit, need to manually set AIS_nextFrameNo, so new items get added to buffer B while processing A for the first time:
AIS_nextFrameBufferA = [[[], {AIS_nextFrameNo = diag_frameno;}]];
AIS_nextFrameBufferB = [];
AIS_waitUntilAndExecArray = [];


AIS_Core_eachFrameHandlerId = addMissionEventHandler ["EachFrame", {
    
	// Execute per frame handlers
	// Fetch all OEF EHs from missionNamespace.
	private _onEachFrameHandler = missionNamespace getVariable ["AIS_Core_onEachFrameData", []];
    {
        _x params ["_code", "_delay", "_nextExecTime", "_params"];

        // If the execution time is up call the function.
        if (diag_tickTime > _nextExecTime) then {
            // Set the new execution time depending on the provided delay.
            _x set [2, _nextExecTime + _delay];

            [_forEachIndex, _params] call _code; //@todo if an EH removed itself the next EH may be skipped
        };
    } forEach _onEachFrameHandler;
	

	// Execute the exec next frame functions (from CBA)
	if (count AIS_nextFrameBufferA > 0) then {
		{
			(_x select 0) call (_x select 1);
			false
		} count AIS_nextFrameBufferA;
		// Swap double-buffer:
		AIS_nextFrameBufferA = AIS_nextFrameBufferB;
		AIS_nextFrameBufferB = [];
		AIS_nextFrameNo = diag_frameno + 1;
	};
	
	
	// handle the waitUntil and execute function (from CBA)
	if (count AIS_waitUntilAndExecArray > 0) then {
		private _delete = false;
		{
			// if condition is satisfied call statement
			if ((_x select 2) call (_x select 0)) then {
				(_x select 2) call (_x select 1);
				AIS_waitUntilAndExecArray set [_forEachIndex, objNull];
				_delete = true;
			};
		} forEach AIS_waitUntilAndExecArray;
		if (_delete) then {
			AIS_waitUntilAndExecArray = AIS_waitUntilAndExecArray - [objNull];
		};
	};

	// remove the pfh if client left the mission
    if (getClientState == "GAME FINISHED") then {
		removeMissionEventHandler ["EachFrame", AIS_Core_eachFrameHandlerId];
    };
}];
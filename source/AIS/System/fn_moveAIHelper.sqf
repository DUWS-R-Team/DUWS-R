/*
 * Author: Psycho
 
 * Make the AI moving to a injured unit and start the revive.
 
 * Arguments:
	0: Injured unit (Object)
	1: Helper AI (Object)
 
 * Return value:
	Nothing
*/

params ["_injured", "_helper"];

// help not longer needed or possible
if (
	!alive _helper ||
	!alive _injured ||
	(!(_injured getVariable ["ais_unconscious", false])) ||
	(_helper getVariable ["ais_unconscious", false]) ||
	(!isNull (_injured getVariable ["ais_hasHelper", objNull]))
) exitWith {
	if (alive _helper) then {
		_helper enableAI "AUTOCOMBAT";
	} else {
		if (alive _injured && {!isPlayer _injured}) then {
			[_injured] call AIS_System_fnc_AIselfCheck;	// check if another helper is avalible
		};
	};
};

// AI instructions
if (behaviour _helper != "AWARE") then {_helper setBehaviour "AWARE"};	// better "SAFE" ???
_helper disableAI "AUTOCOMBAT";
_helper allowFleeing 0;

if (currentCommand _helper != "MOVE") then {
	_helper stop false;
	_helper doMove (position (vehicle _injured));
};

// if injured is in vehicle helper wont go that close --> have to increase the shortest distance
_dist = if (!isNull objectParent _injured) then {(sizeOf (typeOf (vehicle _injured)) / 2) + 1} else {3};

// start revive if close enough and ready for handling. Otherwise reset and repeat searching loop.
if (_helper distance2D (vehicle _injured) < _dist) exitWith {
	if (isNull (_injured getVariable ["ais_hasHelper", objNull])) then {
		_helper disableAI "AUTOCOMBAT";
		[_helper, _injured] spawn AIS_System_fnc_ReviveAI;
	} else {
		_helper enableAI "AUTOCOMBAT";
		[_injured] call AIS_System_fnc_AIselfCheck;
	};
};

// if not close enough start the function in a few seconds again
private _acc_time = diag_tickTime + 5;
[{diag_tickTime > (_this select 2)}, {_this call AIS_System_fnc_moveAIHelper}, [_injured, _helper, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;


true
/*
 * Author: Psycho
 
 * Start to init a unit. It's a public function.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	[_unit] call AIS_System_fnc_loadAIS;
 */

params ["_unit"];
if (!isNil {_unit getVariable "ais_aisInit"}) exitWith {};

if (isServer) then {

	if (local _unit) then {
		[_this select 0] call AIS_Core_fnc_aisInitHost;
	} else {
		_id = owner _unit;
		[_unit] remoteExecCall ["AIS_System_fnc_loadAISlocalToPlayer", _id, false];
	};

} else {

	if (local _unit) then {
		[_unit] call AIS_System_fnc_loadAISlocalToPlayer;
	} else {
		[[_unit], {
			if (isServer) then {
				[_this select 0] call AIS_Core_fnc_aisInitHost;
			};
		}] remoteExec ["call"];
	};
	
};


true
/*
 * Author: Psycho
 
 * Stabilize a unit. A stabilized unit stop to bleed and cant die trough the revive timer.
 
 * Arguments:
	0: Unit Helper (Object)
	1: Unit wounded (Object)
 
 * Return value:
	-
*/

params ["_healer", "_injured"];


_injured setVariable ["ais_hasHelper", _healer, true];

//_injured playMove "AinjPpneMstpSnonWrflDnon_rolltoback";	// from AIS fsm
[_injured, "AinjPpneMstpSnonWrflDnon_rolltoback"] remoteExec ["playMove", 0];

// switch to primary weapon if possible. Small delay for handling is needed.
if (primaryWeapon _healer != "") then {
	_healer switchmove "amovpercmstpsraswrfldnon";
	_healer selectWeapon (primaryWeapon _healer);
};

_healer playAction "medicStart";

// full heal anim only with primary weapon possible. 
ais_animChangeEVH = _healer addEventhandler ["AnimChanged", {
	params ["_healer","_anim"];
	if (primaryWeapon _healer isEqualTo "") then {
		if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
			_healer playActionNow "medicStart";
		};
	};
}];

_offset = [0,0,0]; _dir = 0;
_relpos = _healer worldToModel position _injured;
if (((_healer getDir _injured) - (_injured getDir _healer)) < 0) then {_offset = [-0.2,0.7,0]; _dir = 90} else {_offset = [0.2,0.7,0]; _dir = 270};

_injured attachTo [_healer, _offset];
[_injured, _dir] remoteExec ["setDir", 0, false];

[_healer, _injured] call AIS_Effects_fnc_medEquip;
private _duration = [_healer, _injured] call AIS_System_fnc_calculateStabilizeTime;
//hint format ["Stabilize Time Duration: %1", _duration];	// debug


[
    "Stabilize the Injured", 
    _duration,
    {
		params ["_injured", "_healer"];

		_injured setVariable ["ais_stabilized", true, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;

		_healer playAction "medicStop";

		_injured setVariable ["ais_hasHelper", ObjNull, true];
		call AIS_Effects_fnc_garbage;
    },
    [_injured, _healer],
	{
		params ["_injured", "_healer"];

		_injured setVariable ["ais_hasHelper", ObjNull, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;
		
		call AIS_Effects_fnc_garbage;
		
		if (alive _healer) then {
			_healer playActionNow "medicStop";
		};
		if (!alive _injured) then {["He is not with us anymore."] call AIS_Core_fnc_dynamicText};
	},
	(!alive _injured || _healer getVariable ["ais_unconscious", false])
] call AIS_Core_fnc_Progress_ShowBar;


true
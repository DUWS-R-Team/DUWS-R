/*
 * Author: Psycho
 
 * Handle Revive actions from a AI.
 
 * Arguments:
	0: Healer Unit (Object)
	1: Injured Unit (Object)
 
 * Return value:
	Nothing
*/

params [
	["_healer", player, [player]],
	"_injured"
];

_injured setVariable ["ais_hasHelper", _healer, true];

_behaviour = behaviour _healer;

// move the wounded out of the vehicle
if (!isNull objectParent _injured) exitWith {
	[[_injured, vehicle _injured, 0], {_this call AIS_System_fnc_moveCargoRemote}] remoteExec ["call"];
	_acc_time = diag_tickTime + 1.382;
	[{diag_tickTime > (_this select 2)}, {[_this select 0, _this select 1] spawn AIS_System_fnc_ReviveAI}, [_healer, _injured, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
};

[_injured, "AinjPpneMstpSnonWrflDnon_rolltoback"] remoteExec ['playMove', 0];

// switch to primary weapon if possible. Small delay for handling is needed.
if (primaryWeapon _healer != "") then {
	_healer selectWeapon primaryWeapon _healer;
	sleep 0.5;
};

_healer setPos (getPos _injured);	// avoid to move the injured a few metres away
[_healer, "medicStart"] remoteExec ['playAction', 0];

_healer stop true;
{_healer disableAI _x; true} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];

_offset = [0,0,0]; _dir = 0;
_relpos = _healer worldToModel position _injured;
if ((_relpos select 0) < 0) then {_offset = [-0.2,0.7,0]; _dir = 90} else {_offset = [0.2,0.7,0]; _dir = 270};

_injured attachTo [_healer, _offset];
[_injured, _dir] remoteExec ["setDir", 0, false];

private _duration = [_healer, _injured] call AIS_System_fnc_calculateReviveTime;


private _startTime = diag_tickTime + _duration;
waitUntil {
	diag_tickTime > _startTime ||
	!alive _healer ||
	!alive _injured ||
	_healer getVariable ["ais_unconscious", false]
};

_injured setVariable ["ais_hasHelper", ObjNull, true];

detach _healer;
detach _injured;

if (!alive _healer || _healer getVariable ["ais_unconscious", false]) exitWith {};
_healer playActionNow "medicStop";

_healer stop false;
{_healer enableAI _x; true} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
_healer setBehaviour _behaviour;


if (alive _injured) then {
	_injured setVariable ["ais_unconscious", false, true];
	
	// healing if enabled
	if (AIS_REVIVE_HEAL) then {
		_injured setDamage 0;
		_injured setVariable ["ais_fireDamage", 0];
	} else {
		// make sure the unit can walk after revive
		if ((_injured getHitIndex 10) > 0.49) then {
			[{(_this select 0) setHitIndex [10, 0.49]}, [_injured]] call AIS_Core_fnc_onNextFrame;
		};
	};

	[_injured] remoteExecCall ["AIS_System_fnc_restoreFaks", _injured, false];
	
	if (isPlayer _injured) then {
		[true] remoteExec ['showHud', _injured];
		if (AIS_TOGGLE_RADIO) then {
			[true] remoteExecCall ["AIS_Effects_fnc_toggleRadio", _injured, false];
		};
	} else {
		_injured stop false;
		{_injured enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
	};
	
	[_injured, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0]; 
	[_injured, false] remoteExec ["setCaptive", 0, false];
	
	["GetOutMan"] remoteExec ["removeAllEventHandlers", _injured, false];
};


true
/*
 * by Psycho

 * Arguments:
 * 0: Unit That Was Hit (Object)
 * 1: Hit Selection (String)
 * 2: Damage (Number)
 * 3: Shooter (object)
 * 4: Projectile (string)
 * 5: HitPartIndex (number)
 * 6: Instigator (object)
 * 7: HitPoint CfgName (String)

 * Return Value:
 * Damage
*/

/*		allHitPointsDamage
[
	["HitFace","HitNeck","HitHead","HitPelvis","HitAbdomen","HitDiaphragm","HitChest","HitBody","HitArms","HitHands","HitLegs"],
	["face_hub","neck","head","pelvis","spine1","spine2","spine3","body","arms","hands","legs"],
	[0,0,0,0,0,0,0,0,0,0,0]
]
*/

params [
	"_unit",			// Object the event handler is assigned to.
	"_hitSelection",	// Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.
	"_damage",			// Resulting level of damage for the selection.
	"_source",			// The source unit (shooter) that caused the damage.
	"_projectile",		// Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.) (String)
	"_hitPartIndex",	// Hit part index of the hit point, -1 otherwise.
	"_instigator",		// Person who pulled the trigger. (Object)
	"_hitPoint"			// hit point Cfg name (String)
];

// remote Units
if !(local _unit) exitWith {false};
if (_damage == 0) exitWith {[_unit, _hitPartIndex] call AIS_Damage_fnc_exitDamageHandler};
// forbite forther damage when unit is already unconcious
if (AIS_DISABLE_FURTHER_DAMAGE && {_unit getVariable ["ais_unconscious", false]}) exitWith {0.89};
// dead unit
if (_unit getVariable ["AIS_UnitIsDead", false]) exitWith {0.89};
// unknown part selection
if (_hitSelection == "?") exitWith {[_unit, _hitPartIndex] call AIS_Damage_fnc_exitDamageHandler};
// new damage of the selected part
private _new_damage = if (_hitPartIndex >= 0) then {_damage - (_unit getHitIndex _hitPartIndex)} else {_damage - (damage _unit)};

// define where the damage come from --> possible outputs: "crash", "smallfire", "bigfire", "falling", "bullet", "grenade", "baaam"
_damageType = [_unit, _hitSelection, _new_damage, _source, _projectile, _hitPartIndex] call AIS_Damage_fnc_verifyDamageType;

// handle the damage from a fire
if (_damageType isEqualTo "smallfire") exitWith {[_unit, _hitPartIndex] call AIS_Damage_fnc_exitDamageHandler};
if (_damageType isEqualTo "bigfire") then {
	_fire_damage = _unit getVariable ["ais_fireDamage", 0];
	// fire damage is everytime at index -1, part "" --> set the part to "body" and avoid real overall damage
	_hitSelection = "body";
	_this set [1, _hitSelection];
	_new_damage = _fire_damage;	// point where we can change the influence of fire
	_unit setVariable ["ais_fireDamage", 0];
};

// exit if the damage is only minor or we have a negative hitpart index
if (_new_damage < 0.05) exitWith {[_unit, _hitPartIndex] call AIS_Damage_fnc_exitDamageHandler};

// handle the damage of falling (adapted from ACE3)
if (_damageType isEqualTo "falling") then {
    if !(_hitSelection in ["", "legs"]) then {
		_new_damage = [
			_new_damage * 0.5,
			_new_damage * abs(_unit getVariable ["ais_impactVelocity", _impactVelocity]) / 50
		] select (_hitSelection isEqualTo "body");
        _new_damage = if (_new_damage < 0.1) then {0}; //Filter minor falling damage to non-leg hitpoints
    } else {
        if (_hitSelection isEqualTo "") then {
            _hitSelection = "legs";
            _this set [1, _hitSelection];
        };
        _new_damage = _new_damage * 0.7;
    };
};

// handle the damage of a crash. Remove the overall damage and bring the damage to a random defined body part.
if (_damageType isEqualTo "crash") then {
    if (_hitSelection isEqualTo "") then {
		_hitSelection = selectRandom ["head", "hands", "legs"];
        _this set [1, _hitSelection];
    };
	private _min = [1, 0.89] select (_hitSelection isEqualTo "head");
	_new_damage = if (_new_damage < 0.1) then {0} else {_new_damage min _min};
};


/*
For some reason the engine won't handle the damage to the new(changed) body part. (Bug?) The damage will everytime go to the original part.
So we have to set the damage by ourself to the wanted hitPartIndex.
*/
_hitPart = [_unit, _hitSelection] call AIS_Damage_fnc_getHitIndexValue;
_damage = (_hitPart select 2) + (_new_damage * AIS_DAMAGE_TOLLERANCE_FACTOR);

// bullet/splitter impact post process effects
if (AIS_IMPACT_EFFECTS) then {
	if (_damageType in ["grenade", "bullet"]) then {
		if (isPlayer _unit) then {
			[_unit, _damage] call AIS_Effects_fnc_bulletImpact;
		};
	};
};

// if there is no revive guarantee, handle a realistic mode. Now we have random chance to die. The risk is increasing with higer damage values and some type of damages. (explos and grenades)
if !(AIS_REVIVE_GUARANTY) then {
	private _critical_hit = false;
	// vehicle blow-up is everytime critical. Set to dead...
	if (!(isNull objectParent _unit)) then {
		if (damage (vehicle _unit) >= 1) exitWith {
			[_unit,_source] call AIS_Damage_fnc_goToDead;
		};
	};
	// critical hit trough explos?
	if (_damageType in ["grenade", "baaam"] && {_hitSelection in ["pelvis", "head", "body"]}) then {
		if (_damage > 1 && {(0.7 + ((0.05 * (_damage - 1)) * 10)) > random 2}) then {
			_critical_hit = true;
		};
	};
	// critical hit caused by a head shoot?
	if (_damageType isEqualTo "bullet" && {_hitSelection isEqualTo "head"}) then {
		if (_damage > 1.2 && {(0.6 + ((0.05 * (_damage - 1)) * 10)) > random 2}) then {
			_critical_hit = true;
		};
	};
	
	// unit is instant death - no revive chance
	if (_critical_hit) exitWith {[_unit,_source] call AIS_Damage_fnc_goToDead};
};

// if a stabilized unit become new damage they won't be longer in the stbilized state
_unit setVariable ["ais_stabilized", false, true];

// unit can die if they get to mutch new damage in unconscious mode
if ((diag_tickTime > _unit getVariable ["ais_protector_delay", 0]) && {_unit getVariable ["ais_unconscious", false]}) exitWith {
	if (_damage > 0.9) then {[_unit,_source] call AIS_Damage_fnc_goToDead};
	_damage = _damage min 0.89;
	_damage
};


// not dead? From this point only unconsciousness is possible
private _set_unconscious = false;
// if the unit is in a exploding vehicle...
if (!(isNull objectParent _unit)) then {
	if (damage (vehicle _unit) >= 1) then {
		[{_this call AIS_System_fnc_checkUnload}, {
			[[_this select 0, _this select 1, 0], {_this call AIS_System_fnc_moveCargoRemote}] remoteExec ["call"]
		}, [_unit, vehicle _unit]] call AIS_Core_fnc_waitUntilAndExecute;
		_set_unconscious = true;
	};
};
if ((_damage > 0.9) && {_hitSelection in ["", "head", "body"]}) then {
	_set_unconscious = true;
};
// more attention to closer explosives
if ((_damage > 1.5) && {_hitSelection in ["pelvis", "head", "body"]} && {_damageType in ["grenade", "baaam"]}) then {
	_set_unconscious = true;
};
if (_set_unconscious && {!(_unit getVariable ["ais_unconscious", false])}) then {
	[{[(_this select 0)] call AIS_System_fnc_setUnconscious}, [_unit]] call AIS_Core_fnc_onNextFrame;
	// need this delay to prevent new damage for some seconds after the unit go unconscious. after the delay it is possible to kill the unit when they get to much new damage.
	_unit setVariable ["ais_protector_delay", (diag_tickTime + 6)];
	
	// kill message and score point
	if (!isNull _source && {isPlayer _source}) then {
		if (side _source != side _unit) then {
			[_source, 1] remoteExec ["addScore", 2];
		} else {
			[_source, -1] remoteExec ["addScore", 2];
		};
		if (isPlayer _unit) then {
			_text = format ["%1 was seriously wounded by %2", name _unit, name _source];
			[_text] remoteExec ["systemChat", 0];
		};
	};
};

_damage = _damage min 0.89;
//diag_log format ["Selection: %1 --- Damage1: %2 --- Damage2: %3 --- partIndex: %4 --- Projectile: %5 ----> %6", _hitSelection, _damage, (_hitPart select 2), _hitPartIndex, _projectile, diag_frameno];

_unit setHitIndex [_hitPart select 1, _damage];
_damage
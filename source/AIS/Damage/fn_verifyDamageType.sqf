params ["_unit", "_hitSelection", "_new_damage", "_source", "_projectile", "_hitPartIndex"];
private _damageType = "";

// Vehicle crash?
private _vehicle = vehicle _unit;
if (!(isNull objectParent _unit) && {_projectile isEqualTo ""} && {_hitSelection isEqualTo ""} && {_source in [objNull, driver _vehicle, _vehicle]} && {!(_vehicle isKindOf "StaticWeapon")}) exitWith {
	"crash"
};

// Fire? save the micro damages to an storage. Fire is everytime on selection == "".
if ((_projectile isEqualTo "") && {_new_damage < 0.05}) exitWith {
	if ((_new_damage + (_unit getVariable ["ais_fireDamage", 0])) > 0.15) then {
		"bigfire"
	} else {
		if !(_unit getVariable ["ais_uncoscious", false]) then {	// protect from fire if unconscious
			_unit setVariable ["ais_fireDamage", (_unit getVariable ["ais_fireDamage", 0]) + _new_damage];
		};
		"smallfire"
	};
};

// Unit is falling? Detect a falling unit and reduce their damage depending on affected body part
private _impactVelocity = (velocity _unit) select 2;
if (_impactVelocity < -5 && {isNull objectParent _unit}) then {
    _unit setVariable ["ais_impactVelocity", _impactVelocity];
	_damageType = "falling";
};

// Bullet?
{
	if (_projectile isKindOf _x) exitWith {
		_damageType = "bullet";
	};
} count ["BulletBase", "ShotgunBase"];

// Grenade?
{
	if (_projectile isKindOf _x) exitWith {
		_damageType = "grenade";
	};
} count ["Grenade", "GrenadeCore"];

// Explosion?
{
	if (_projectile isKindOf _x) exitWith {
		_damageType = "baaam";
	};
} count ["TimeBombCore", "BombCore", "MineCore", "FuelExplosion", "ShellBase", "RocketBase", "MissileBase", "LaserBombCore"];





_damageType
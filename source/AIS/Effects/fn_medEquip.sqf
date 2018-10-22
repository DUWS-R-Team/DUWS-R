/*
 * Author: Alwarren
 
 * Spawn randomized some ambient medical equipment around the injured.
 
 * Arguments:
	0: Unit Helper (Object)
	1: Unit wounded (Object)
	
 * Example:
	[player] call AIS_Effects_fnc_medEquip;
 
 * Return value:
	-
*/

params [
	"_healer",
	"_injured"
];
if (!local _healer) exitWith {};

// spawn defi and a bloodbag
if (_healer call AIS_System_fnc_isMedic) then {
	_defi_pos = _healer modelToWorld [-0.5,0.2,0];
	_defi = "Land_Defibrillator_F" createVehicle _defi_pos;
	[_defi, [_defi_pos select 0, _defi_pos select 1, 0]] call AIS_Core_fnc_setPosAGLS;
	_defi setDir (getDir _healer - 180);
	ais_medequip_array pushBack [1,_defi];
		
	if (damage _injured >= 0.5 && {(random 2) >= 1}) then {
		_bb_pos = _healer modelToWorld [0.4,(0.2 - (random 0.5)),0];
		_bb = "Land_BloodBag_F" createVehicle _bb_pos;
		[_bb, [_bb_pos select 0, _bb_pos select 1, 0]] call AIS_Core_fnc_setPosAGLS;
		_bb setDir (random 359);
		ais_medequip_array pushBack [0,_bb];
	};
};

// spawn bandages
for "_i" from 1 to (1 + (round random 3)) do {
	_band_pos = _healer modelToWorld [(random 1.3),(0.8 + (random 0.6)),0];
	_band = "Land_Bandage_F" createVehicle _band_pos;
	[_band, [_band_pos select 0, _band_pos select 1, 0]] call AIS_Core_fnc_setPosAGLS;
	_band setDir (random 359);
	if (_i > 1) then {
		ais_medequip_array pushBack [0,_band];
	} else {
		ais_medequip_array pushBack [1,_band];
	};
};

// spawn antibioticum
if (random 2 >= 1) then {
	_ab_pos = _healer modelToWorld [-0.8,(0.6 - (random 0.4)),0];
	_ab = "Land_Antibiotic_F" createVehicle _ab_pos;
	[_ab, [_ab_pos select 0, _ab_pos select 1, 0]] call AIS_Core_fnc_setPosAGLS;
	_ab setDir (random 359);
	ais_medequip_array pushBack [0,_ab];
};

true
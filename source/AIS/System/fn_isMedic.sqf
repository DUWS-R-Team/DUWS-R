/*
 * Author: Psycho
 
 * Chck if the unit is a medic. Also units which set manually to a medic will be found. (setUnitTrait)
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
 * Example:
	player call AIS_System_fnc_isMedic;
 */


_healer = _this;
//_isMedic = if (getNumber (configFile >> "CfgVehicles" >> (typeOf _healer) >> "attendant") == 1) then {true} else {false};
_isMedic = _healer getUnitTrait "Medic";


_isMedic
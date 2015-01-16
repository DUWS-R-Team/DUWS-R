if(isNil "VAS_init_complete") exitWith {hint "VAS never initialized.\n\nThis means CfgFunctions.hpp was never called via Description.ext";};
if(!VAS_init_complete && !vas_disableSafetyCheck) exitWith {if((time - VAS_init_timeOnStart) > 25) then {[] call VAS_fnc_mainInit;}; hint "VAS hasn't finished loading yet."};
createDialog "VAS_Diag";
disableSerialization;

ctrlShow [2507,false];
ctrlShow [2508,false];
ctrlShow [2509,false];
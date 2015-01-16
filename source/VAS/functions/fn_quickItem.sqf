/*
	File: fn_quickItem.sqf
	Author: TAW_Tonic
	
	Description:
	Used in the double clicking functionality to quickly get an item/weapon from VAS.
*/
private["_data","_handle"];
_data = (_this select 0) lbData (_this select 1);
_handle = [_data,true,false,false,false] spawn VAS_fnc_handleItem;
waitUntil {scriptDone _handle};
[] spawn VAS_fnc_playerDisplay;
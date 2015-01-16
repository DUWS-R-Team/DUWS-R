/*
	File: fn_quickItem.sqf
	Author: TAW_Tonic
	
	Description:
	Used in the double clicking functionality to quickly get an item/weapon from VAS.
*/
private["_data","_handle"];
_data = (_this select 0) lbData (_this select 1);
[_data,true,false,false,false] call VAS_fnc_handleItem;
uiNamespace setVariable["VAS_UI_FILTER","mags"];
uiNamespace setVariable ["VAS_UI_FILTER_VAR",nil];
uiNamespace setVariable ["VAS_UI_QuickMag",true];
[] spawn VAS_fnc_playerDisplay;
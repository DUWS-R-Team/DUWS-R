/*
	File: fn_qRemoveItem.sqf
	Author: TAW_Tonic
	
	Description:
	Used in the double click removal function of VAS.
*/
private["_data","_handle"];
_data = (_this select 0) lbData (_this select 1);
[_data,false,false,false,false] call VAS_fnc_handleItem;
[] spawn VAS_fnc_playerDisplay;
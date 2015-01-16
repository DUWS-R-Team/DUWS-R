/*
	@version: 1.0
	@file_name: misc_functions.sqf
	@file_author: TAW_Tonic
	@file_edit: 5/23/2013
	@file_description: A file of functions that well.. just weren't fat enough to make it to its own file.. EAT MORE PIE FUNCTIONS... EAT MORE PIE...
*/
VAS_fnc_openDetails =
{
	#include "macro.sqf"
	ctrlShow [VAS_detail_mags_list,true];
	ctrlShow[VAS_detail_mags,true];
	ctrlShow [VAS_detail_magsbg,true];
};

VAS_fnc_closeDetails =
{
	#include "macro.sqf"
	ctrlShow [VAS_detail_mags_list,false];
	ctrlShow[VAS_detail_mags,false];
	ctrlShow [VAS_detail_magsbg,false];
};

VAS_fnc_quickMag =
{
	private["_data","_handle"];
	_data = (_this select 0) lbData (_this select 1);
	[_data,true,nil,nil,nil] call VAS_fnc_handleItem;
	uiNamespace setVariable["VAS_UI_FILTER","mags"];
	uiNamespace setVariable ["VAS_UI_FILTER_VAR",nil];
	[] spawn VAS_fnc_playerDisplay;
};

VAS_fnc_quickItem =
{
	private["_data","_handle"];
	_data = (_this select 0) lbData (_this select 1);
	_handle = [_data,true,nil,nil,nil] spawn VAS_fnc_handleItem;
	waitUntil {scriptDone _handle};
	[] spawn VAS_fnc_playerDisplay;
};

VAS_fnc_qRemoveItem =
{
	private["_data","_handle"];
	_data = (_this select 0) lbData (_this select 1);
	[_data,false,nil,nil,nil] call VAS_fnc_handleItem;
	[] spawn VAS_fnc_playerDisplay;
};
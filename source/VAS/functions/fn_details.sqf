#include "macro.sqf"
/*
	File: fn_details.sqf
	Version Edit: 2.5
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays details about the weapon mainly magazines.
*/
disableSerialization;
if((uiNamespace getvariable "VAS_UI_FILTER") != "guns" && !(uiNamespace getVariable "VAS_UI_QuickMag")) exitWith {call VAS_fnc_closeDetails;}; //Filter not on guns? exit
private["_control","_data","_control","_magazines","_details","_items","_addToLb"];
_control = _this select 0;
if(isNil {_control}) exitWith {call VAS_fnc_closeDetails;};
if((_this select 1) == -1) exitWith {call VAS_fnc_closeDetails;};
_data = (_control lbData (_this select 1));

_details = [_data] call VAS_fnc_fetchCfgDetails;
if(count _details == 0) exitWith {call VAS_fnc_closeDetails;}; //No info? Exit
if(!((_details select 4) in [1,2,4,5,4096])) exitWith {call VAS_fnc_closeDetails;}; //Not a gun? Exit
if(count (_details select 7) == 0) exitwith {call VAS_fnc_closeDetails;}; //No mags? Exit
_magazines = (_details select 7);
(VAS_getControl(VAS_Main_Display,VAS_detail_mags)) ctrlSetStructuredText parseText format["<t align='center'>%1</t>",(_details select 1)];
_control = VAS_getControl(VAS_Main_Display,VAS_detail_mags_list);
lbClear _control;

_addToLb = {
	private["_control","_item","_tmp"];
	disableSerialization;
	_control = _this select 0;
	_item = _this select 1;
	_tmp = [_item,"CfgMagazines"] call VAS_fnc_fetchCfgDetails;
	
	if(count _tmp > 0) then
	{
		_control lbAdd format["%1", (_tmp select 1)];
		_control lbSetData [(lbSize _control)-1,_x];
		_control lbSetPicture [(lbSize _control)-1,(_tmp select 2)];
	};
};

{
	if(!isNil "VAS_box_magazines") then {
		if(!(_x in VAS_box_magazines)) exitWith {};
		[_control,_x] call _addToLb;
	} else {
		if(count vas_magazines == 0) then {
			if(_x in vas_r_magazines) exitWith {};
			[_control,_x] call _addToLb;
		} else {
			if(!(_x in vas_magazines)) exitWith {};
			[_control,_x] call _addToLb;
		};
	};
} foreach _magazines;

_items = [_data] call VAS_fnc_accList;

_control = ((findDisplay 2500) displayCtrl 2851);
lbClear _control;

if(count _items > 0) then {
	{
		_cfgInfo = [_x,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
		_control lbAdd format["%1", _cfgInfo select 1];
		_control lbSetData [(lbSize _control)-1,_x];
		_control lbSetPicture [(lbSize _control)-1,_cfgInfo select 2];
	} foreach _items;
	ctrlShow[VAS_AccBG,true];
	ctrlShow[VAS_AccList,true];
} else {
	ctrlShow[VAS_AccBG,false];
	ctrlShow[VAS_AccList,false];
};

call VAS_fnc_openDetails;
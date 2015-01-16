#include "macro.sqf"
/*
	@version: 2.1
	@file_name: fn_mainDisplay.sqf
	@file_author: TAW_Tonic
	@file_edit: 11/6/2013
	@file_description: When called, sort the call and display our targeted information.
*/
private["_request","_filter","_control","_info"];
waitUntil {!isNull (findDisplay VAS_Main_Display)};
disableSerialization;
_request = _this select 0;
_filter = _this select 1;
[_request] call VAS_fnc_filterShow;

lbClear VAS_getControl(VAS_Main_Display,VAS_virt_list);
lbClear VAS_getControl(VAS_Main_Display,VAS_unit_list);

uiNamespace setVariable["VAS_UI_FILTER",_request];

if(_filter && !isNil {(uiNamespace getVariable "VAS_UI_FILTER_VAR")}) exitWith
{
	[(uiNamespace getVariable "VAS_UI_FILTER_VAR")] spawn VAS_fnc_filterMenu;
};
uiNamespace setVariable ["VAS_UI_FILTER_VAR",nil];
uiNamespace setVariable ["VAS_UI_QuickMag",false];

[] call VAS_fnc_updateLoad;

switch (_request) do
{
	case "guns":
	{
		_control = VAS_getControl(VAS_Main_Display,VAS_virt_list);
		_info = ["guns"] call VAS_fnc_fetchCfg;
		
		{
			_details = [_x,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetValue [(lbSize _control)-1,(_details select 4)]; //Value for index is type
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
		
		_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
		_info = [([] call VAS_fnc_fetchPlayerGear),[1,2,4,5,4096]] call VAS_fnc_filter;
		
		{
			_details = [_x,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetValue [(lbSize _control)-1,(_details select 4)]; //Value for index is type
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
	};
	
	case "mags":
	{
		_control = VAS_getControl(VAS_Main_Display,VAS_virt_list);
		_info = ["mags"] call VAS_fnc_fetchCfg;
		
		{
			_details = [_x,"CfgMagazines"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
		
		_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
		_info = [([] call VAS_fnc_fetchPlayerGear),"mag"] call VAS_fnc_filter;
		
		private["_mags","_mag"];
		_mags = [];
		{
			_details = [_x,"CfgMagazines"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				if(!(_x in _mags)) then
				{
					_mags set[count _mags,_x];
					_mag = _x;
					_control lbAdd format["[%1] %2",({_x == _mag} count _info),(_details select 1)]; //Displayname on list
					_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
					_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
				};
			};
		} foreach _info;
	};

	case "items":
	{
		_control = VAS_getControl(VAS_Main_Display,VAS_virt_list);
		_info = ["items"] call VAS_fnc_fetchCfg;
		
		{
			_details = [_x,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetValue [(lbSize _control)-1,(_details select 4)]; //Value for index is type
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
		
		_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
		_info = [([] call VAS_fnc_fetchPlayerGear),"items"] call VAS_fnc_filter;
		
		{
			_details = [_x,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetValue [(lbSize _control)-1,(_details select 4)]; //Value for index is type
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
	};
	
	case "packs":
	{
		_control = VAS_getControl(VAS_Main_Display,VAS_virt_list);
		_info = ["packs"] call VAS_fnc_fetchCfg;
		
		{
			_details = [_x,"CfgVehicles"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
		
		_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
		_info = [([] call VAS_fnc_fetchPlayerGear),"packs"] call VAS_fnc_filter;
		
		{
			_details = [_x,"CfgVehicles"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
	};
	
	case "glass":
	{
		_control = VAS_getControl(VAS_Main_Display,VAS_virt_list);
		_info = ["glass"] call VAS_fnc_fetchCfg;
		
		{
			_details = [_x,"CfgGlasses"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
		
		_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
		_info = [([] call VAS_fnc_fetchPlayerGear),"glass"] call VAS_fnc_filter;
		
		{
			_details = [_x,"CfgGlasses"] call VAS_fnc_fetchCfgDetails;
			if(count _details > 0) then
			{
				_control lbAdd format["%1", (_details select 1)]; //Displayname on list
				_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
				_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
			};
		} foreach _info;
	};
};
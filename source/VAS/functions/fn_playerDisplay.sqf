#include "macro.sqf"
/*
	@version: 1.2
	@file_name: fn_playerDisplay.sqf
	@file_author: TAW_Tonic
	@file_edit: 5/23/2013
	@file_description: When called, sort the call and display our targeted information.
*/
private["_control","_info","_details"];
disableSerialization;
switch((uiNamespace getVariable "VAS_UI_FILTER")) do
{
	case "guns": {_info = [([] call VAS_fnc_fetchPlayerGear),[1,2,4,5,4096]] call VAS_fnc_filter;};
	case "mags": {_info = [([] call VAS_fnc_fetchPlayerGear),"mag"] call VAS_fnc_filter;};
	case "items": {_info = [([] call VAS_fnc_fetchPlayerGear),"items"] call VAS_fnc_filter;};
	case "packs": {_info = [([] call VAS_fnc_fetchPlayerGear),"packs"] call VAS_fnc_filter;};
	case "glass": {_info = [([] call VAS_fnc_fetchPlayerGear),"glass"] call VAS_fnc_filter;};
};

if(!isNil {(uiNamespace getVariable "VAS_UI_FILTER_VAR")}) then
{
	_info = [(uiNamespace getVariable "VAS_UI_FILTER_VAR"),true] call VAS_fnc_filterMenu;
};

waitUntil {typeName _info == "ARRAY"};

_control = VAS_getControl(VAS_Main_Display,VAS_unit_list);
lbClear _control;

if((uiNamespace getVariable "VAS_UI_FILTER") == "mags") then
{
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
}
	else
{
	{
		_details = [_x] call VAS_fnc_fetchCfgDetails;
		if(count _details > 0) then
		{
			_control lbAdd format["%1", (_details select 1)]; //Displayname on list
			_control lbSetData [(lbSize _control)-1,(_details select 0)]; //Data for index is classname
			_control lbSetPicture [(lbSize _control)-1,(_details select 2)];
		};
	} foreach _info;
};
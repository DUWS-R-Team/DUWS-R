#include "macro.sqf"
/*
	@version: 1.7
	@file_name: fn_removeGear.sqf
	@file_author: TAW_Tonic
	@file_edit: 8/2/2013
	@file_description: Removes an item selected.
*/
private["_data","_handle","_all","_fil"];
_all = _this select 0;
_fil = uiNamespace getVariable "VAS_UI_FILTER";
disableSerialization;
_data = VAS_getSelData(VAS_unit_list);

switch(_all) do
{
	case true:
	{
		switch (_fil) do
		{
			case "mags": {player removeMagazines _data};
			case "items": {player removeItems _data};
		};
		[] call VAS_fnc_updateLoad;
	};
	
	case false:
	{
		[_data,false,false,false,false] call VAS_fnc_handleItem;
		
	};
};

[] spawn VAS_fnc_playerDisplay;
#include "macro.sqf"
/*
	@version: 1.0
	@file_name: filter_show.sqf
	@file_author: TAW_Tonic
	@file_edit: 5/9/2013
	@file_description: Checks if we need to hide/show filters.
	
*/
private["_req"];
_req = _this select 0;
_cur_filter = uiNamespace getVariable "VAS_UI_FILTER";

switch(_req) do
{
	case "guns":
	{
		ctrlSetText[VAS_filter_1,localize "STR_VAS_Main_Rifles"];
		ctrlSetText[VAS_filter_2,localize "STR_VAS_Main_Scoped"];
		ctrlSetText[VAS_filter_3,localize "STR_VAS_Main_Heavy"];
		ctrlSetText[VAS_filter_4,localize "STR_VAS_Main_Launcher"];
		ctrlSetText[VAS_filter_5,localize "STR_VAS_Main_Pistols"];
		
		ctrlShow[VAS_filter_1,true];
		ctrlShow[VAS_filter_2,true];
		ctrlShow[VAS_filter_3,true];
		ctrlShow[VAS_filter_4,true];
		ctrlShow[VAS_filter_5,true];
	};
	
	case "items":
	{
		ctrlSetText[VAS_filter_1,localize "STR_VAS_Main_Uniforms"];
		ctrlSetText[VAS_filter_2,localize "STR_VAS_Main_Vests"];
		ctrlSetText[VAS_filter_3,localize "STR_VAS_Main_Headgear"];
		ctrlSetText[VAS_filter_4,localize "STR_VAS_Main_Attachments"];
		ctrlSetText[VAS_filter_5,localize "STR_VAS_Main_Misc"];
		
		ctrlShow[VAS_filter_1,true];
		ctrlShow[VAS_filter_2,true];
		ctrlShow[VAS_filter_3,true];
		ctrlShow[VAS_filter_4,true];
		ctrlShow[VAS_filter_5,true];
	};
	
	default 
	{
		ctrlShow[VAS_filter_1,false];
		ctrlShow[VAS_filter_2,false];
		ctrlShow[VAS_filter_3,false];
		ctrlShow[VAS_filter_4,false];
		ctrlShow[VAS_filter_5,false];
	};
};
		
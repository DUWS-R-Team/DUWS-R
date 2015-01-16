#include "macro.sqf"
/*
	File: fn_updateLoad.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	A simple handler for updating the gear load displays.
*/
private["_cfgInfo"];
{
	_container = _x select 0;
	if(_container != "") then
	{
		_load = _x select 1;
		_cfgInfo = [_container] call VAS_fnc_fetchCfgDetails;
		if(count _cfgInfo > 0) then
		{
			if(_container == backpack player) then 
			{
				_maxLoad = getNumber(configFile >> "CfgVehicles" >> _container >> "maximumload");
				if(_maxLoad == 0) then {_load = 1;};
			};
			
			(VAS_getControl(VAS_Main_Display,(_x select 2))) ctrlShow true;
			(VAS_getControl(VAS_Main_Display,(_x select 3))) ctrlShow true;
			(VAS_getControl(VAS_Main_Display,(_x select 4))) ctrlShow true;
			(VAS_getControl(VAS_Main_Display,(_x select 3))) ctrlSetText (_cfgInfo select 2);
			(VAS_getControl(VAS_Main_Display,(_x select 3))) ctrlSetToolTip format["%1 | %2%3 Full",_cfgInfo select 1,round(_load * 100),"%"];
			(VAS_getControl(VAS_Main_Display,(_x select 4))) progressSetPosition _load;
		}
			else
		{
			(VAS_getControl(VAS_Main_Display,(_x select 2))) ctrlShow false;
			(VAS_getControl(VAS_Main_Display,(_x select 3))) ctrlShow false;
			(VAS_getControl(VAS_Main_Display,(_x select 4))) ctrlShow false;
		};
	}
		else
	{
		(VAS_getControl(VAS_Main_Display,(_x select 2))) ctrlShow false;
		(VAS_getControl(VAS_Main_Display,(_x select 3))) ctrlShow false;
		(VAS_getControl(VAS_Main_Display,(_x select 4))) ctrlShow false;
	};
} foreach [[uniform player,loadUniform player,2950,2960,2970],[vest player,loadVest player,2951,2961,2971],[backPack player,loadBackpack player,2952,2962,2972]];

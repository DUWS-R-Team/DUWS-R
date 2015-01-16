/*
	@version: 1.0
	@file_name: fetch_config.sqf
	@file_author: TAW_Tonic
	@file_edit: 5/9/2013
	@file_description: Fetch information from either binConfig or VAS Config
*/
private["_request","_filter","_list"];
_request = _this select 0;
_filter = if(isNil {_this select 1}) then {nil} else {_this select 1}; //Need to handle this so it doesn't throw an error.
switch(_request) do
{
	case "guns":
	{
		if(count VAS_weapons > 0) then
		{
			if(!isNil {_filter}) then
			{
				_list = [VAS_weapons,_filter] call VAS_fnc_filter;
			}
				else
			{
				_list = VAS_weapons;
			};
		}
			else
		{
			if(isNil {VAS_pre_weapons}) then {["CfgWeapons"] call VAS_fnc_buildConfig;};
			if(!isNil {_filter}) then
			{
				_list = [VAS_pre_weapons,_filter] call VAS_fnc_filter;
			}
				else
			{
				_list = VAS_pre_weapons;
			};
		};
	};
	
	case "mags":
	{
		if(count VAS_magazines > 0) then
		{
			_list = VAS_magazines;
		}
			else
		{
			if(isNil {VAS_pre_magazines}) then {["CfgMagazines"] call VAS_fnc_buildConfig;};
			_list = VAS_pre_magazines;
		};
	};
	
	case "items":
	{
		if(count VAS_items > 0) then
		{
			if(!isnil {_filter}) then
			{
				_list = [VAS_items,_filter] call VAS_fnc_filter;
			}
				else
			{
				_list = VAS_items;
			};
		}
			else
		{
			if(isNil {VAS_pre_items}) then {["CfgWeapons"] call VAS_fnc_buildConfig;};
			if(!isNil {_filter}) then
			{
				_list = [VAS_pre_items,_filter] call VAS_fnc_filter;
			}
				else
			{
				_list = VAS_pre_items;
			};
		};
	};
	
	case "packs":
	{
		if(count VAS_backpacks > 0) then
		{
			_list = VAS_backpacks;
		}
			else
		{
			if(isNil {VAS_pre_backpacks}) then {["CfgVehicles"] call VAS_fnc_buildConfig;};
			_list = VAS_pre_backpacks;
		};
	};
	
	case "glass":
	{
		if(count VAS_glasses > 0) then
		{
			_list = VAS_glasses;
		}
			else
		{
			if(isNil {VAS_pre_glasses}) then {["CfgGlasses"] call VAS_fnc_buildConfig;};
			_list = VAS_pre_glasses;
		};
	};
};

_list;
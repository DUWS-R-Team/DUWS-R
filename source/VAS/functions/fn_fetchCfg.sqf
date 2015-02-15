/*
	File: fn_fetchCfg.sqf
	Version Edit: 2.5
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I honestly can't remember, something about handling configs/presets/something.
*/
private["_request","_filter","_list"];
_request = _this select 0;
_filter = if(isNil {_this select 1}) then {nil} else {_this select 1}; //Need to handle this so it doesn't throw an error.
switch(_request) do
{
	case "guns":
	{
		if(!isNil "VAS_box_weapons") exitWith {_list = VAS_box_weapons;};
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
		if(!isNil "VAS_box_magazines") exitWith {_list = VAS_box_magazines};
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
		if(!isNil "VAS_box_items") exitWith {_list = VAS_box_items};
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
		if(!isNil "VAS_box_backpacks") exitWith {_list = VAS_box_backpacks;};
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
		if(!isNil "VAS_box_goggles") exitWith {_list = VAS_box_goggles;};
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
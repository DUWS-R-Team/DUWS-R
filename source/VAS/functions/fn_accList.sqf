/*
	File: fn_accList.sqf
	Version Edit: 2.5
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Compiles a list of compatible attachments, first checks to see whether or not
	the new compatibleItmes class structure is in use, if it is it uses that list..
	Otherwise it switches to old style method.
*/
private["_weapon","_configInfo","_items","_badItems"];
_weapon = [_this,0,"",[""]] call BIS_fnc_param;
if(_weapon == "") exitWith {[]};

_configInfo = [_weapon,"CfgWeapons"] call VAS_fnc_fetchCfgDetails;
if(count _configInfo == 0) exitWith {[]};
if(count (_configInfo select 14) > 0) then {
	_items = [];
	_badItems = [];
	{
		_config = configFile >> "CfgWeapons" >> _data >> "WeaponSlotsInfo" >> _x >> "compatibleItems";
		for "_i" from 0 to count(_config)-1 do
		{
			_entry = _config select _i;
			if(getNumber(_entry) == 0) then {
				if(!((configName _entry) in _badItems)) then {
					_badItems set[count _badItems,(configName _entry)];
				};
			} else {
				if(!isNil "VAS_box_items") then {
					if((configName _entry) in VAS_box_items) then {
						_items set[count _items,(configName _entry)];
					};
				} else {
					if(count (vas_items) == 0) then {
						if(!((configName _entry) in vas_r_items)) then {
							_items set[count _items,(configName _entry)];
						};
					} else {
						if((configName _entry) in vas_items) then {
							_items set[count _items,(configName _entry)];
						};
					};
				};
			};
		};

		if(count _badItems > 0) then {
			_parent = inheritsFrom _config;
			for "_i" from 0 to count(_parent)-1 do
			{
				_entry = _parent select _i;
				if(!((configName _entry) in _badItems)) then {
					if(!isNil "VAS_box_items") then {
						if((configName _entry) in VAS_box_items) then {
							_items set[count _items,(configName _entry)];
						};
					} else {
						if(count (vas_items) == 0) then {
							if(!((configName _entry) in vas_r_items)) then {
								_items set[count _items,(configName _entry)];
							};
						} else {
							if((configName _entry) in vas_items) then {
								_items set[count _items,(configName _entry)];
							};
						};
					};
				};
			};
		};
	} foreach (_configInfo select 14);
	
	{
		if(!isNil "VAS_box_items") then {
			if(_x in VAS_box_items) then {
				_items set[count _items,_x];
			};
		} else {
			if(count (vas_items) == 0) then {
				if(!(_x in vas_r_items)) then {
					_items set[count _items,_x];
				};
			} else {
				if(_x in vas_items) then {
					_items set[count _items,_x];
				};
			};
		};
	} foreach (_configInfo select 12);
		
	_items = _items + (_configInfo select 12);
} else {
	_items = [];
	{
		if(!isNil "VAS_box_items") then {
			if(_x in VAS_box_items) then {
				_items set[count _items,_x];
			};
		} else {
			if(count (vas_items) == 0) then {
				if(!(_x in vas_r_items)) then {
					_items set[count _items,_x];
				};
			} else {
				if(_x in vas_items) then {
					_items set[count _items,_x];
				};
			};
		};
	} foreach ((_configInfo select 10) + (_configInfo select 11) + (_configInfo select 12));
};

//Remove attachments that are not suppose to be in it.
_items;
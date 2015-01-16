/*
	@version: 2.0
	@file_name: build_config.sqf
	@file_edit: 9/24/2013
	@file_author: TAW_Tonic
	@file_description: If preload is enabled, it will build our preloaded config, otherwise fetches everything from the config.
*/
private["_cfg","_type","_temp","_ret","_master","_class","_details","_displayName","_scope","_type","_str","_itemInfo"];
_cfg = [_this,0,"",[""]] call BIS_fnc_param;
if(_cfg == "") exitWith {}; //Bad data passed, exit.

if(VAS_preload) then
{
	if(!isNil {VAS_pre_weapons} && !isNil {VAS_pre_magazines} && !isNil {VAS_pre_items} && !isNil {VAS_pre_backpacks} && !isNil {VAS_pre_glasses}) exitWith {}; //Exit since preload is completed and shouldn't be called again.
	//If it is called again then why is that? Are you not happy with what I supplied you? I supplied you with wonderful candy! Y U NO LIKE MY CANDY?!?!?
};

switch(_cfg) do
{
	case "CfgWeapons":
	{
		if(!isNil {uiNamespace getVariable "VASP_weapons"}) exitWith {["CfgWeapons"] call VAS_fnc_VASP;};
		_temp = [];
		_ret = [];
		_ret2 = [];
		_master = configFile >> _cfg;
		private["_base","_ret2"];
		for "_i" from 0 to (count _master)-1 do
		{
			_class = _master select _i;
			if(isClass _class) then
			{
				_class = configName _class;
				_details = [_class,_cfg] call VAS_fnc_fetchCfgDetails;
				_displayName = _details select 1;
				_picture = _details select 2;
				_scope = _details select 3;
				_type = _details select 4;
				_itemInfo = _details select 5;
				_base = configName(inheritsFrom (configFile >> "CfgWeapons" >> _class));
				//diag_log format["DEBUG - %1 :: %2",_class,_base];
				
				_str = [_class,4] call VAS_fnc_KRON_StrLeft;
				
				if(_scope >= 2 && _str != "ACRE") then
				{
					switch (true) do
					{
						case (_type in [1,2,4,5,4096]):
						{
							if(_picture != "" && _displayName != "") then
							{
								if(_itemInfo == 616 && _type == 4096) then
								{
									_ret2 set[count _ret2,_class];
								}
									else
								{
									if(!(_displayName in _temp) && !(_base in VAS_r_weapons) && !(_class in VAS_r_weapons)) then
									{
										_temp set[count _temp,_displayName];
										_ret set[count _ret,_class];
									};
								};
							};
						};
						
						case (_type == 131072):
						{
							if(_picture != "" && !(_base in VAS_r_items) && !(_class in VAS_r_items)) then
							{
								_ret2 set[count _ret2,_class];
							};
						};
					};
				};
			};
		};
		
		VAS_pre_weapons = _ret;
		VAS_pre_items = _ret2;
	};
	
	case "CfgMagazines":
	{
		if(!isNil {uiNamespace getVariable "VASP_magazines"}) exitWith {["CfgMagazines"] call VAS_fnc_VASP;};
		if(count VAS_magazines > 0) exitWith {}; //Don't waste CPU-processing on something that isn't required.
		_temp = [];
		_ret = [];
		_master = configFile >> _cfg;
		for "_i" from 0 to (count _master)-1 do
		{
			_class = _master select _i;
			if(isClass _class) then
			{
				_class = configName _class;
				_details = [_class,_cfg] call VAS_fnc_fetchCfgDetails;
				_displayName = _details select 1;
				_picture = _details select 2;
				_scope = _details select 3;
				
				if(_scope >= 1 && _picture != "" && !(_displayName in _temp)) then
				{
					_str = [_class,4] call VAS_fnc_KRON_StrLeft;
					if(_str != "ACRE" && !(_class in VAS_R_magazines)) then
					{
						_temp set[count _temp,_displayName];
						_ret set[count _ret,_class];
					};
				};
			};
		};
		
		VAS_pre_magazines = _ret;
	};
	
	case "CfgVehicles":
	{
		if(!isNil {uiNamespace getVariable "VASP_backpacks"}) exitWith {["CfgVehicles"] call VAS_fnc_VASP;};
		if(count VAS_backpacks > 0) exitWith {}; //Don't waste CPU-processing on something that isn't required.
		_ret = [];
		_master = configFile >> _cfg;
		private["_base"];
		for "_i" from 0 to (count _master)-1 do
		{
			_class = _master select _i;
			if(isClass _class) then
			{
				_class = configName _class;
				_details = [_class,_cfg] call VAS_fnc_fetchCfgDetails;
				_displayName = _details select 1;
				_picture = _details select 2;
				_scope = _details select 3;
				_type = _details select 4;
				_base = inheritsFrom (configFile >> _cfg >> _class);
				if(_scope >= 2 && _type == "Backpacks" && _picture != "") then
				{
					_str = [_class,4] call VAS_fnc_KRON_StrLeft;
					if(_str != "ACRE" && !(_base in VAS_r_backpacks) && !(_class in VAS_r_backpacks)) then
					{
						_ret set[count _ret,_class];
					};
				};
			};
		};
		
		VAS_pre_backpacks = _ret;
	};
	
	case "CfgGlasses":
	{
		if(!isNil {uiNamespace getVariable "VASP_glasses"}) exitWith {["CfgGlasses"] call VAS_fnc_VASP;};
		if(count VAS_glasses > 0) exitWith {}; //Don't waste CPU-processing on something that isn't required.
		_temp = [];
		_ret = [];
		_master = configFile >> _cfg;
		for "_i" from 0 to (count _master)-1 do
		{
			_class = _master select _i;
			if(isClass _class) then
			{
				_class = configName _class;
				_details = [_class,_cfg] call VAS_fnc_fetchCfgDetails;
				_displayName = _details select 1;
				_picture = _details select 2;
				
				if(_picture != "" && _displayName != "None" && !(_displayName in _temp)) then
				{
					_str = [_class,4] call VAS_fnc_KRON_StrLeft;
					if(_str != "ACRE" && !(_class in VAS_r_glasses)) then
					{
						_temp set[count _temp,_displayName];
						_ret set[count _ret,_class];
					};
				};
			};
		};
		VAS_pre_glasses = _ret;
	};
};
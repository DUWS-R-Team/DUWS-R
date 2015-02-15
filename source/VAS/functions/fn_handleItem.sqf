/*
	@version: 2.2
	@file_name: fn_handleItem.sqf
	@file_author: TAW_Tonic
	@file_edit: 12/7/2013
	@file_description: Handles the incoming requests and adds or removes it.
*/
private["_item","_details","_bool","_ispack","_items","_isgun","_ongun","_override","_toUniform","_toVest"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_ispack = [_this,2,false,[false]] call BIS_fnc_param;
_ongun = [_this,3,false,[false]] call BIS_fnc_param;
_override = [_this,4,false,[false]] call BIS_fnc_param;
_toUniform = [_this,5,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a uniform.
_toVest = [_this,6,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a vest

//Some checks
if(_item == "") exitWith {};
_isgun = false;

//Patch by Robalo for TFAR radio's.
if (getText (configFile >> "CfgWeapons" >> _item >> "simulation") == "ItemRadio") then {
	if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
		_radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
		if (typeName _radio == "STRING" && _radio != "") then {_item = _radio};
	};
};

_details = [_item] call VAS_fnc_fetchCfgDetails;
if(count _details == 0) exitWith {};

//First check for restricted items
if(
(_item in VAS_r_weapons) OR (_item in VAS_r_backpacks) OR (_item in VAS_r_magazines) OR (_item in VAS_r_items) OR (_item in VAS_r_glasses) OR
((_details select 13) in VAS_r_weapons) OR ((_details select 13) in VAS_r_backpacks) OR ((_details select 13) in VAS_r_magazines) OR ((_details select 13) in VAS_r_items) OR ((_details select 13) in VAS_r_glasses)
) exitWith {systemChat format["%1 %2",_details select 1,localize "STR_VAS_restricted"];};

//Second check for restricted items
if(
(count VAS_weapons > 0 && !(_item in VAS_weapons)) &&
(count VAS_items > 0 && !(_item in VAS_items)) &&
(count VAS_backpacks > 0 && !(_item in VAS_backpacks)) &&
(count VAS_magazines > 0 && !(_item in VAS_magazines)) &&
(count VAS_glasses > 0 && !(_item in VAS_glasses))
) exitWith {systemChat format["%1 %2",_details select 1,localize "STR_VAS_restricted"]};

if(_bool) then
{
	switch((_details select 6)) do
	{
		case "CfgGlasses":
		{
			if(_toUniform) exitWith {player addItemToUniform _item;};
			if(_toVest) exitWith {player addItemToVest _item;};
			
			if(_ispack) then
			{
				player addItemToBackpack _item;
			}
				else
			{
				if(_override) then
				{
					player addItem _item;
				}
					else
				{
					if(goggles player != "") then
					{
						removeGoggles player;
					};
					player addGoggles _item;
				};
			};
		};
		
		case "CfgVehicles":
		{
			if(backpack player != "") then
			{
				_items = (backpackItems player);
				removeBackpack player;
			};
			player addBackpack _item;
			clearAllItemsFromBackpack player;
			if(!isNil {_items}) then 
			{ 
				{[_x,true,true,false,true] spawn VAS_fnc_handleItem; } foreach _items;
			};
		};
		
		case "CfgMagazines":
		{
			if(_toUniform) exitWith {player addItemToUniform _item;};
			if(_toVest) exitWith {player addItemToVest _item;};
			if(_ispack) exitWith {player addItemToBackpack _item;};
			
			player addMagazine _item;
		};
		
		case "CfgWeapons":
		{
			//New addition
			if(_toUniform) exitWith {player addItemToUniform _item;};
			if(_toVest) exitWith {player addItemToVest _item;};
			if(_ispack) exitWith {player addItemToBackpack _item;};
			
			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};
			
			if(_isgun) then
			{
				if(!_ispack && _override) exitWith {}; //It was in the vest/uniform, try to close to prevent it overriding stuff... (Actual weapon and not an item)
				if(_item == "MineDetector") then
				{
					player addItem _item;
				}
					else
				{
					player addWeapon _item;
				};
			}
				else
			{
				switch(_details select 5) do
				{
					case 0: 
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								if(_item in (assignedItems  player)) then 
								{
									player addItem _item;
								} 
									else 
								{
									player addItem _item; 
									player assignItem _item;
								};
							};
						};
					};
					case 605: 
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								if(headGear player == _item) then
								{
									player addItem _item;
								}
									else
								{
									if(headGear player != "") then
									{
										removeHeadGear player;
									};
									player addHeadGear _item;
								};
							};
						};
					};
					case 801: 
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								if(uniform player == _item) then
								{
									player addItem _item;
								}
									else
								{
									if(uniform player != "") then
									{
										_items = uniformItems player;
										removeUniform player;
									};
									
									if(!(player isUniformAllowed _item)) then {
										player forceAddUniform _item;
									} else {
										player addUniform _item;
									};
									
									if(!isNil {_items}) then
									{
										{[_x,true,false,false,true] spawn VAS_fnc_handleItem;} foreach _items;
									};
								};
							};
						};
					};
					case 701:
					{
						if(_ispack) then 
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								if(vest player == _item) then
								{
									player addItem _item;
								}
									else
								{
									if(vest player != "") then
									{
										_items = vestItems player;
										removeVest player;
									};
									
									player addVest _item;
									
									if(!isNil {_items}) then
									{
										{[_x,true,false,false,true] spawn VAS_fnc_handleItem;} foreach _items;
									};
								};
							};
						};
					};
					
					case 201:
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,201] call VAS_fnc_accType;
							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									player addItem _item;
								}
									else
								{
									[] call VAS_fnc_accPrompt;
									waitUntil {!isNil {vas_prompt_choice}};
									if(vas_prompt_choice) then
									{
										switch (_type) do
										{
											case 1: { player addPrimaryWeaponItem _item; };
											case 2: { player addSecondaryWeaponItem _item; };
											case 3: { player addHandgunItem _item; };
										};
									}
										else
									{
										player addItem _item;
									};
									vas_prompt_choice = nil;
								};
							};
						};
					};
					
					case 301:
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,301] call VAS_fnc_accType;
							
							if(_ongun) then
							{ 
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									player addItem _item;
								}
									else
								{
									[] call VAS_fnc_accPrompt;
									waitUntil {!isNil {vas_prompt_choice}};
									if(vas_prompt_choice) then
									{
										switch (_type) do
										{
											case 1: { player addPrimaryWeaponItem _item; };
											case 2: { player addSecondaryWeaponItem _item; };
											case 3: { player addHandgunItem _item; };
										};
									}
										else
									{
										player addItem _item;
									};
									vas_prompt_choice = nil;
								};
							};
						};
					};
					
					case 101:
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,101] call VAS_fnc_accType;
							
							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									player addItem _item;
								}
									else
								{
									[] call VAS_fnc_accPrompt;
									waitUntil {!isNil {vas_prompt_choice}};
									if(vas_prompt_choice) then
									{
										switch (_type) do
										{
											case 1: { player addPrimaryWeaponItem _item; };
											case 2: { player addSecondaryWeaponItem _item; };
											case 3: { player addHandgunItem _item; };
										};
									}
										else
									{
										player addItem _item;
									};
									vas_prompt_choice = nil;
								};
							};
						};
					};
					
					case 621:
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								player addItem _item;
								player assignItem _item;
							};
						};
					};
					
					case 616:
					{
						if(_ispack) then
						{
							player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								player addItem _item;
							}
								else
							{
								player addItem _item;
								player assignItem _item;
							};
						};
					};
					
					default 
					{ 
						if(_ispack) then 
						{
							player addItemToBackpack _item;
						} 
							else 
						{
							player addItem _item;
						};
					};
				};
			};
		};
	};
}
	else
{
	switch((_details select 6)) do
	{
		case "CfgVehicles":
		{
			removeBackpack player;
		};
		
		case "CfgMagazines":
		{
			player removeMagazine _item;
		};
		
		case "CfgGlasses":
		{
			if(_item == goggles player) then
			{
				removeGoggles player;
			}
				else
			{
				player removeItem _item;
			};
		};
		
		case "CfgWeapons":
		{
			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};
			
			if(_isgun) then
			{
				switch(true) do
				{
					case (primaryWeapon player == _item) : {_ispack = false;};
					case (secondaryWeapon player == _item) : {_ispack = false;};
					case (handGunweapon player == _item) : {_ispack = false;};
					case (_item in assignedItems player) : {_ispack = false;};
					default {_ispack = true;};
				};
				
				if(_item == "MineDetector") then
				{
					player removeItem _item;
				}
					else
				{
					if(_ispack) then
					{
						player removeItemFromBackpack _item;
					}
						else
					{
						switch(true) do
						{
							case (_item in (uniformItems player)): {player removeItemFromUniform _item;};
							case (_item in (vestItems player)) : {player removeItemFromVest _item;};
							case (_item in (backpackItems player)) : {player removeItemFromBackpack _item;};
							default {player removeWeapon _item;};
						};
					};
				};
			}
				else
			{
				switch((_details select 5)) do
				{
					case 0: {player unassignItem _item; player removeItem _item;};
					case 605: {if(headGear player == _item) then {removeHeadgear player} else {player removeItem _item};};
					case 801: {if(uniform player == _item) then {removeUniform player} else {player removeItem _item};};
					case 701: {if(vest player == _item) then {removeVest player} else {player removeItem _item};};
					case 621: {player unassignItem _item; player removeItem _item;};
					case 616: {player unassignItem _item; player removeItem _item;};
					default 
					{
						switch (true) do
						{
							case (_item in (primaryWeaponItems player)) : {player removePrimaryWeaponItem _item;};
							case (_item in (handgunItems player)) : {player removeHandgunItem _item;};
							default {player removeItem _item;};
						};
					};
				};
			};
		};
	};
};

if(!isNil "VAS_fnc_updateLoad") then
{
	[] call VAS_fnc_updateLoad;
};
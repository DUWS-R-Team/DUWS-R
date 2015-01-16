#include "macro.sqf"
/*
	@version: 2.0
	@file_name: fn_saveGear.sqf
	@file_author: TAW_Tonic
	@file_edit: 9/24/2013
	@file_description: Save to profileNamespace in old VAS format
*/
private["_title","_slot","_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];
_title = ctrlText VAS_save_text;
_slot = lbCurSel VAS_save_list;
if(_slot == -1) exitWith {hint localize"STR_VAS_Prompt_slotSelFail"};

//Old format / code
_primary = primaryWeapon player;
_launcher = secondaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (secondaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (secondaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

player selectWeapon _curWep;

if(vas_disableLoadSave) then
{
	missionNamespace setVariable[format["vas_gear_new_%1",_slot],[_title,_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems]];
}
	else
{
	profileNameSpace setVariable[format["vas_gear_new_%1",_slot],[_title,_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems]];
	saveProfileNamespace;
};

[0,true] spawn VAS_fnc_SaveLoad;
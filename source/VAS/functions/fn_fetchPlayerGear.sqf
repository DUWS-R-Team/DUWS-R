/*
	@version: 1.3
	@file_name: fn_fetchPlayerGear.sqf
	@file_author: TAW_Tonic
	@file_edit: 7/9/2013
	@file_description: Retrieves players current gear and returns it.
*/
private["_ret","_curWep"];
_ret = [];

//Fetch Weapons
if(primaryWeapon player != "") then {_ret set[count _ret,primaryWeapon player];};
if(secondaryWeapon player != "") then {_ret set[count _ret,secondaryWeapon player];};
if(handgunWeapon player != "") then {_ret set[count _ret,handgunWeapon player];};

//Fetch Current Magazines
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_ret set[count _ret,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (secondaryWeaponMagazine player) > 0) then
{
	{
		_ret set[count _ret,_x];
	} foreach (secondaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_ret set[count _ret,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;

if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_ret set[count _ret,(currentMagazine player)];};
};

player selectWeapon _curWep;

//Fetch rest of misc information.
if(uniform player != "") then 
{
	_ret set[count _ret, uniform player]; //Get uniform
	{_ret set[count _ret,_x];} foreach (uniformItems player); //Get uniform items
};	

if(vest player != "") then 
{
	_ret set[count _ret, vest player]; //Get vest
	{_ret set[count _ret,_x];} foreach (vestItems player); //Get vest items
};

if(backpack player != "") then 
{
	_ret set[count _ret,backpack player]; //Get Backpack
	{_ret set[count _ret,_x];} foreach (backpackItems player); //Get Backpack Items
};

if(count (assignedItems player) > 0) then 
{
	{
		_ret set[count _ret,_x];
	} foreach (assignedItems player);
};

if(headGear player != "") then
{
	_ret set[count _ret,headGear player];
};

if(goggles player != "") then
{
	_ret set[count _ret, goggles player];
};

//Fetch Primary weapon attachments
if(primaryWeapon player != "") then
{
	{
		if(((primaryWeaponItems player) select _x) != "") then
		{
			_ret set[count _ret,((primaryWeaponItems player) select _x)];
		};
	} foreach [0,1,2];
};

if(handgunWeapon player != "") then
{
	{
		if(((handgunItems player) select _x) != "") then
		{
			_ret set[count _ret,((handgunItems player) select _x)];
		};
	} foreach [0,1,2];
};

//Fetch secondary weapon attachments (placeholder)

_ret; //Return!
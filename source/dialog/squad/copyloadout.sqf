_arrayOfYellowUnits = [];

{
_team = assignedTeam _x;
	if (_team == "YELLOW") then {
	_arrayOfYellowUnits = _arrayOfYellowUnits + [_x];
	}
} forEach units group player;
if (count _arrayOfYellowUnits<1) exitWith {hint "No units assigned to Yellow team"};  // SELECT THE  YELLOW UNITS, PUT INSIDE  _arrayOfYellowUnits

// GET PLAYER GEAR
_helmet = headgear player;
_goggles = goggles player;

_uniform = uniform player;
_uniformItems = uniformItems player;

_backpack = backpack player;
_backpackItems = backpackItems player;

_vest = vest player;
_vestItems = vestItems player;

_items = assignedItems player; 

_rifle = primaryWeapon player;
_launcher = secondaryWeapon player;
_pistol = handgunweapon player;
//hint format["%1",_uniformItems];


{
// strip
removeallweapons _x;
removeBackpack _x;
removeVest _x;
removeUniform _x;
removeAllAssignedItems _x;

// put new clothes && gun
_x addUniform _uniform;
_x addVest _vest;
_x addBackpack _backpack;
clearAllItemsFromBackpack _x;
_x addWeapon _rifle;
_x addweapon _launcher;
_x addweapon _pistol;
_x addgoggles _goggles;
_x addheadgear _helmet;

// items linkItem
	for "_item" from 0 to ((count _items)-1) do
	{
		_itemToAdd = _items select _item;
		_x linkitem _itemToAdd;
	};

// items from uniform
	for "_item" from 0 to ((count _uniformItems)-1) do  
	{
		_itemToAdd = _uniformItems select _item;
		_x addItem _itemToAdd;
		player sidechat format["%1",_itemToAdd];
	};

// items from vest
	for "_item" from 0 to ((count _vestItems)-1) do  
	{
		_itemToAdd = _vestItems select _item;
		_x addItem _itemToAdd;
	};
	
	

} forEach _arrayOfYellowUnits;
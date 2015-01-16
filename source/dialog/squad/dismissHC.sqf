for "_timer" from 10 to 1 step -1 do {
	hint format["You have %1 seconds to select a High Command squad",_timer];
	sleep 1;
};



_selectedGroup = hcSelected player;
if (count _selectedGroup<1) exitWith {hint "You don't have any High Command squad selected"};
if (count _selectedGroup>1) exitWith {hint "You must select only 1 squad"};

_group = _selectedGroup select 0;

player hcRemoveGroup _group;
units _group joinSilent player;

hint "Transfer done!";

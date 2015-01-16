if (!enable_fast_travel) exitWith {hint "Fast travel is disabled"};
//// CREATE THE ARRAY OF FOBS w/ POSITION
_array_of_fobs_list = [];  // init the array of fobs
_listREINF = [];


// REINFORCE LIST BEGIN
_index = -1;
_listREINF = [];
{
_array_of_fobs_list = _array_of_fobs_list + [[getpos _x]]; // add the FOB (pos) into a nested array

_index = _index + 1; 
_array_of_fobs_list_selected = _array_of_fobs_list select _index; // select the current array inside _array_of_fobs_list

_actual_fobname = Array_of_FOBname select _index;
_array_of_fobs_list_selected = _array_of_fobs_list_selected + [_actual_fobname];

_listREINF = _listREINF + [_array_of_fobs_list_selected];
} forEach Array_of_FOBS;
_index = lbCurSel 2101;


_selected_fob = _listREINF select _index;
_selected_fob_pos = _selected_fob select 0;
_selected_fob_name = _selected_fob select 1;

closedialog 0;

for "_timer" from 10 to 1 step -1 do {
	hint format["You have %1 seconds to select a High Command squad",_timer];
	sleep 1;
};



_selectedGroup = hcSelected player;
if (count _selectedGroup<1) exitWith {hint "You don't have any High Command squad selected"};
if (count _selectedGroup>1) exitWith {hint "You must select only 1 squad"};

_group = _selectedGroup select 0;

player hcRemoveGroup _group;

_group setCombatMode "RED";


    _wp = _group addWaypoint [_selected_fob_pos, 50];
    _wp setWaypointType "GUARD";
	_wp setWaypointCompletionRadius 40;
	_wp setWaypointTimeout [300, 450, 600]; 



hint "The selected squad has been sent to reinforce the FOB";

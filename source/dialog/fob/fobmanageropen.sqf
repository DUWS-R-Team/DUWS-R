if (count Array_of_FOBname < 1) exitWith {hint "You must have at least one FOB to access the FOB manager"};


  _handle = createDialog "fob_mng_dialog";  
  waitUntil {dialog};
  
    
//// CREATE THE ARRAY OF FOBS w/ POSITION
_array_of_fobs_list = [];  // init the array of fobs
_listFT = [];

// FAST TRAVEL LIST BEGIN - -
_index = -1;
{
_array_of_fobs_list = _array_of_fobs_list + [[getpos _x]]; // add the FOB (pos) into a nested array

_index = _index + 1; 
_array_of_fobs_list_selected = _array_of_fobs_list select _index; // select the current array inside _array_of_fobs_list

_actual_fobname = Array_of_FOBname select _index;
_array_of_fobs_list_selected = _array_of_fobs_list_selected + [_actual_fobname];

_listFT = _listFT + [_array_of_fobs_list_selected];
} forEach Array_of_FOBS;
//// CREATE THE ARRAY OF FOBS w/ POSITION -- END
// add the base
_hqpos = getpos hq_blu1;
_listFT = _listFT + [[_hqpos,"Main base"]];
	
if (enable_fast_travel) then {  
// FOB FT
{
_fobname = _x select 1;
_index = lbAdd [2100, _fobname];
} forEach _listFT;
	lbSetCurSel [2100, 0];
}
else
{
_index = lbAdd [2100, "FT Disabled"];
	lbSetCurSel [2100, 0];
};
// FAST TRAVEL LIST END - -
   

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
   
{
_fobname = _x select 1;
_index = lbAdd [2101, _fobname];
} forEach _listREINF;
lbSetCurSel [2101, 0];
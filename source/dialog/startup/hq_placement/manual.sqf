player_is_choosing_hqpos = true;
//chosen_hq_placement = true;

clicked = false;
  
OnMapSingleClick "ClickedPos = _pos; clicked = true;";
openMap [true, true]; 
hint "Click somewhere on the island to place the HQ";

while {true} do {
    if (clicked) then { // player has clicked the map
	
    _foundPickupPos = [ClickedPos, 0,50,15,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) then {  // INVALID POS
	clicked = false;
	hint "Invalid position, the position must be flat and no objects must be near the position";
	}
	else // VALID POS
	{
	onMapSingleClick "";
	hint "Valid pos, creating HQ";
	openMap [false, false]; 
	chosen_hq_placement = true;
	_handle = [_foundPickupPos] execVM "initHQ\bluHQinit.sqf";	
	};  
    
    };
  sleep 0.2;
  if (chosen_hq_placement) exitwith {};
};
  waitUntil {time > 1};
  _handle = createDialog "startup_hq_placement_dialog";  
  waitUntil {dialog};
  if (chosen_hq_placement or player_is_choosing_hqpos) exitWith {closeDialog 0};
 
_timer = 9999999;
clicked = false;
_helo = _this select 0;
_actionID = _this select 2;
   /*
// IF NOT ENOUGH PTS
if (commandpointsblu1<3) exitWith {
  ["info",["Not enough command points","Not enough Command Points (3CP required)"]] call bis_fnc_showNotification;
  sleep 30;
_art = [player,"uav_recon"] call BIS_fnc_addCommMenuItem;
};
  */
/*  
_invalidPos = [[0,0,0], 0,9999999999999,7,0,0.2,0] call BIS_fnc_findSafePos; // invalid pos reference
_foundPickupPos = [_pos, 0,50,7,0,0.2,0] call BIS_fnc_findSafePos; // find a valid pos

if (_invalidPos select 0 == _foundPickupPos select 0 && _invalidPos select 1 == _foundPickupPos select 1) exitWith {player sidechat "There is no clear LZ near that location"};  
*/
  
titleText ["Driver: Click somewhere on your map, I'll drop you there", "PLAIN DOWN"];
OnMapSingleClick "ClickedTaxiPos = _pos; clicked = true;";
_helo removeAction _actionID;



// TIMER & MAPCLICK
while {_timer>0} do {
    if (clicked) then { // player has clicked the map
    _foundPickupPos = [ClickedTaxiPos, 0,50,10,2,5,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) then {
		if (ClickedTaxiPos distance player < 100) exitWith {
		clicked = false;
		titleText ["Driver: This is too close from our position", "PLAIN DOWN"];
		};
	clicked = false;
	titleText ["Driver: I can't go there", "PLAIN DOWN"];
	}
	else
	{onMapSingleClick "";_timer = 0;taxiCanTakeOff = true;}  
    
    };
  _timer = _timer-1; // remove 1 to timer
  sleep 0.5;
};

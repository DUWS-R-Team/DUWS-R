params ["_place","_trigger"];

sleep 0.5;

["location_enter",[_place]] call bis_fnc_showNotification;

waitUntil {
    count _trigger < 1;
}; 

["location_leave",[_place]] call bis_fnc_showNotification;
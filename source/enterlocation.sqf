_place   =   _this select 0; 
_trigger =   _this select 1;

sleep 0.5;

["location_enter",[_place]] call bis_fnc_showNotification;

waitUntil {
count _trigger < 1;
}; 
["location_leave",[_place]] call bis_fnc_showNotification;    


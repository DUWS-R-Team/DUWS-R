// CP every 30 mins (1800) 

_undercontrol = true;

 

while {_undercontrol} do {

 waitUntil {zoneundercontrolblu > 0};  // make sure there is at least 1 zone under control
 sleep 1800;
 waitUntil {zoneundercontrolblu > 0}; // check if there is still at least 1 zone under control
 ["CPzonehold",[(zoneundercontrolblu*3),zoneundercontrolblu]] call bis_fnc_showNotification;
 commandpointsblu1 = commandpointsblu1 + (zoneundercontrolblu*3);
 publicVariable "commandpointsblu1";
 ctrlSetText [1000, format["%1",commandpointsblu1]];
 
};


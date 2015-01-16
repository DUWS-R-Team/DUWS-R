
[] spawn {
waitUntil {zoneundercontrolblu >= 1};  
sleep 20;
_sitrep = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
["info",["Establishing a FOB","Check the briefing for more info (RTI Manual)"]] call bis_fnc_showNotification;
sleep 2;
};

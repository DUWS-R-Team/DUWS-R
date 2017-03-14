[] spawn {
    waitUntil {zoneundercontrolblu >= 1};  
    sleep 20;
    [player,"fob_support"] remoteExecCall ["BIS_fnc_addCommMenuItem", 0, true];
    //_sitrep = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
    ["info",["Establishing a FOB","Check the briefing for more info (RTI Manual)"]] remoteExecCall ["bis_fnc_showNotification", 0, true];
    //["info",["Establishing a FOB","Check the briefing for more info (RTI Manual)"]] call bis_fnc_showNotification;
    sleep 2;
};
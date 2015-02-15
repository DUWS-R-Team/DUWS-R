pFlirActivated = false;
[] call BIS_fnc_liveFeedTerminate;
deleteVehicle trucPIPtarget;

player removeAction pFlirDisable;
player removeAction pFlirEnable;
player removeEventHandler ["killed",PlayerKilledEH2];

sleep 2;

waitUntil {alive player}; 
pFLIRenable = player addaction ["<t color='#a9ff59'>Enable FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"]; //original last line in script

PlayerKilledEH3 = player addEventHandler ["respawn",{player addaction ["<t color='#a9ff59'>Enable FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"]}];


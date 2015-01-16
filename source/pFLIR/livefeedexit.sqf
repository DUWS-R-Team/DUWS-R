[] call BIS_fnc_liveFeedTerminate;
deleteVehicle trucPIPtarget;
player removeAction pFLIRdisable;
pFlirActivated = false;
sleep 2;
pFLIRenable = player addaction ["<t color='#a9ff59'>Enable FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"];

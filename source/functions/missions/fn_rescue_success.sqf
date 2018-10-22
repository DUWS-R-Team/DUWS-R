params ["_markername","_sol1","_sol2","_sol3","_MissionPos","_markername2","_trg"];

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

private "_task";
_taskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate taskname/variable name
call compile format["_task = %1",_taskgeneratedname]; // recall variable and inject it into handle

//player removeSimpleTask _task;
[["_task", "WEST"],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP;

// IF SOLDIERS DEAD
if (!(alive _sol1) && !(alive _sol2) && !(alive _sol3)) exitWith {
    ["TaskFailed",["","Rescue the friendly troops"]] call bis_fnc_showNotification;
};

// JOIN PLAYER
_sol1 setcaptive false;
_sol2 setcaptive false;
_sol3 setcaptive false;
_sol1 switchMove "AmovPpneMstpSnonWnonDnon";
_sol2 switchMove "AmovPpneMstpSnonWnonDnon";
_sol3 switchMove "AmovPpneMstpSnonWnonDnon";
[_sol1, _sol2, _sol3] joinSilent player;
titleText ["Thanks for the rescue, we'll be fighting with you from now on, lead the way!", "PLAIN DOWN"]; 

sleep 5;

// Give cookies  (bonus & notifications)
reward = (10 * cp_reward_multiplier);
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "finishedMissionsNumber";
["TaskSucceeded",["","Rescue the friendly troops"]] call bis_fnc_showNotification;
["cpaddedmission",[reward]] call bis_fnc_showNotification;
missions_success = missions_success + 1;
commandpointsblu1 = commandpointsblu1 + reward;
WARCOM_blufor_ap = WARCOM_blufor_ap + 15;
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";
[] call operative_mission_complete; 

// ADD PERSISTENT STAT
_addmission = [] call duws_fnc_persistent_stats_missions_total;
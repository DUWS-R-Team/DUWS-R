waitUntil {!isNil "hq_blu1"};

// End mission if HQ unit is killed
hq_blu1 spawn {
    waitUntil {time > 1};
    _this addMPEventHandler ["MPKilled",
    {
        [] spawn
        {
            ["TaskFailed",["","Your commanding officer has been killed"]] call bis_fnc_showNotification;
            sleep 6;
            ["officerkilled",false,true] call BIS_fnc_endMission;
        };
    }];
};

waitUntil {!isNil "amount_zones_created" && {amount_zones_created > 0}};

// WAIT UNTIL ALL ZONES ARE CAPTURED
waitUntil {sleep 3; (zoneundercontrolblu >= amount_zones_created);}; // Toutes les zones sont capturées
{
    persistent_stat_script_win = [] call duws_fnc_persistent_stats_win;
    ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;
    capture_island_obj setTaskState "Succeeded";
    sleep 3;
    ["island_captured_win",true,true] call BIS_fnc_endMission;
} remoteExecCall ["BIS_fnc_spawn", 0, true];

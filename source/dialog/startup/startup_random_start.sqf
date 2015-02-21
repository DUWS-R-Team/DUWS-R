startup_common = [] execVM "dialog\startup\startup_common.sqf";
waitUntil {scriptDone startup_common};

manually_chosen = false;
publicVariable "manually_chosen";

chosen_settings = true; // Give the go ! BluHQinit.sqf can continue execution
publicVariable "chosen_settings";

diag_log format["----- DUWS-R CHOSEN SETTINGS --------- Max radius: %1-------Min radius: %2-------Zones number: %3-------Command points: %4-------BLU AP: %5-------OPF AP: %6-------Weather type: %7-------BLU AI skill: %8-------OPF AI skill: %9",zones_max_radius,zones_min_radius,zones_number,commandpointsblu1,opfor_ap,blufor_ap,weather_type,blufor_ai_skill,opfor_ai_skill];
closeDialog 0;

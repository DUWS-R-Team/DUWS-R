_MissionPos = _this select 0;
_initpos = getpos hq_blu1;
// define random pos AROUND TARGET. spawn markers at random.
_radius = 175;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

// CREATE NAME
_mission_name = MissionNameCase4;

// CREATE MARKER (ICON)
_markername = format["pilot%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_unknown";
str(_markername) setMarkerColor "ColorYellow";
str(_markername) setMarkerText "Crash";
str(_markername) setMarkerSize [1, 1];

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipsetarget",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorYellow";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.5;

// CREATE PATROLS
sleep 1;
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createopteam.sqf";

// CREATE WRECK
_choppa = "Land_Wreck_Heli_Attack_01_F" createVehicle (_missionpos);

_group = createGroup west; // CREATE PILOT
_pilot = _group createUnit ["B_Helipilot_F", [_missionpos select 0, (_missionpos select 1)+2], [], 0, "FORM"];
_pilot setcaptive true; 
_pilot switchMove "acts_CrouchingIdleRifle01";

// TASK AND NOTIFICATION
[west, "_taskhandle", ["taskDestroy.", "One of our AH-99 helicopters has been downed somewhere around this area. We have reports that the pilot is still alive. You must find him and bring him back to base.", "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

if (!ismultiplayer) then {
    execVM "utilities\autoSave.sqf";
};

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

// PLAYER IS WITH THE PILOT --
waitUntil {sleep 1; (player distance _pilot)<6 OR !(alive _pilot)};

// CHECK IF PILOT ALIVE
if (!(alive _pilot)) exitWith {
    deleteMarker str(_markername2);
    deleteMarker str(_markername);

    [["_taskhandle", "WEST"],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP; 
    ["TaskFailed",["","The pilot is dead"]] call bis_fnc_showNotification;
};

_pilot setcaptive false;
_pilot switchMove "AidlPknlMstpSrasWrflDnon_AI";
[_pilot] joinSilent player;
titleText ["Thanks sir, this place is crawling with OPFOR forces, bring me back to base", "PLAIN DOWN"];

// PLAYER IS AT BASE WITH PILOT OR PILOT DEAD --
waitUntil {sleep 1; (_pilot distance _initpos)<50 OR !(alive _pilot)};

// CHECK IF PILOT ALIVE
if (!(alive _pilot)) exitWith {
    deleteMarker str(_markername2);
    deleteMarker str(_markername);

    [["_taskhandle", "WEST"],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP; 
    ["TaskFailed",["","The pilot is dead"]] call bis_fnc_showNotification;
};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[["_taskhandle", "WEST"],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP; 

sleep 1;

titleText ["Home, sweet home! Thanks for the rescue.", "PLAIN DOWN"];
deleteVehicle _pilot;

// Give cookies  (bonus & notifications)
reward = (20 * cp_reward_multiplier);
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "finishedMissionsNumber";
["TaskSucceeded",["",_mission_name]] call bis_fnc_showNotification;
["cpaddedmission",[reward]] call bis_fnc_showNotification;
WARCOM_blufor_ap = WARCOM_blufor_ap + 20;
commandpointsblu1 = commandpointsblu1 + reward;
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";
missions_success = missions_success + 1;
_operHandler = execVM "dialog\operative\operative_mission_complete.sqf"; 

// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
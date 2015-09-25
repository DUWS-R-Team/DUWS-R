_MissionPos = _this select 0;
// define random pos AROUND TARGET. spawn markers at random.
_radius = 175;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

// CREATE NAME
_mission_name = MissionNameCase2;

// CREATE MARKER (ICON)
_markername = format["target%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "selector_selectedEnemy";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Assassinate";
str(_markername) setMarkerSize [1, 1];

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipsetarget",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.5;

// CREATE PATROLS
sleep 1;
[_missionpos, 15] execvm "createoppatrol.sqf"; // <-- around target
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createoppatrol.sqf";
[_randompos, _radius] execvm "createopteam.sqf";
"O_MRAP_02_F" createVehicle ([(_missionpos select 0)+(random 10),(_missionpos select 1)+(random 10)]);

_group = createGroup east;
_target = _group createUnit ["O_officer_F", _missionpos, [], 0, "FORM"]; 
_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];
_unit = _group createUnit ["O_soldier_F", _missionpos, [], 0, "FORM"];

// TASK AND NOTIFICATION
[west, "_taskhandle", ["taskDestroy.", "RECOVER THE TPH<br/>Transport Helicopter<br/><br/>", "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

if (!ismultiplayer) then {
    execVM "utilities\autoSave.sqf";
};

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

waitUntil {sleep 2; !alive _target};  // MISSION COMPLETED --

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[["_taskhandle", "WEST"],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP; 

sleep 1;

// Give cookies  (bonus & notifications)
reward = (20 * cp_reward_multiplier);
["TaskSucceeded",["",_mission_name]] call bis_fnc_showNotification;
["cpaddedmission",[reward]] call bis_fnc_showNotification;
WARCOM_blufor_ap = WARCOM_blufor_ap + 20;
missions_success = missions_success + 1;
commandpointsblu1 = commandpointsblu1 + reward;
opfor_ap = opfor_ap - 20;
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "finishedMissionsNumber";
_operHandler = execVM "dialog\operative\operative_mission_complete.sqf";  

// ADD PERSISTENT STAT
_addmission = [] execVM "persistent\persistent_stats_missions_total.sqf";
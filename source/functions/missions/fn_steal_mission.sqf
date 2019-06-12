params ["_MissionPos"];
// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 200;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

_initpos = getpos hq_blu1;

// CREATE NAME
_mission_name = MissionNameCase1;


// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_pickup";
str(_markername) setMarkerColor "Color3_FD_F";
str(_markername) setMarkerText "Steal";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "Color3_FD_F";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3;

// CREATE TRUCK & CRATES
_truck1 = Opfor_Truck_Open createVehicle (_missionpos);

_box1 = Opfor_Supplycrate createVehicle (_missionpos);
_box2 = Opfor_Supplycrate createVehicle (_missionpos);
_box3 = Opfor_Supplycrate createVehicle (_missionpos);

_box1 attachTo [_truck1,[0,0.2,-0.8]];
_box1 setDir 90;

_box2 attachTo [_truck1,[0,-1.55,-0.8]];
_box2 setDir 75;

_box3 attachTo [_truck1,[0.1,-3.0,-0.8]];
_box3 setdir 180;


// TASK AND NOTIFICATION
//_taskhandle = player createSimpleTask ["taskSteal"];
//_taskhandle setSimpleTaskDescription ["An enemy truck full of supplies has been spotted in the area. Find it and bring it back to the base in one piece.",_mission_name,""];
//_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));
[west, "_taskhandle", ["An enemy truck full of supplies has been spotted in the area. Find it and bring it back to the base in one piece.", "Grand Theft", "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate;

if (!ismultiplayer) then {
    [] spawn duws_fnc_autoSave;
};

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

// CREATE PATROLS
sleep 1;
[_missionpos, 15] call duws_fnc_createoppatrol; // <-- around target
[_randompos, _radius] call duws_fnc_createoppatrol;
[_randompos, _radius] call duws_fnc_createopteam;

_group = createGroup east;
_unit = _group createUnit [Opfor_Squadleader, _missionpos, [], 0, "FORM"];
_unit = _group createUnit [Opfor_Rifleman_AT, _missionpos, [], 0, "FORM"];
_unit = _group createUnit [Opfor_Rifleman, _missionpos, [], 0, "FORM"];


// MISSION COMPLETED --   ATTENDRE QUE LE CAMION SOIT ARRIVE A LA BASE OU DETRUIT
waitUntil {sleep 2; ((getdammage _truck1)>0.95 OR (_truck1 distance _initpos)<50)};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

//player removeSimpleTask _taskhandle;
["_taskhandle", "WEST"] remoteExecCall ["BIS_fnc_deleteTask", 0, true];

if (getdammage _truck1>0.95) exitWith {
    ["TaskFailed",["","The enemy convoy is destroyed"]] call bis_fnc_showNotification;
};

// IF THE MISSION IS COMPLETE
hint "Unloading the truck...";

// Give cookies  (bonus & notifications)
reward = (25 * cp_reward_multiplier);
["TaskSucceeded",["",_mission_name]] call bis_fnc_showNotification;
["cpaddedmission",[reward]] call bis_fnc_showNotification;
missions_success = missions_success + 1;
commandpointsblu1 = commandpointsblu1 + reward;
WARCOM_blufor_ap = WARCOM_blufor_ap + 25;
opfor_ap = opfor_ap - 25;
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "finishedMissionsNumber";
[] call operative_mission_complete;

// ADD PERSISTENT STAT
_addmission = [] call duws_fnc_persistent_stats_missions_total;

sleep 2;
deleteVehicle _box3;
sleep 2;
deleteVehicle _box2;
sleep 2;
deleteVehicle _box1;
hint "Unloading complete, you can use the truck at your will.";

_MissionPos = _this select 0;
// define random pos AROUND SOLDIERS. spawn markers at random.
_radius = 125;
_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

// CREATE NAME
_mission_name = MissionNameCase0;


// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_warning";
str(_markername) setMarkerColor "ColorYellow";
str(_markername) setMarkerText "Rescue";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorYellow";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3; 

// Create injured soldiers  -- BEGIN
_soldier1 = format ["s1%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    // Give them names
_soldier2 = format ["s2%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    
_soldier3 = format ["s3%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    

_group = createGroup west;

"b_soldier_tl_f" createUnit [[(_missionpos select 0)+(random 10),(_missionpos select 1)+(random 10)], _group,format["this setcaptive true; this switchMove ""acts_InjuredCoughRifle02""; %1 = this",_soldier1]];
"B_Soldier_F" createUnit [[(_missionpos select 0),(_missionpos select 1)], _group,format["this setcaptive true; this switchMove ""acts_InjuredLookingRifle02""; %1 = this",_soldier2]];
"B_Soldier_ar_F" createUnit [[(_missionpos select 0)+(random 5),(_missionpos select 1)+(random 5)], _group,format["this setcaptive true; this switchMove ""acts_InjuredLookingRifle03""; %1 = this",_soldier3]];

// END CREATE SOLDIERS




// TASK AND NOTIFICATION
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

_taskhandle = player createSimpleTask ["taskRescue"];
_taskhandle setSimpleTaskDescription ["One of our patrols has been ambushed and requires immediate assistance",_mission_name,""];
_taskhandle setSimpleTaskDestination (getMarkerPos str(_markername));

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

call compile format ["%1 = _taskhandle",_VARtaskgeneratedName]; // create variable using the generated name and inject taskhandle into it

// CREATE TRIGGER ZONES
_trg=createTrigger["EmptyDetector",_MissionPos];
_trg setTriggerArea[25,25,0,false];
_trg setTriggerActivation["WEST","PRESENT",false];
_trg setTriggerStatements["this",format["[""%1"",%2,%3,%4,%5,""%6"",this] execvm ""missions\missions\rescue\success.sqf""",_markername,_soldier1,_soldier2,_soldier3,_MissionPos,_markername2], ""];
_trg setTriggerTimeout [10, 10, 10, true ];  

// CREATE OPFOR PATROLS
      sleep 1;
      [_randompos, _radius] execvm "createoppatrol.sqf";
      [_randompos, _radius] execvm "createoppatrol.sqf";


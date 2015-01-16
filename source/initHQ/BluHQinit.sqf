_hqblu = _this select 0;
blu_hq_created = true;


PosOfBLUHQ = _hqblu;
publicVariable "PosOfBLUHQ";



// create the building
_hq = "Land_Cargo_HQ_V1_F" createVehicle _hqblu;

// create marker on HQ
_markername = format["%1%2",round (_hqblu select 0),round (_hqblu select 1)]; // Define marker name
blu_hq_markername = _markername;
//hint _markername;
_markerstr = createMarker [str(_markername), _hqblu];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_flag";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText "Main base";

// make HQ zone notification trigger
_trg5=createTrigger["EmptyDetector",_hqblu];
_trg5 triggerAttachVehicle [player];
_trg5 setTriggerArea[100,100,0,false];
_trg5 setTriggerActivation["VEHICLE","PRESENT",true];
_trg5 setTriggerStatements["this", format["[""%1"",thislist] execvm 'enterlocation.sqf'",'Main Base'], ""];

// warning trigger when an enemy approaches the camp
_trgWarning=createTrigger["EmptyDetector",_hqblu];
_trgWarning setTriggerArea[300,300,0,false];
_trgWarning setTriggerActivation["EAST","PRESENT",true];
_trgWarning setTriggerStatements["this","PAPABEAR sidechat 'This is HQ, there are enemies near our main base!'", ""];





// CREATE THE OFFICER
_group = createGroup west;
_hq = _group createUnit ["b_officer_f",(getmarkerpos str(blu_hq_markername)), [], 0, "FORM"];
hq_blu1 = _hq;
publicVariable "hq_blu1";
_hq setpos [_hqblu select 0, _hqblu select 1, 0.59]; 
_hq disableAI "AUTOTARGET";
_hq setdir 0;
_handle = [hq_blu1] execVM "initHQ\HQaddactions.sqf";
removeallweapons _hq;
_hq switchMove "acts_StandingSpeakingUnarmed";
_handle = [_hq] execVM "sounds\radiochatter.sqf";
//_drawicon = [] execVM "inithq\drawIcon.sqf"; // create the icon

//GUARDS
_handle = [getpos hq_blu1] execVM "initHQ\guards.sqf";

//STATIC DEFENSES
_handle = [getpos hq_blu1] execVM "initHQ\fortify.sqf";

// IF THE OFFICER IS DEAD -- BEGIN OF "SPAWN"
[_hq] spawn {
  _hq = _this select 0;
  waitUntil {sleep 1;!alive _hq};
  _hq switchMove "AidlPercMstpSnonWnonDnon01";
  ["TaskFailed",["","Your commanding officer has been killed"]] call bis_fnc_showNotification;
  sleep 6;
  ["officerkilled",false,true] call BIS_fnc_endMission;
  };
// IF THE OFFICER IS DEAD -- End OF "SPAWN"


// TELEPORT PLAYER
player setpos _hqblu;

//////// HQ GENERATED /////
"respawn_west" setMarkerPos _hqblu;
sleep 0.1;


// BROADCAST, TELL THE HQ POS IS FOUND
HQ_pos_found_generated = true;
publicVariable "HQ_pos_found_generated";


if (!zones_manually_placed) then {


// SHOW THE STARTUP MENU
if (!zones_created) then {
sleep 0.1;
_nill = [] execVM "dialog\startup\startup.sqf";
waitUntil {chosen_settings};  // WAIT UNTIL THE PLAYER HAS CHOSEN THE SETTINGS
};


// WEATHER INIT
if (dynamic_weather_enable) then {
_weather_script = [] execVM "dialog\startup\weather.sqf";
};

// CALL ZONES GENERATION
waitUntil {!isNil {getsize_script}};  // WAIT UNTIL THE MAPSIZE SCRIPT IS DONE


if (!zones_created) then {      // CHECK IF ZONES ARE PLACED, IF NOT EXECUTE locatorZonesV1.sqf
_zones_create = [50, 0.2] execVM "initZones\locatorZonesV1.sqf";   // CHECK IF ZONES HAVE ALREADY BEEN PLACED
};

};
player allowDamage true;
if (debugmode) exitWith {};

if (isServer) then {
_sitrep = [player,"sitrep"] call BIS_fnc_addCommMenuItem;
};

//  _trg = ["Outpost Airbase",5,50,getpos this,true] spawn duws_fnc_createzone;
//	  Name of the place,pts,radius,position,fortified/not
//

params ["_place","_points","_size","_trigger","_fortified","_prefab"];

amount_zones_created = amount_zones_created + 1;
publicVariable "amount_zones_created";
zones_created = true; // Tell that at least 1 zone is created

// Add the zone to the array of zones (need for manual placement of zones and WARCOM)
if (isNil ("Array_of_OPFOR_zones")) then {Array_of_OPFOR_zones = [];};
Array_of_OPFOR_zones = Array_of_OPFOR_zones + [_trigger];

// CREATE MARKER (ICON)
_markername = format["%1%2",round(_trigger select 0),round(_trigger select 1)]; // Define marker name
//hint _markername;
_markerstr = createMarker [str(_markername),_trigger];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "hd_objective";
str(_markername) setMarkerColor "ColorRed";
str(_markername) setMarkerText _place;
str(_markername) setMarkerSize [0, 0];

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipse",round(_trigger select 0),round(_trigger select 1)]; // Define marker name
//hint _markername2;
_markerstr2 = createMarker [str(_markername2),_trigger];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorRed";
str(_markername2) setMarkerSize [_size, _size];
str(_markername2) setMarkerAlpha 0.1; 



// CREATE ZONE CAPTURABLE TRIGGER
_trg=createTrigger["EmptyDetector",_trigger];
_trg setTriggerArea[_size,_size,0,false];
_trg setTriggerActivation["WEST SEIZED","PRESENT",false];
_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5] spawn duws_fnc_captured",_place,_points,_markername,_markername2,_trigger], ""];
_trg setTriggerTimeout [30, 60, 300, true ];
// CREATE VARNAME FOR ZONE TRIGGER --> use the pos of the trigger
_triggerName = format["trigger%1%2",round (_trigger select 0),round (_trigger select 1)];
call compile format["%1 = _trg",_triggerName];









// CREATE PREFAB
if (_prefab) then {
_array_of_prefabs = [["Command Outpost", true, duws_fnc_site_commandOP],
["Vehicle Refit Station", false, duws_fnc_site_vehfittingstation],
["Research Bunker", true, duws_fnc_site_researchBunker],
["Recon Outpost", true, duws_fnc_site_reconOutpost],
["Power Relay", true, duws_fnc_site_powerRelay],
["Com. Station", true, duws_fnc_site_CommStation],
["Outpost", true, duws_fnc_site_outpost1],
["Outpost", true, duws_fnc_site_outpost2],
["Barracks", true, duws_fnc_site_Barracks],
["Research Station", false, duws_fnc_site_researchStation],
["Camp Site", false, duws_fnc_site_campsite]];

_amount_of_prefabs = count _array_of_prefabs;
_indexedAmount = _amount_of_prefabs - 1;
_dice = round random _indexedAmount;

_prefab_array = _array_of_prefabs select _dice;
_place = _prefab_array select 0;
_fortified = _prefab_array select 1;
_function = _prefab_array select 2;

_prefab_create = [_trigger] spawn _function;
str(_markername) setMarkerText _place;
};



// CREATE ZONE NOTIFICATION TRIGGER
_trg2=createTrigger["EmptyDetector",_trigger];
_trg2 triggerAttachVehicle [player];
_trg2 setTriggerArea[_size,_size,0,false];
_trg2 setTriggerActivation["VEHICLE","PRESENT",true];
_trg2 setTriggerStatements["this", format["[""%1"",thislist] spawn duws_fnc_enterlocation",_place], ""];


















// move the spawn location, or units get stuck
_fortifiedspawn = _trigger;
_trigger = [(_trigger select 0)+40,_trigger select 1];


// CREATE OPFOR. HEAVY CLUSTERFUCK INCOMING.
// Check if fortified is true
if (_fortified) then  
{
	[_fortifiedspawn] call duws_fnc_createopfortified;
	sleep 2;
};

// Check if radius is 100m or smaller => create 2 patrols then exit the script
if (_size < 101) exitWith  
{
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
};
// Check if radius is 250m-100m => create 2 patrols and 1 fireteam then exit the script
if (_size < 251) exitWith  
{
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
};
// Check if radius is 250m-500m => create 2 patrols and 2 fireteams then exit the script
if (_size < 501) exitWith  
{
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
};
if (_size <= 1000) exitWith			
{
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
};	
if (_size <= 1500) exitWith  
{
_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
waitUntil {scriptDone _vehcreate};
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol; 
	[opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
};	
if (_size <= 2000) exitWith  
{
_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
waitUntil {scriptDone _vehcreate};
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;  
	[opfor_Faction,"air",_trigger,_size] spawn duws_fnc_random_veh;
};	 
if (_size <= 3000) exitWith  
{
	_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
	waitUntil {scriptDone _vehcreate};
	
	_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
	waitUntil {scriptDone _vehcreate};
	
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;
    
	[opfor_Faction,"air",_trigger,_size] spawn duws_fnc_random_veh;
};

// IF NOT IN PARAMETERS (TOO BIG ZONE)	 
_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
waitUntil {scriptDone _vehcreate};

_vehcreate = [opfor_Faction,"armored",_trigger,_size] spawn duws_fnc_random_veh;
waitUntil {scriptDone _vehcreate};

	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopwpteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createoppatrol;
	[_trigger, _size] call duws_fnc_createopteam;
	[_trigger, _size] call duws_fnc_createoppatrol;
   
	[opfor_Faction,"air",_trigger,_size] spawn duws_fnc_random_veh;	   
	
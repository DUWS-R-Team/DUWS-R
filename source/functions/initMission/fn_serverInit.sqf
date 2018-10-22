if (!isServer) exitWith {};


//////////////////////////////////////////////////////
//  HOW TO MANUALLY CREATE THE MISSION:   
//  1)YOU MUST PLACE THE HQ LOCATION
//  2)DEFINE THE CAPTURABLE ZONES
//  -- YOU CAN ALSO JUST PUT A HQ SOMEWHERE AND LET THE ZONES BEING RANDOMLY GENERATED
//  -- YOU MUST PLACE MANUALLY THE HQ IF YOU ARE ALREADY PLACING THE ZONES BY HAND 
//  3) DONT FORGET TO DEFINE THE VARIABLES BELOW. If you are ONLY placing the HQ by hand, you just need to put "hq_manually_placed" to 
//     "true" instead of "false". If you are also placing the zones by hand, make "zones_manually_placed" to "true".
/////////////////////////////////////////////////////////////
//  1) In the gamelogic, for the HQ( !! MAKE ONLY ONE HQ !!): _null=[getpos this] execVM "initHQ\BluHQinit.sqf" 
// 
//  2) In the init of gamelogic, to create a capturable enemy zone: 
//      _null = ["zone name",pts awarded upon capture, zone radius,getpos this,false/true,false/true] execvm "createzone.sqf";
//        "zone name": name of the zone
//        pts awarded upon capture: points you earn when you capture the zone. Also the amount of points of army power you take and receive
//          from the enemy after capture
//        zone radius: how large the zone is
//        getpos this: It's the position of the zone. The gamelogic actually. You don't have to modify this.
//        false/true: if the zone is fortified or not. If the zone is fortified, there will be a bit more enemies and they will be maning 
//          static defences if there are any
//        false/true: if the zone is selecting randomly a prefab base. Prefab is selected according to the zone radius. The bigger the zone,
//          the bigger the prefab asset will be chosen.
//
//  EXAMPLE, in the init of a gamelogic you have placed on the map:
//    _null=["OP Xander",20,200,getpos this,true,false] execvm "initZones\createzone.sqf"
//    
//  Note, this has been moved to the functions library!
//  use '_null=["OP Xander",20,200,getpos this,true,false] spawn duws_fnc_createzone' instead!
//
//  3) Define these variables:

// choose between "tropical" - "arid" - "temperate" - "temperate_cold" - "mediterranean"
if (isNil "weather_type") then {weather_type = "tropical";};publicVariable "weather_type";
// set the skill range of ennemy AI
if (isNil "opfor_ai_skill") then {opfor_ai_skill = [0.1,0.3];};publicVariable "opfor_ai_skill";
// set the skill range of friendly AI, from 0 to 1 (0 being completely dumb)
if (isNil "blufor_ai_skill") then {blufor_ai_skill = [0.4,0.7];};publicVariable "blufor_ai_skill";

// you must specify if you have manually placed HQ or not. false = HQ is randomly placed, true = you have manually placed the HQ
hq_manually_placed = false;publicVariable "hq_manually_placed";
// you must specify if you have manually placed the zones or not. false = zones are randomly generated, true = you have manually placed the zones
zones_manually_placed = false;publicVariable "zones_manually_placed";
zones_max_dist_from_hq = 7500;publicVariable "zones_max_dist_from_hq";
dynamic_weather_enable = true;publicVariable "dynamic_weather_enable";	
manually_chosen = false;publicVariable "manually_chosen";

if (isNil "enable_fast_travel") then { enable_fast_travel = true; };publicVariable "enable_fast_travel";
// chopper taxi (support) will fast travel (teleport) or not
if (isNil "enableChopperFastTravel") then { enableChopperFastTravel = true; };publicVariable "enableChopperFastTravel";
// Starting CP
if (isNil "commandpointsblu1") then { commandpointsblu1 = 20; };publicVariable "commandpointsblu1";
// STARTING ARMY POWER
if (isNil "blufor_ap") then {blufor_ap = 0;};publicVariable "blufor_ap";
opfor_ap = 0; 


///////////////////////////////////////////////////////
// initialise variables
//////////////////////////////////////////////////////
// MOST OF THE VALUES ARE BEING OVERWRITTEN BY PLAYER INPUT AT THE BEGINNING
//////////////////////////////////////////////////////
 
/////////////////////////////////////////////////////////////
debugmode = false;  // Debug mode, kind of obsolete
/// ------------- VALUES UNDER THIS ARE OVERWRITTEN
zones_number = 9; // Number of capturables zones to create (when zones are created randomly)
zones_spacing = 1200; // minimum space between 2 zones (in meters) // SOON OBSOLETE
zones_max_radius = 1000;   // Determine the maximum radius a generated zone can have   
zones_min_radius = 200; // Determine the minium radius a generated zone can have. SHOULD NOT BE UNDER 200.

///////////////////////////////////////////////////////
// This mission will have a harder time generating stuff if a lot of the terrain of the island is sloped, meaning that valid locations
// will be harder/take longer to find (side missions, mission init).
// Keep that in mind when tweaking the zones amount/radius value.
/////////////////////////////////////////////////////////


// nber of missions succes(!!dont touch!!)
missions_success = 0;publicVariable "missions_success";

zones_created = false;publicVariable "zones_created";
blu_hq_created = false;publicVariable "blu_hq_created";
can_get_mission = true;publicVariable "can_get_mission";
failsafe_zones_not_found = false;publicVariable "failsafe_zones_not_found";
createcenter sideLogic;
LogicGroup = createGroup SideLogic;publicVariable "LogicGroup";
locator_hq_actived = false;publicVariable "locator_hq_actived";
op_zones_index = 0;publicVariable "op_zones_index";
clientisSync = false;publicVariable "clientisSync";
fobSwitch = false;publicVariable "fobSwitch";
player_is_choosing_hqpos = false;publicVariable "player_is_choosing_hqpos";

if (isNil "amount_zones_created") then {
    amount_zones_created = 0;
};

publicVariable "amount_zones_created";

if (isNil "HQ_pos_found_generated") then {
    HQ_pos_found_generated = false;
}; 	

publicVariable "HQ_pos_found_generated";

if (isNil "chosen_settings") then {
    chosen_settings = false;
};

publicVariable "chosen_settings";

if (isNil "chosen_hq_placement") then {
    chosen_hq_placement = false;
};
	
publicVariable "chosen_hq_placement";
	
if (isNil "zoneundercontrolblu") then {
	zoneundercontrolblu = 0;
};

publicVariable "zoneundercontrolblu";

if (isNil "amount_zones_captured") then {
	amount_zones_captured = 0;
};

publicVariable "amount_zones_captured";

if (isNil "savegameNumber") then {	
	savegameNumber = 0;
};

publicVariable "savegameNumber";

if (isNil "capturedZonesNumber") then {	
	capturedZonesNumber = 0;
};	

publicVariable "capturedZonesNumber";

if (isNil "finishedMissionsNumber") then {	
	finishedMissionsNumber = 0;
};	

publicVariable "finishedMissionsNumber";

if (isNil "OvercastVar") then {	
	OvercastVar = 0;
};	

publicVariable "OvercastVar";

if (isNil "FogVar") then {	
	FogVar = 0;
};

publicVariable "FogVar";

if (isNil "createzone_server") then {	
	createzone_server = false;
};

publicVariable "createzone_server";

if (isNil "mission_number_of_zones_captured") then {	
	mission_number_of_zones_captured = 0;
};

publicVariable "mission_number_of_zones_captured";

// this is a special one (if/else)
if (isNil "Array_of_FOBS") then {
    // if the player is sp or server or no fobs have been created
	Array_of_FOBS = [];
}
else /// JIP for the client
{
    {
        [_x] call duws_fnc_FOBactions;
    } forEach Array_of_FOBS;
};

if (isNil "Array_of_FOBname") then {
	Array_of_FOBname = [];
};

publicVariable "Array_of_FOBS";
publicVariable "Array_of_FOBname";

game_master = ["player1"];publicVariable "game_master";

 waitUntil {chosen_settings && createzone_server};

 if (!manually_chosen) then {
	    if (!zones_created) then {      // CHECK IF ZONES ARE PLACED, IF NOT EXECUTE locatorZonesV1.sqf
        _zones_create = [50, 0.2] spawn duws_fnc_locatorzonesV1;   // CHECK IF ZONES HAVE ALREADY BEEN PLACED
    };
 } else {
     if (!zones_created) then {      // CHECK IF ZONES ARE PLACED, IF NOT EXECUTE locatorZonesV1.sqf
     _zones_create = {[50,0.2] spawn duws_fnc_locatorzonesV2} remoteExec ["bis_fnc_spawn", game_master select 0];   // CHECK IF ZONES HAVE ALREADY BEEN PLACED
     };
 };

//FIX ME: Execution Order requires zone bonus and reward be before WARCOM INIT
 if (isServer) then {
     // initialise the ressources per zone bonus
     _basepoint = [] spawn duws_fnc_zonesundercontrol;
 };

 // init the bonuses you get when capturing zones
 _basepoint = [] spawn duws_fnc_zones_bonus;

waitUntil { !isNil "serv_zones_array" };
diag_log format ["serv_zones_array: %1", serv_zones_array];
[serv_zones_array, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 2000] call duws_fnc_WARCOM_init; // 2700 is 40 mins

if (isServer) then {
    // group cleaning script
    0 = [
        60*60, // seconds to delete dead bodies (0 means don't delete) 
        60*60, // seconds to delete dead vehicles (0 means don't delete)
        60*60, // seconds to delete dropped weapons (0 means don't delete)
        0, // seconds to deleted planted explosives (0 means don't delete)
        60*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
    ] spawn duws_fnc_repetitive_cleanup;	
};



if (zones_manually_placed) then {
    waitUntil {!isNil ("Array_of_OPFOR_zones")};
    sleep 1;
    _warcom_init = [Array_of_OPFOR_zones, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 1500] call duws_fnc_WARCOM_init;
};

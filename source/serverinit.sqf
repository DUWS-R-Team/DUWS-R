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
// preprocess the qrf file for the EH
QRF_test = compile preprocessFile "WARCOM\WARCOM_opf_qrf.sqf";


// nber of missions succes(!!dont touch!!)
missions_success = 0;publicVariable "missions_success";

zones_created = false;publicVariable "zones_created";
blu_hq_created = false;publicVariable "blu_hq_created";
can_get_mission = true;publicVariable "can_get_mission";
failsafe_zones_not_found = false;publicVariable "failsafe_zones_not_found";
createcenter sideLogic;
LogicGroup = createGroup SideLogic;publicVariable "LogicGroup";
PAPABEAR=[West,"HQ"];publicVariable "PAPABEAR";
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

// this is a special one (if/else)
if (isNil "Array_of_FOBS") then {
    // if the player is sp or server or no fobs have been created
	Array_of_FOBS = [];
}
else /// JIP for the client
{
    {
        [_x] execVM "support\FOBactions.sqf";
    } forEach Array_of_FOBS;
};

if (isNil "Array_of_FOBname") then {
	Array_of_FOBname = [];
};

publicVariable "Array_of_FOBS";
publicVariable "Array_of_FOBname";

game_master = ["player1"];publicVariable "game_master";
	


waitUntil { !isNil "serv_zones_array" };
diag_log format ["serv_zones_array: %1", serv_zones_array];
_warcom_init = [serv_zones_array, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 2000] execVM "WARCOM\WARCOM_init.sqf"; // 2700 is 40 mins
waitUntil {scriptDone _warcom_init};

if (isServer) then {
    // group cleaning script
    0 = [
        60*60, // seconds to delete dead bodies (0 means don't delete) 
        60*60, // seconds to delete dead vehicles (0 means don't delete)
        60*60, // seconds to delete dropped weapons (0 means don't delete)
        0, // seconds to deleted planted explosives (0 means don't delete)
        60*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
    ] execVM 'repetitive_cleanup.sqf';	
};


if (isServer) then {
    // initialise the ressources per zone bonus
    _basepoint = [] execVM "zonesundercontrol.sqf";
};

// init the bonuses you get when capturing zones
_basepoint = [] execVM "zones_bonus.sqf";

if (zones_manually_placed) then {
    waitUntil {!isNil ("Array_of_OPFOR_zones")};
    sleep 1;
    _warcom_init = [Array_of_OPFOR_zones, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 1500] execVM "WARCOM\WARCOM_init.sqf";
};



























/* waitUntil { time > 0 };

vActiveMission=0; publicVariable "vActiveMission";
vActiveMarker="none"; publicVariable "vActiveMarker";
vActiveName="none"; publicVariable "vActiveName";

if (vVehicleLock == 0) then {
	vMissionScore=100; publicVariable "vMissionScore";
} else {
	vMissionScore=0; publicVariable "vMissionScore";
};
vDestroyMission=false; publicVariable "vDestroyMission";
vNewMissionTimer=0; publicVariable "vNewMissionTimer";
vMissionStartTime=0; publicVariable "vMissionStartTime";
vParadropCount=0; publicVariable "vParadropCount";
vArmorInArea=false; publicVariable "vArmorInArea";
vMortarInArea=false; publicVariable "vMortarInArea";
vHeliInArea=false; publicVariable "vHeliInArea";
vActiveRecruitsAI=0; publicVariable "vActiveRecruitsAI";
vClaimedLeader="PL1"; publicVariable "vClaimedLeader";
vClientRequestInfo="none"; publicVariable "vClientRequestInfo";
vEvacSpawned=false; publicVariable "vEvacSpawned";

if (vSupplyEnable == 1) then {
	vSupplyTimer = time;
	publicVariable "vSupplyTimer";
	vSupplyDown = false;
	publicVariable "vSupplyDown";
};

"vClientRequestInfo" addPublicVariableEventHandler {
	_id = 0;
	if (vClientRequestInfo == "PL1") then { _id = owner Player1; };
	if (vClientRequestInfo == "PL2") then { _id = owner Player2; };
	if (vClientRequestInfo == "PL3") then { _id = owner Player3; };
	if (vClientRequestInfo == "PL4") then { _id = owner Player4; };
	if (vClientRequestInfo == "PL5") then { _id = owner Player5; };
	if (vClientRequestInfo == "PL6") then { _id = owner Player6; };
	if (vClientRequestInfo == "PL7") then { _id = owner Player7; };
	if (vClientRequestInfo == "PL8") then { _id = owner Player8; };
	if (vClientRequestInfo == "PL9") then { _id = owner Player9; };
	if (vClientRequestInfo == "PL10") then { _id = owner Player10; };
	if (vClientRequestInfo == "PL11") then { _id = owner Player11; };
	if (vClientRequestInfo == "PL12") then { _id = owner Player12; };
	vClientRequestInfo="none";
	
	_id publicVariableClient "vActiveMission";
	_id publicVariableClient "vActiveMarker";
	_id publicVariableClient "vActiveName";
	_id publicVariableClient "vRedInArea";
	_id publicVariableClient "vBlueInArea";
	_id publicVariableClient "vDetectedInArea";
	_id publicVariableClient "vMHQDead";
	_id publicVariableClient "vMissionScore";
	_id publicVariableClient "vArmorInArea";
	_id publicVariableClient "vMortarInArea";
	_id publicVariableClient "vHeliInArea";
	_id publicVariableClient "vActiveRecruitsAI";
	_id publicVariableClient "vEvacSpawned";

	if (vSupplyEnable == 1) then {
		_id publicVariableClient "vSupplyTimer";
		_id publicVariableClient "vSupplyDown";
	};
};

_CreateMission=false;
_CleanupTimer=time+300;
vLastMission=0;

while {true} do {
	if (time > _CleanupTimer) then { nul = [] execVM "cleanup.sqf"; _CleanupTimer=time+300; };
	if (vActiveMission == 0) then { vNewMissionTimer = time + 60; publicVariable "vNewMissionTimer"; vActiveMission=1000; publicVariable "vActiveMission"; };

	if ((time > vNewMissionTimer) && (vActiveMission == 1000)) then {
		while {true} do {
			scopeName "MissionGen";
			vActiveMission=1+floor(random 51); 
			if (vActiveMission != vLastMission) then { breakOut "MissionGen"; };
		};
		vLastMission=vActiveMission;
		publicVariable "vActiveMission";	
		vMissionStartTime=time; publicVariable "vMissionStartTime";
		vParadropCount=0;
		_CreateMission=true;
	};

	if (vDestroyMission && (vActiveMission > 0)) then {
		nul = [] execVM "destroymission.sqf"; 
		vDestroyMission=false; publicVariable "vDestroyMission";
		vActiveMission=0; publicVariable "vActiveMission";
		vMissionScore=vMissionScore+1; publicVariable "vMissionScore";
		systemChat format [ "Missions done: %1", vMissionScore ];
	};
	
	if (_CreateMission) then {
		if (vActiveMission == 1) then { nul = [ "Frini" ] execVM "createmission.sqf" };
		if (vActiveMission == 2) then { nul = [ "Ifestiona" ] execVM "createmission.sqf" };
		if (vActiveMission == 3) then { nul = [ "Galati" ] execVM "createmission.sqf" };
		if (vActiveMission == 4) then { nul = [ "Syrta" ] execVM "createmission.sqf" };
		if (vActiveMission == 5) then { nul = [ "Kore" ] execVM "createmission.sqf" };
		if (vActiveMission == 6) then { nul = [ "Orino" ] execVM "createmission.sqf" };
		if (vActiveMission == 7) then { nul = [ "Koroni" ] execVM "createmission.sqf" };
		if (vActiveMission == 8) then { nul = [ "Negades" ] execVM "createmission.sqf" };
		if (vActiveMission == 9) then { nul = [ "Neri" ] execVM "createmission.sqf" };
		if (vActiveMission == 10) then { nul = [ "Panochori" ] execVM "createmission.sqf" };
		if (vActiveMission == 11) then { nul = [ "Therisa" ] execVM "createmission.sqf" };
		if (vActiveMission == 12) then { nul = [ "Poliakko" ] execVM "createmission.sqf" };
		if (vActiveMission == 13) then { nul = [ "Alikampos" ] execVM "createmission.sqf" };
		if (vActiveMission == 14) then { nul = [ "Lakka" ] execVM "createmission.sqf" };
		if (vActiveMission == 15) then { nul = [ "Stavros" ] execVM "createmission.sqf" };
		if (vActiveMission == 16) then { nul = [ "Anthrakia" ] execVM "createmission.sqf" };
		if (vActiveMission == 17) then { nul = [ "Rodopoli" ] execVM "createmission.sqf" };
		if (vActiveMission == 18) then { nul = [ "Charkia" ] execVM "createmission.sqf" };
		if (vActiveMission == 19) then { nul = [ "Kalochori" ] execVM "createmission.sqf" };
		if (vActiveMission == 20) then { nul = [ "Dorida" ] execVM "createmission.sqf" };
		if (vActiveMission == 21) then { nul = [ "Chalkeia" ] execVM "createmission.sqf" };
		if (vActiveMission == 22) then { nul = [ "Pyrgos", "Pyrgos Military Base" ] execVM "createmission.sqf" };
		if (vActiveMission == 23) then { nul = [ "Sofia" ] execVM "createmission.sqf" };
		if (vActiveMission == 24) then { nul = [ "Molos" ] execVM "createmission.sqf" };
		if (vActiveMission == 25) then { nul = [ "Ioannina" ] execVM "createmission.sqf" };
		if (vActiveMission == 26) then { nul = [ "PowerPlant", "Power Plant" ] execVM "createmission.sqf" };
		if (vActiveMission == 27) then { nul = [ "Panagia" ] execVM "createmission.sqf" };
		if (vActiveMission == 28) then { nul = [ "Feres" ] execVM "createmission.sqf" };
		if (vActiveMission == 29) then { nul = [ "Selakano" ] execVM "createmission.sqf" };
		if (vActiveMission == 30) then { nul = [ "MilBase", "Military Base North" ] execVM "createmission.sqf" };
		if (vActiveMission == 31) then { nul = [ "FireBase", "Fire Base" ] execVM "createmission.sqf" };
		if (vActiveMission == 32) then { nul = [ "Zaros" ] execVM "createmission.sqf" };
		if (vActiveMission == 33) then { nul = [ "Factory" ] execVM "createmission.sqf" };
		if (vActiveMission == 34) then { nul = [ "Oreokastro" ] execVM "createmission.sqf" };
		if (vActiveMission == 35) then { nul = [ "Vikos" ] execVM "createmission.sqf" };
		if (vActiveMission == 36) then { nul = [ "Hill299", "Hill 299" ] execVM "createmission.sqf" };
		if (vActiveMission == 37) then { nul = [ "Hill234", "Hill 234" ] execVM "createmission.sqf" };
		if (vActiveMission == 38) then { nul = [ "Abdera" ] execVM "createmission.sqf" };
		if (vActiveMission == 39) then { nul = [ "AirstripNorth", "Airstrip North" ] execVM "createmission.sqf" };
		if (vActiveMission == 40) then { nul = [ "Mine" ] execVM "createmission.sqf" };
		if (vActiveMission == 41) then { nul = [ "AirstripSouth", "Airstrip South" ] execVM "createmission.sqf" };
		if (vActiveMission == 42) then { nul = [ "Crossroads" ] execVM "createmission.sqf" };
		if (vActiveMission == 43) then { nul = [ "Checkpoint" ] execVM "createmission.sqf" };
		if (vActiveMission == 44) then { nul = [ "FarosValley", "Faros Valley" ] execVM "createmission.sqf" };
		if (vActiveMission == 45) then { nul = [ "Dump" ] execVM "createmission.sqf" };
		if (vActiveMission == 46) then { nul = [ "Gori" ] execVM "createmission.sqf" };
		if (vActiveMission == 47) then { nul = [ "Aristi" ] execVM "createmission.sqf" };
		if (vActiveMission == 48) then { nul = [ "FriniWoods", "Frini Woods" ] execVM "createmission.sqf" };
		if (vActiveMission == 49) then { nul = [ "Nidasos" ] execVM "createmission.sqf" };
		if (vActiveMission == 50) then { nul = [ "Athira" ] execVM "createmission.sqf" };
		if (vActiveMission == 51) then { nul = [ "Paros" ] execVM "createmission.sqf" };
		_CreateMission = false;
	};

	if (vClaimedLeader != "none") then {
		if (vClaimedLeader == "PL1") then { if (alive Player1) then { group Player1 selectLeader Player1 }; };
		if (vClaimedLeader == "PL2") then { if (alive Player2) then { group Player2 selectLeader Player2 }; };
		if (vClaimedLeader == "PL3") then { if (alive Player3) then { group Player3 selectLeader Player3 }; };
		if (vClaimedLeader == "PL4") then { if (alive Player4) then { group Player4 selectLeader Player4 }; };
		if (vClaimedLeader == "PL5") then { if (alive Player5) then { group Player5 selectLeader Player5 }; };
		if (vClaimedLeader == "PL6") then { if (alive Player6) then { group Player6 selectLeader Player6 }; };
		if (vClaimedLeader == "PL7") then { if (alive Player7) then { group Player7 selectLeader Player7 }; };
		if (vClaimedLeader == "PL8") then { if (alive Player8) then { group Player8 selectLeader Player8 }; };
		if (vClaimedLeader == "PL9") then { if (alive Player9) then { group Player9 selectLeader Player9 }; };
		if (vClaimedLeader == "PL10") then { if (alive Player10) then { group Player10 selectLeader Player10 }; };
		if (vClaimedLeader == "PL11") then { if (alive Player11) then { group Player11 selectLeader Player11 }; };
		if (vClaimedLeader == "PL12") then { if (alive Player12) then { group Player12 selectLeader Player12 }; };
	};
	
	sleep 1;
};
 */
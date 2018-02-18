diag_log format ["------------------ DUWS-R START ----v0------ player: %1", profileName];


if (isServer) then { nul = [] execVM "serverinit.sqf"; };
if (isDedicated) exitWith {};
waitUntil {!isNull player};

player allowDamage false;

persistent_stat_script_init = [] execVM "persistent\persistent_stats_init.sqf";
waitUntil {scriptDone persistent_stat_script_init};
execvm "dynamic_music\dyn_music_init.sqf";


#include "dialog\supports_init.hpp"
#include "dialog\squad_number_init.hpp"
	
if (hasInterface) then { execVM "misc\gps_marker.sqf";};
if (!isMultiplayer) then {
	getsize_script = [player] execVM "mapsize.sqf";
};
staminaEnabled = ["Stamina", false] call BIS_fnc_getParamValue;
if(staminaEnabled == 0) then {
    staminaEnabled = false;
} else {
    staminaEnabled = true;
};
// IF MP
if (isMultiplayer) then {

	// Get the variables from the parameters lobby
	_revive_activated = ["Revive", 1] call BIS_fnc_getParamValue;
	DUWSMP_CP_death_cost = ["DeathPenalty", 1] call BIS_fnc_getParamValue;
    //staminaEnabled = ["Stamina", 0] call BIS_fnc_getParamValue;

    /*if(staminaEnabled == 0) then {
        staminaEnabled = false;
    } else {
        staminaEnabled = true;
    };*/

    if (support_armory_available) then {
        hq_blu1 addaction ["<t color='#ff0066'>Armory (VA)</t>","bisArsenal.sqf", "", 0, true, true, "", "_this == player"];
        {
            _x addaction ["<t color='#ff0066'>Armory (VA)</t>","bisArsenal.sqf", "", 0, true, true, "", "_this == player"];
        } forEach (Array_of_FOBS);
    };

	if (_revive_activated == 1) then {execVM "duws_revive\reviveInit.sqf"};
    
	PlayerKilledEH = player addEventHandler ["killed", {
        commandpointsblu1 = commandpointsblu1 - DUWSMP_CP_death_cost;
        publicVariable "commandpointsblu1";
    }];
    
    PlayerBetrayerEH = player addEventHandler ["HandleRating", {
        // If playerRating is negative (traitor) then reset to zero
        _playerRating = rating (_this select 0);
        if (_playerRating < 0) then {
            player addRating (0 - _playerRating);
        };
        // If final rating is positive, do not modify, else zero.
        _rating = _this select 1;
        [0,_rating] select ((_playerRating - _rating) > 0);    
    }];
    
	"support_specialized_training_available" addPublicVariableEventHandler {lbSetColor [2103, 11, [0, 1, 0, 1]];};
    "support_armory_available" addPublicVariableEventHandler {
        hq_blu1 addaction ["<t color='#ff0066'>Armory (VA)</t>","bisArsenal.sqf", "", 0, true, true, "", "_this == player"];
        {
            _x addaction ["<t color='#ff0066'>Armory (VA)</t>","bisArsenal.sqf", "", 0, true, true, "", "_this == player"];
        } forEach (Array_of_FOBS);
        lbSetColor [2103, 5, [0, 1, 0, 1]];
    };

    // change the shown CP for request dialog
    "commandpointsblu1" addPublicVariableEventHandler {ctrlSetText [1000, format["%1",commandpointsblu1]]; };

	// each time there is a new FOB
	"Array_of_FOBS" addPublicVariableEventHandler {
        if (!fobSwitch) then {
            [] execVM "support\FOBreceiveaction.sqf";
        };
		fobSwitch = false;
		//Add the FoB to the list of revive locations.
		_fobAmount = count Array_of_FOBS;
		_fobIndex = _fobAmount - 1;
		_createdFOB = Array_of_FOBS select _fobIndex;
		
		[missionNamespace, _createdFOB] call BIS_fnc_addRespawnPosition;
	};
	
	if (!isServer) then {
        "savegameNumber" addPublicVariableEventHandler {[] execVM "savegameClient.sqf";};
	};
	if (!isServer) then {
        "capturedZonesNumber" addPublicVariableEventHandler {[] execVM "persistent\persistent_stats_zones_add.sqf";}; // change the shown CP for request dialog	
	};
	if (!isServer) then {
        "finishedMissionsNumber" addPublicVariableEventHandler {[] execVM "persistent\persistent_stats_missions_total.sqf";}; // change the shown CP for request dialog	
	};	
		
	player globalChat format ["gamemaster: %1", game_master];
	player globalChat format ["HQ_pos_found_generated: %1", HQ_pos_found_generated];
	
	if (!isDedicated && !HQ_pos_found_generated) then { // SERVER INIT
		if (((vehiclevarname player) in game_master)) then {
			DUWS_host_start = false;
			publicVariable "DUWS_host_start";
			waitUntil {time > 0.1};
			getsize_script = [player] execVM "mapsize.sqf";
			DUWS_host_start = true;
			publicVariable "DUWS_host_start";

			// init High Command
			_handle = [] execVM "dialog\hc_init.sqf";
			waitUntil {scriptDone getsize_script};
		};
	};
};

if (!isDedicated && !HQ_pos_found_generated) then {
	if (((vehiclevarname player) in game_master)) then {
		_null = [] execVM "dialog\startup\hq_placement\placement.sqf";
		waitUntil {chosen_hq_placement};	
		player globalChat format ["hq_manually_placed: %1", hq_manually_placed];
		player globalChat format ["player_is_choosing_hqpos: %1", player_is_choosing_hqpos];
		// create random HQ
		if (!hq_manually_placed && !player_is_choosing_hqpos) then {
			player globalChat "lance recherche position...";
			hq_create = [20, 0.015] execVM "initHQ\locatorHQ.sqf";
			waitUntil {scriptDone hq_create};	
		};
	};
};
	
/*
//////// DEBUG LOOP /////////////
[] spawn {
	while {true} do {
	hintsilent format["OvercastVar: %1\nFogVar: %2",OvercastVar,FogVar];
	sleep 1;
	};
};
//////// DEBUG LOOP /////////////
*/

// AMBIANCE LOOP
//_nul = [] execVM "musicloop.sqf";

if (isServer) then {
    // group cleaning script
    clean = [
        5*60,   // seconds to delete dead bodies (0 means don't delete)
        5*60,   // seconds to delete dead vehicles (0 means don't delete)
        0,      // seconds to delete immobile vehicles (0 means don't delete)
        5*60,   // seconds to delete dropped weapons (0 means don't delete)
        0,      // seconds to deleted planted explosives (0 means don't delete)
        10*60   // seconds to delete dropped smokes/chemlights (0 means don't delete)
   ] execVM 'repetitive_cleanup.sqf';
};

if (hasInterface) then { 
    // WHEN CLIENT CONNECTS INIT (might need sleep)
    waitUntil {isPlayer Player};
    hintsilent "Waiting for the host to find an HQ...";	
    waitUntil {HQ_pos_found_generated && time > 0.1};
    player setpos [(getpos hq_blu1 select 0),(getpos hq_blu1 select 1)+10];
    _drawicon = [] execVM "inithq\drawIcon.sqf";
    hintsilent "Waiting for the host to select the campaign parameters...";	
    waitUntil {chosen_settings};	
    [hq_blu1] execVM "initHQ\HQaddactions.sqf";
    sleep 1;
    player setdamage 0;	
    player allowDamage true;
    hintsilent format["Joined game, welcome to %1, %2",worldName,profileName];

    // init High Command
    _handle = [] execVM "dialog\hc_init.sqf";
    [] execVM "dialog\startup\weather_client.sqf";

    if(!staminaEnabled) then {
        player enableStamina false;
    };
};

if (!isMultiplayer) then {
    _handle = [] execVM "dialog\hc_init.sqf";
};





// INIT the operative list
execVM "dialog\operative\operator_init.sqf";

// Create help for DUWS
_index = player createDiarySubject ["help","DUWS-R Manual"]; 
player createDiaryRecord ["help", ["Feedback/bug report", "Internal team members: Use the ""issues"" section to report items."]];
player createDiaryRecord ["help", ["Export to another island", "<font color='#FF0000'>How to export to another island:</font color><br />You just need to take the .pbo file and rename it with the name of the island you want to export the mission to. You don't have anything else to do<br /><br />Example:<br />SP_DUWS-R.stratis.pbo >>> SP_DUWS-R.chernarus.pbo"]];
player createDiaryRecord ["help", ["Credits", "Many thanks goes out to everyone that worked on the original DUWS by kibot!"]];
player createDiaryRecord ["help", ["Command Points (CP)", "Command points are used to purchase vehicles, units and ask for support (like artillery or save the game outside the base). To obtain Command points, you must capture the enemy controlled zones (red zones on the map) or execute side missions. You also receive 3 command points for each zone you have under your control every 30 minutes."]];
player createDiaryRecord ["help", ["Army Power (AP)", "Army power represent the strenght of the BLUFOR forces present on the island. By capturing enemy positions and accomplishing side missions, you will add Army Power to your army. The attack waves of the BLUFOR army will become stronger."]];
player createDiaryRecord ["help", ["Experience", "By accomplishing side missions, capturing zones and islands, you will increase your experience. With experience, you will automatically unlock new abilties. Once you have an ability, a description of this ability will be available in the 'ability' tab in the briefing.<br />Capturing an island gives you <font color='#FF0000'>5 XP</font color><br />Achieving a side mission: <font color='#FF0000'>2 XP</font color><br />Capturing a zone: <font color='#FF0000'>1 XP</font color>"]];
player createDiaryRecord ["help", ["Saving the game", "You can save the game by resting at the base. Just go near the officer and select the action ""Rest"". Note that 6 hours will ellapse during that time. You can also save at any time by giving a SITREP in the support menu (0-8-1). Giving a SITREP does not make you wait, but it will cost you 1 CP for each save."]];
player createDiaryRecord ["help", ["Repairing/Rearming", "To repair, refuel or rearm a vehicle you need to unlock the ""vehicle refit"" support. Once you have it, you can call the support and your vehicle will be rearmed, repaired and refueled. Note that you must be close to the base to be able to use the vehicle refit."]];
player createDiaryRecord ["help", ["Support", "During the campaign you may unlock several support options at you HQ. You can access the available support in the radio menu (0-8). Note that calling for support cost CP."]];
player createDiaryRecord ["help", ["Making a FOB", "After you have captured your first zone, you'll get the ability to establish a FOB for 10 CP. A FOB allows you to rest(save) at remote locations outside the base. Establishing a FOB will also spawn some BLUFOR patrols around it and if there are enemies around it, you will be notified. To establish a FOB, you must make sure the zone around you is clear in a radius of 500 meters. Just go to the support menu and select 'Establish FOB'. A FOB will be deployed to your location."]];
player createDiaryRecord ["help", ["Side Missions", "You can request a side mission at the officer in the base. Successful side missions will not give any army power to the enemy, but will give you CP and increase your army power."]];
player createDiaryRecord ["help", ["Requesting units", "To request units, go to the officer at the base and select the action ""Request units""."]];
player createDiaryRecord ["help", ["Taking the Island", "At the beginning of the game, you are alone with your officer and only a few command points available, but as the war escalates, the BLUFOR HQ will start to launch attacks on enemy zone and will try to retake the island. You can help the main forces by assisting them in capturing the island, or you can also achieve side missions to boost the available assets of your army. It's up to you on how you want to play this campaign."]];

// Operatives
_index = player createDiarySubject ["operativehelp","Special operatives"];
player createDiaryRecord ["operativehelp", ["Skills", "<font color='#FF0000'>Aiming:</font color><br />Pretty self explanatory, how well the operative can aim, lead a target, compensante for bullet drop and manage recoil.<br /><br /><font color='#FF0000'>Reflexes:</font color><br />How fast the operator can react to a new threat and stabilize its aim.<br /><br /><font color='#FF0000'>Spotting:</font color><br />The operative ability to spot targets within it's visual or audible range, and how accurately he can spot targets.<br /><br /><font color='#FF0000'>Courage:</font color><br />Affects the morale of subordinates units of the operative, how likely they will flee, depending on what is in front of them and the squad status.<br /><br /><font color='#FF0000'>Communications:</font color><br />How quickly recognized targets are shared with the squad.<br /><br /><font color='#FF0000'>Reload speed:</font color><br />The operator's ability to switch weapon or reload quickly."]];
player createDiaryRecord ["operativehelp", ["Recruiting operatives", "Operatives can be recruited at the HQ, inside the ""request unit"" menu. When you recruit someone for the first time, you'll have to spend 5 CP. However, once an operative has been already recruited, has been ""injured""(killed) in battle, you can recruit it again for only 2 CP after a delay between 20 and 80 minutes."]];
player createDiaryRecord ["operativehelp", ["Overview", "You can recruit special operatives that will stay and progress with you for all the duration of the campaign. Some of these mens have special equipment, specialities and skills. Their skills will increase each time a zone is captured or a mission is accomplished, whether they're in your squad or not. However, when an operative is actually in the game, he will gain 10 spendable points wich can be assigned freely in any skill at the operative menu."]];

// MP notes
if (isMultiplayer) then {
    player createDiaryRecord ["help", ["MP notes", "The CP pool is common for everyone.<br /><br />While most support unlocks are indivdual, the Armory and the Specialized infantry training are common, and need to be unlocked only once by a single player.<br /><br />While everybody can rest to heal, only the host can save and skip the time.<br /><br />Only the host can request side mission and finish them. However, everyone receive the persistent stats and xp bonuses."]];
};

// MP notification
if (isMultiplayer) then {
	[] spawn {
		waitUntil {time > 5};
		["info",["MP Mechanics","Check the manual for the specifics of the DUWS-R in MP"]] call bis_fnc_showNotification;
	};
};

// create mission victory script //SPAWN BEGIN
[] spawn {

    // CREATE MAIN OBJECTIVE
    capture_island_obj = player createSimpleTask ["taskIsland"];
    capture_island_obj setSimpleTaskDescription ["The ennemy is controlling the island, we must take it back! Capture every zone under enemy control and the mission will succeed.<br />You can let your BLUFOR forces take the island by themselves and help them getting a bigger army by accomplishing side missions. Or you can capture the zones yourself and do all the big work. As the campaign progress, the war will escalate and the armies will get stronger and start to use bigger guns.<br />To capture a zone, you need to have more units inside the zone than the enemy.<br /><br />It's up to you on how you want to play this.<br />Good luck, soldier!","Take the island",""];

    // WAIT UNTIL ALL ZONES ARE CAPTURED
    waitUntil {sleep 1; amount_zones_created > 0};
    waitUntil {sleep 3; (zoneundercontrolblu >= amount_zones_created);}; // Toutes les zones sont capturées
    persistent_stat_script_win = [] execVM "persistent\persistent_stats_win.sqf";
    ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;
    capture_island_obj setTaskState "Succeeded";
    sleep 3;
    ["island_captured_win",true,true] call BIS_fnc_endMission;
};



if (mission_DUWS_firstlaunch) then {
    waitUntil {chosen_settings};
    sleep 8;
    ["info",["Buying troops","Go talk to your commander to buy troops and vehicles with CP"]] call bis_fnc_showNotification;
    sleep 2.5;
    ["info",["Command points","Acquire more CP by capturing enemy areas or accomplishing side missions"]] call bis_fnc_showNotification;

    sleep 15;
    ["info",["RESTING AND HEALING","Save the game and heal by resting at the base"]] call bis_fnc_showNotification;

    sleep 15;
    // SITREP
    ["sitrepinfo",["SITREP","You can also save the game by giving a SITREP"]] call bis_fnc_showNotification;

    sleep 20;
    ["info",["DUWS Manual","Check the manual in the briefing for more info"]] call bis_fnc_showNotification;

    profileNamespace setVariable ["profile_DUWS_firstlaunch", false]; 
    saveProfileNamespace;
};

//Cleanup unused players.
for[{_x = 2},{_x <= 20},{_x = _x + 1}] do {
    _thePlayer = missionNamespace getVariable format["player%1", _x];
    if(!isNil("_thePlayer")) then {
        if(!isPlayer _thePlayer) then {
            deleteVehicle _thePlayer;
        };
    };
};


_dynam = [player,"DynamicSupportMenu"] call BIS_fnc_addCommMenuItem;

//Loading player position and gear.
//TODO: Add bought supports.
/*
if(isServer) then 
{	
	execVM "persistent\missionSpecific\saveFuncs.sqf";
	waitUntil {!isNil "saveFuncsLoaded"};

	execVM "persistent\missionSpecific\loadAccount.sqf";
};
*/

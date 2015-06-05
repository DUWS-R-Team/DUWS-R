calltaxi = {
    helo setfuel 1;

    _foundPickupPos = [getpos player, 0,50,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    // try to find a pos, if no pos is found exit the script
    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid LZ nearby"; sleep 5; _art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;};

    // create marker on LZ
    markerpickup = format["lz%1%2", _foundPickupPos]; // Define marker name
    _markerstr = createMarker [str(markerpickup), _foundPickupPos];
    _markerstr setMarkerShape "ICON";
    str(markerpickup) setMarkerType "hd_end";
    str(markerpickup) setMarkerColor "ColorGreen";
    str(markerpickup) setMarkerText "LZ";

    // A POS NEAR THE PLAYER HAS BEEN FOUND, CHOOPA EN ROUTE
    commandpointsblu1 = commandpointsblu1 - 1;
    publicVariable "commandpointsblu1";

    // create the helipad to land and the waypoints
    helo setfuel 1;
    helo engineon true;
    helipad1 = createVehicle ["Land_HelipadEmpty_F", _foundPickupPos, [], 0, "NONE"]; 
    _wp = helogroup addWaypoint [[_foundPickupPos select 0, (_foundPickupPos select 1)-75], 0];
    _wp setWaypointType "MOVE";
    [helogroup, 1] setWaypointCombatMode "BLUE";

    _fobname = [1] call compile preprocessFile "random_name.sqf";
    _random1 = round random 9;
    _random2 = round random 9;
    
    pilot sideChat format["This is %1 %2-%3, we are approaching your location for pick up, check your map for the LZ",_fobname,_random1,_random2];

    waitUntil {_foundpickuppos distance helo < 350 or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad1;
    deleteMarker str(markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    }; 
    // ****************************************************

    helo land "GET IN";

    // spawn the door opening script
    _pickupSpawnopen = [helo,_foundpickuppos] spawn {
    helo = _this select 0;
    _lzPos = _this select 1;
    waitUntil {getpos helo distance _lzPos < 10};
    helo animateDoor ['door_R', 1];
    sleep 3;
    helo animateDoor ['door_L', 1];
    };    
    
    removeallactions helo;
    _action = helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", {_null = [] execvm "support\taxi\mapclickhelo.sqf"; _null = [] call taxi;}, "", 0, true, true, "", "_this == player"];
    _action2 = helo addaction ["<t color='#00b7ff'>Return to base</t>", {pilot sideChat format["This is %1 %2-%3, we are returning to base",_fobname,_random1,_random2]; _null = [] call main;}, "", 0, true, true, "", "_this == player"];
    //[markerpickup, helo, helogroup, pilot] call taxi;
    

};///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

taxi = {
    helo setfuel 1;

    _fobname = [1] call compile preprocessFile "random_name.sqf";
    _random1 = round random 9;
    _random2 = round random 9;
    
    waituntil {taxiCanTakeOff};
    helo setfuel 1;
    //removeallactions helo;
    
    [player,helotax] call BIS_fnc_removeCommMenuItem;

    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad1;
    deleteMarker str(markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    }; 
    // *****************************


    // everything is ok, player is in choppa
    playMusic [_music, 0];
    // helo lock true;
    titleText ["Pilot: Roger that, we are oscar mike...", "PLAIN DOWN"];
    
    deletemarker str(markerpickup);
    
    markerpickup = format["lz%1%2", ClickedTaxiPos]; // Define marker name
    _markerstr = createMarker [str(markerpickup), ClickedTaxiPos];
    _markerstr setMarkerShape "ICON";
    str(markerpickup) setMarkerType "hd_end";
    str(markerpickup) setMarkerColor "ColorGreen";
    str(markerpickup) setMarkerText "LZ";
    
    str(markerpickup) setMarkerPos ClickedTaxiPos; 

    // create the helipad to land and the waypoints
    helipad = createVehicle ["Land_HelipadEmpty_F", ClickedTaxiPos, [], 0, "NONE"];
    _wp = helogroup addWaypoint [ClickedTaxiPos,0];
    _wp setWaypointType "MOVE";
    [helogroup, 1] setWaypointCombatMode "BLUE";

    // spawn the door closing script
    _pickupSpawnclose = [helo] spawn {
    waitUntil {(istouchingground helo)};
    helo animateDoor ['door_R', 0];
    sleep 3;
    helo animateDoor ['door_L', 0];
    };

    waitUntil {sleep 0.5;helo distance helipad1 > 350  or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is away from LZ
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad1;
    deleteVehicle helipad;
    // helo lock false;
    deleteMarker str(markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    }; 
    // *****************************
    if (enableChopperFastTravel) then {
    // TELEPORT HELO NEAR LZ
    deleteVehicle helipad1;
    titleText ["En route to LZ...", "BLACK OUT", 3];
    sleep 3.5;
    helo setpos [getpos helipad select 0, (getpos helipad select 1)+1000, 150];
    sleep 3;
    titleText ["En route to LZ...", "BLACK IN", 4];
    };


    waitUntil {ClickedTaxiPos distance helo < 200  or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad;
    // helo lock false;
    deleteMarker str(markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    }; 
    // *****************************
    helo land "GET OUT";

    // spawn the door opening script
    _LzSpawnopen = [helo] spawn {
    waitUntil {getpos helo distance ClickedTaxiPos < 20};
    helo animateDoor ['door_R', 1];
    sleep 3;
    helo animateDoor ['door_L', 1];
    };



    // time to move ppl out of the helo;
    waitUntil {(getpos helo select 2 < 4 && helo distance helipad<20)  or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is near the ground
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad;
    // helo lock false;
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    }; 
    // *****************************
    titleText ["Pilot: We have arrived at the LZ", "PLAIN DOWN"];
    // helo lock false;
    {doGetOut _x; sleep 1;} forEach assignedCargo helo; //units group player;

    sleep 40;
    deleteMarker str(markerpickup);
    
    pilot sideChat format["This is %1 %2-%3, we are RTB",_fobname,_random1,_random2];

    [markerpickup, helo, helogroup, pilot] call main;
    
};/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

main = {
    taxiCanTakeOff = false;
    
    if (helipos distance helo < 10) exitwith {
        removeallactions helo;
        //_action = helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", "support\taxi\mapclickhelo.sqf", [markerpickup, helo, helogroup, pilot], 0, true, true, "", "_this == player"];
        _action = helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", {_null = [] execvm "support\taxi\mapclickhelo.sqf"; _null = [] call taxi;}, "", 0, true, true, "", "_this == player"];
        helo setfuel 0;
        helo engineon false;
    
        helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = helotax;
        //[markerpickup, helo, helogroup, pilot] call taxi;
    };
        
    if (helipos distance helo > 10) then {
        
        // spawn the door closing script
        _LzSpawnclose = [helo] spawn {
        sleep 2;
        helo animateDoor ['door_R', 0];
        sleep 3;
        helo animateDoor ['door_L', 0];
        };

        // create the helipad to land and the waypoints
        helipad1 = createVehicle ["Land_HelipadEmpty_F", helipos, [], 0, "NONE"]; 
        _wp = helogroup addWaypoint [[helipos select 0, (helipos select 1)-75], 0];
        _wp setWaypointType "MOVE";
        [helogroup, 1] setWaypointCombatMode "BLUE";

        _fobname = [1] call compile preprocessFile "random_name.sqf";
        _random1 = round random 9;
        _random2 = round random 9;    


        waitUntil {helipos distance helo < 350 or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is near the lz
        // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
        if (getdammage helo > 0.7 or !alive pilot) exitWith {
        deleteVehicle helipad1;
        deleteMarker str(markerpickup);
        hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
        // --- AJOUTER DE NOUVEAU LE SUPPORT
        sleep 15;
        calltaxifrombase = false;
        helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = helotax;
        }; 
        // ****************************************************

        // spawn smokeshell
        _smokePos = [helipos select 0, (helipos select 1)+ random 5];
        _smoke = "SmokeShellGreen" createVehicle _smokePos;
        _chemlight = "Chemlight_green" createVehicle _smokePos;

        helo land "GET IN";

        // spawn the door opening script
        _pickupSpawnopen = [helo,helipos] spawn {
        waitUntil {getpos helo distance helipos < 10};
        helo animateDoor ['door_R', 1];
        sleep 3;
        helo animateDoor ['door_L', 1];
        }; 
        
        waituntil {(istouchingground helo)};
        removeallactions helo;
        _action = helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", {_null = [] execvm "support\taxi\mapclickhelo.sqf"; _null = [] call taxi;}, "", 0, true, true, "", "_this == player"];
        helo setfuel 0;
        helo engineon false;
    
        helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = helotax;
        //[markerpickup, helo, helogroup, pilot] call taxi;
    };
    
};/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

start = {
    _foundPickupPos = [];
    taxiCanTakeOff = false;
    _hqpos = PosOfBLUHQ;

    _music = call compile preprocessFile "support\taxi\random_music.sqf";

    if (commandpointsblu1 < 1) exitWith {
      ["info",["Not enough command points","Not enough Command Points (1 CP required)"]] call bis_fnc_showNotification;
      sleep 15;
      helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
      helotax = helotax;
    };

    _foundPickupPos = [_hqpos, 0,50,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    // try to find a pos, if no pos is found exit the script
    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid LZ nearby"; sleep 5; _art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;};

    // create marker on LZ
    markerpickup = format["lz%1%2", _foundPickupPos]; // Define marker name
    _markerstr = createMarker [str(markerpickup), _foundPickupPos];
    _markerstr setMarkerShape "ICON";
    str(markerpickup) setMarkerType "hd_end";
    str(markerpickup) setMarkerColor "ColorGreen";
    str(markerpickup) setMarkerText "LZ";

    // A POS NEAR THE PLAYER HAS BEEN FOUND, CHOOPA EN ROUTE
    commandpointsblu1 = commandpointsblu1 - 1;
    publicVariable "commandpointsblu1";

    // create the chopper, gunners and pilots
    helo = createVehicle ["B_Heli_Transport_01_camo_F", [_hqpos select 0, (_hqpos select 1)+2000, 200],[], 0, "FLY"];
    helogroup = createGroup west; 
    pilot = helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _copilot = helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _gunner1 = helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _gunner2 = helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    helo flyInHeight 150;
     
    pilot setcaptive true;
    pilot allowfleeing 0;
    pilot disableAI "Target"; 
     
    pilot moveindriver helo;
    _copilot moveInTurret [helo, [0]]; 
    _gunner1 moveInTurret [helo, [1]];
    _gunner2 moveInTurret [helo, [2]];

    // spawn the door closing script
    _LzSpawnclose = [helo] spawn {
    helo = _this select 0;
    sleep 2;
    helo animateDoor ['door_R', 0];
    sleep 3;
    helo animateDoor ['door_L', 0];
    };

    // create the helipad to land and the waypoints
    helipad1 = createVehicle ["Land_HelipadEmpty_F", _foundPickupPos, [], 0, "NONE"]; 
    _wp = helogroup addWaypoint [[_foundPickupPos select 0, (_foundPickupPos select 1)-75], 0];
    _wp setWaypointType "MOVE";
    [helogroup, 1] setWaypointCombatMode "BLUE";

    _fobname = [1] call compile preprocessFile "random_name.sqf";
    _random1 = round random 9;
    _random2 = round random 9;    

    pilot sideChat format["This is %1 %2-%3, we are approaching your location for pick up, check your map for the LZ",_fobname,_random1,_random2];

    waitUntil {_foundPickupPos distance helo < 350 or (getdammage helo > 0.7 or !alive pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
    if (getdammage helo > 0.7 or !alive pilot) exitWith {
    deleteVehicle helipad1;
    deleteMarker str(markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    calltaxifrombase = false;
    helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = helotax;
    }; 
    // ****************************************************

    // spawn smokeshell
    _smokePos = [_foundPickupPos select 0, (_foundPickupPos select 1)+ random 5];
    _smoke = "SmokeShellGreen" createVehicle _smokePos;
    _chemlight = "Chemlight_green" createVehicle _smokePos;

    helo land "GET IN";

    // spawn the door opening script
    _pickupSpawnopen = [helo,_foundPickupPos] spawn {
    helo = _this select 0;
    _lzPos = _this select 1;
    waitUntil {getpos helo distance _lzPos < 10};
    helo animateDoor ['door_R', 1];
    sleep 3;
    helo animateDoor ['door_L', 1];
    }; 

    waituntil {(istouchingground helo)};
    helipos = getpos helo;
    calltaxifrombase = true;

    [markerpickup, helo, helogroup, pilot] call main;  
};////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

if (!calltaxifrombase) then {
    [] call start;
} else {
    [] call calltaxi;
};
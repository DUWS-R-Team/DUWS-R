calltaxi = {
    {
        _color = getmarkercolor _x;
        if (_color == "ColorGreen") then {
            _markerpickup = _x;
        };
    } foreach allmapmarkers;
    _helo = nearestobject [helipos, "Air"];
    _pilot = driver _helo;
    _helogroup = group _pilot;
    _helo setfuel 1;

    _foundPickupPos = [getpos player, 0,50,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    // try to find a pos, if no pos is found exit the script
    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid LZ nearby"; sleep 5; _art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;};

    // create marker on LZ
    _markerpickup = format["lz%1%2", _foundPickupPos]; // Define marker name
    _markerstr = createMarker [str(_markerpickup), _foundPickupPos];
    _markerstr setMarkerShape "ICON";
    str(_markerpickup) setMarkerType "hd_end";
    str(_markerpickup) setMarkerColor "ColorGreen";
    str(_markerpickup) setMarkerText "LZ";

    // A POS NEAR THE PLAYER HAS BEEN FOUND, CHOOPA EN ROUTE
    commandpointsblu1 = commandpointsblu1 - 1;
    publicVariable "commandpointsblu1";

    // create the helipad to land and the waypoints
    _helo setfuel 1;
    _helo engineon true;
    _helipad1 = createVehicle ["Land_HelipadEmpty_F", _foundPickupPos, [], 0, "NONE"]; 
    _wp = _helogroup addWaypoint [[_foundPickupPos select 0, (_foundPickupPos select 1)-75], 0];
    _wp setWaypointType "MOVE";
    [_helogroup, 1] setWaypointCombatMode "BLUE";

    _fobname = [1] call compile preprocessFile "random_name.sqf";
    _random1 = round random 9;
    _random2 = round random 9;
    
    _pilot sideChat format["This is %1 %2-%3, we are approaching your location for pick up, check your map for the LZ",_fobname,_random1,_random2];

    waitUntil {_foundpickuppos distance _helo < 350 or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad1;
    deleteMarker str(_markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    }; 
    // ****************************************************

    _helo land "GET IN";

    // spawn the door opening script
    _pickupSpawnopen = [_helo,_foundpickuppos] spawn {
    _helo = _this select 0;
    _lzPos = _this select 1;
    waitUntil {getpos _helo distance _lzPos < 10};
    _helo animateDoor ['door_R', 1];
    sleep 3;
    _helo animateDoor ['door_L', 1];
    };    
    
    _action = _helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", "support\taxi\mapclickhelo.sqf", [_markerpickup, _helo, _helogroup, _pilot], 0, true, true, "", "_this == player"];
    
    waituntil {taxiCanTakeOff};
    _helo removeaction _action;
    [_markerpickup, _helo, _helogroup, _pilot] call taxi;
    

};///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

taxi = {

    _markerpickup = _this select 0;
    _helo = _this select 1;
    _helogroup = _this select 2;
    _pilot = _this select 3;
    _helo setfuel 1;

    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad1;
    deleteMarker str(_markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    }; 
    // *****************************


    // everything is ok, player is in choppa
    playMusic [_music, 0];
    // _helo lock true;
    titleText ["Pilot: Roger that, we are oscar mike...", "PLAIN DOWN"];
    str(_markerpickup) setMarkerPos ClickedTaxiPos; 

    // create the helipad to land and the waypoints
    _helipad = createVehicle ["Land_HelipadEmpty_F", ClickedTaxiPos, [], 0, "NONE"];
    _wp = _helogroup addWaypoint [ClickedTaxiPos,0];
    _wp setWaypointType "MOVE";
    [_helogroup, 1] setWaypointCombatMode "BLUE";

    // spawn the door closing script
    _pickupSpawnclose = [_helo,_foundpickuppos] spawn {
    _helo = _this select 0;
    _lzPos = _this select 1;
    waitUntil {getpos _helo distance _lzPos > 10};
    _helo animateDoor ['door_R', 0];
    sleep 3;
    _helo animateDoor ['door_L', 0];
    };

    waitUntil {sleep 0.5;_helo distance _helipad1 > 350  or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is away from LZ
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad1;
    deleteVehicle _helipad;
    // _helo lock false;
    deleteMarker str(_markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    }; 
    // *****************************
    if (enableChopperFastTravel) then {
    // TELEPORT HELO NEAR LZ
    deleteVehicle _helipad1;
    titleText ["En route to LZ...", "BLACK OUT", 3];
    sleep 3.5;
    _helo setpos [getpos _helipad select 0, (getpos _helipad select 1)+1000, 150];
    sleep 3;
    titleText ["En route to LZ...", "BLACK IN", 4];
    };


    waitUntil {ClickedTaxiPos distance _helo < 200  or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad;
    // _helo lock false;
    deleteMarker str(_markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    }; 
    // *****************************
    _helo land "GET OUT";

    // spawn the door opening script
    _LzSpawnopen = [_helo] spawn {
    _helo = _this select 0;
    waitUntil {getpos _helo distance ClickedTaxiPos < 20};
    _helo animateDoor ['door_R', 1];
    sleep 3;
    _helo animateDoor ['door_L', 1];
    };



    // time to move ppl out of the helo;
    waitUntil {(getpos _helo select 2 < 4 && _helo distance _helipad<20)  or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is near the ground
    // IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad;
    // _helo lock false;
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    }; 
    // *****************************
    titleText ["Pilot: We have arrived at the LZ", "PLAIN DOWN"];
    // _helo lock false;
    {doGetOut _x; sleep 1;} forEach assignedCargo _helo; //units group player;

    sleep 40;
    deleteMarker str(_markerpickup);
    
    _pilot sideChat format["This is %1 %2-%3, we are RTB",_fobname,_random1,_random2];

    [_markerpickup, _helo, _helogroup, _pilot] call main;
    
};/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

main = {

    _markerpickup = _this select 0;
    _helo = _this select 1;
    _helogroup = _this select 2;
    _pilot = _this select 3;
    taxiCanTakeOff = false;
    
    if (helipos distance _helo < 10) exitwith {
        _action = _helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", "support\taxi\mapclickhelo.sqf", [_markerpickup, _helo, _helogroup, _pilot], 0, true, true, "", "_this == player"];
        _helo setfuel 0;
        _helo engineon false;
    
        _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = _helotax;
        
        waituntil {taxiCanTakeOff};
        _helo setfuel 1;
        _helo removeaction _action;
        [_markerpickup, _helo, _helogroup, _pilot] call taxi;
    };
        
    if (helipos distance _helo > 10) then {
        
        // spawn the door closing script
        _LzSpawnclose = [_helo] spawn {
        _helo = _this select 0;
        sleep 2;
        _helo animateDoor ['door_R', 0];
        sleep 3;
        _helo animateDoor ['door_L', 0];
        };

        // create the helipad to land and the waypoints
        _helipad1 = createVehicle ["Land_HelipadEmpty_F", helipos, [], 0, "NONE"]; 
        _wp = _helogroup addWaypoint [[helipos select 0, (helipos select 1)-75], 0];
        _wp setWaypointType "MOVE";
        [_helogroup, 1] setWaypointCombatMode "BLUE";

        _fobname = [1] call compile preprocessFile "random_name.sqf";
        _random1 = round random 9;
        _random2 = round random 9;    


        waitUntil {helipos distance _helo < 350 or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is near the lz
        // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
        if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
        deleteVehicle _helipad1;
        deleteMarker str(_markerpickup);
        hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
        // --- AJOUTER DE NOUVEAU LE SUPPORT
        sleep 15;
        _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = _helotax;
        }; 
        // ****************************************************

        // spawn smokeshell
        _smokePos = [helipos select 0, (helipos select 1)+ random 5];
        _smoke = "SmokeShellGreen" createVehicle _smokePos;
        _chemlight = "Chemlight_green" createVehicle _smokePos;

        _helo land "GET IN";

        // spawn the door opening script
        _pickupSpawnopen = [_helo,helipos] spawn {
        _helo = _this select 0;
        _lzPos = _this select 1;
        waitUntil {getpos _helo distance _lzPos < 10};
        _helo animateDoor ['door_R', 1];
        sleep 3;
        _helo animateDoor ['door_L', 1];
        }; 
        
        waituntil {(getposatl _helo select 2) <= 1};
    
        _action = _helo addaction ["<t color='#00b7ff'>Give a LZ to the pilot</t>", "support\taxi\mapclickhelo.sqf", [_markerpickup, _helo, _helogroup, _pilot], 0, true, true, "", "_this == player"];
        _helo setfuel 0;
        _helo engineon false;
    
        _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
        helotax = _helotax;
        
        waituntil {taxiCanTakeOff};
        _helo setfuel 1;
        _helo removeaction _action;
        [_markerpickup, _helo, _helogroup, _pilot] call taxi;
    };
    
};/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

start = {
    _posplayer = _this select 0;
    _radius = _this select 1;
    _foundPickupPos = [];
    taxiCanTakeOff = false;

    _music = call compile preprocessFile "support\taxi\random_music.sqf";

    if (commandpointsblu1 < 1) exitWith {
      ["info",["Not enough command points","Not enough Command Points (1 CP required)"]] call bis_fnc_showNotification;
      sleep 15;
      _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
      helotax = _helotax;
    };

    _foundPickupPos = [_posplayer, 0,_radius,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

    // try to find a pos, if no pos is found exit the script
    if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid LZ nearby"; sleep 5; _art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;};

    // create marker on LZ
    _markerpickup = format["lz%1%2", _foundPickupPos]; // Define marker name
    _markerstr = createMarker [str(_markerpickup), _foundPickupPos];
    _markerstr setMarkerShape "ICON";
    str(_markerpickup) setMarkerType "hd_end";
    str(_markerpickup) setMarkerColor "ColorGreen";
    str(_markerpickup) setMarkerText "LZ";

    // A POS NEAR THE PLAYER HAS BEEN FOUND, CHOOPA EN ROUTE
    commandpointsblu1 = commandpointsblu1 - 1;
    publicVariable "commandpointsblu1";

    // create the chopper, gunners and pilots
    _helo = createVehicle ["B_Heli_Transport_01_camo_F", [_posplayer select 0, (_posplayer select 1)+2000, 200],[], 0, "FLY"];
    _helogroup = createGroup west; 
    _pilot = _helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _copilot = _helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _gunner1 = _helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _gunner2 = _helogroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
    _helo flyInHeight 150;
     
    _pilot setcaptive true;
    _pilot allowfleeing 0;
    _pilot disableAI "Target"; 
     
    _pilot moveindriver _helo;
    _copilot moveInTurret [_helo, [0]]; 
    _gunner1 moveInTurret [_helo, [1]];
    _gunner2 moveInTurret [_helo, [2]];

    _pilot sideChat format["This is %1 %2-%3, we are approaching your location for pick up, check your map for the LZ",_fobname,_random1,_random2];

    // spawn the door closing script
    _LzSpawnclose = [_helo] spawn {
    _helo = _this select 0;
    sleep 2;
    _helo animateDoor ['door_R', 0];
    sleep 3;
    _helo animateDoor ['door_L', 0];
    };

    // create the helipad to land and the waypoints
    _helipad1 = createVehicle ["Land_HelipadEmpty_F", _foundPickupPos, [], 0, "NONE"]; 
    _wp = _helogroup addWaypoint [[_foundPickupPos select 0, (_foundPickupPos select 1)-75], 0];
    _wp setWaypointType "MOVE";
    [_helogroup, 1] setWaypointCombatMode "BLUE";

    _fobname = [1] call compile preprocessFile "random_name.sqf";
    _random1 = round random 9;
    _random2 = round random 9;    


    waitUntil {_foundPickupPos distance _helo < 350 or (getdammage _helo > 0.7 or !alive _pilot)}; // wait until the helo is near the lz
    // IF THE PILOT IS DEAD OR CHOPPA DOWN ******************
    if (getdammage _helo > 0.7 or !alive _pilot) exitWith {
    deleteVehicle _helipad1;
    deleteMarker str(_markerpickup);
    hint format["%1 %2-%2 is too damaged to continue the mission",_fobname,_random1,_random2];
    // --- AJOUTER DE NOUVEAU LE SUPPORT
    sleep 15;
    _helotax = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
    helotax = _helotax;
    }; 
    // ****************************************************

    // spawn smokeshell
    _smokePos = [_foundPickupPos select 0, (_foundPickupPos select 1)+ random 5];
    _smoke = "SmokeShellGreen" createVehicle _smokePos;
    _chemlight = "Chemlight_green" createVehicle _smokePos;

    _helo land "GET IN";

    // spawn the door opening script
    _pickupSpawnopen = [_helo,_foundPickupPos] spawn {
    _helo = _this select 0;
    _lzPos = _this select 1;
    waitUntil {getpos _helo distance _lzPos < 10};
    _helo animateDoor ['door_R', 1];
    sleep 3;
    _helo animateDoor ['door_L', 1];
    }; 

    waituntil {(getposatl _helo select 2) <= 1};
    helipos = getpos _helo;
    calltaxifrombase = true;

    [_markerpickup, _helo, _helogroup, _pilot] call main;  
};////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

if (!calltaxifrombase) then {
    _posplayer = _this select 0;
    _radius = _this select 1;
    [_posplayer, _radius] call start;
} else {
    [] call calltaxi;
};
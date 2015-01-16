_radius = _this select 0;
_diff = _this select 1;
_infinite_failsafe_loop = true;


[] spawn {  // Spawn the failsafe
sleep 90;
failsafe_zones_not_found = true;
};

[["The zones are being generated<br />Please wait..."]] spawn BIS_fnc_typeText;  

// ON WATER ? >> FLAT ? >> DISTANCE BETWEEN ZONES ? >> OK !

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

_fortified = false;
//sleep 2;
_zones_array = [[-9999,-9999,-9999]];
_distances = [];
for [{_i=1}, {_i<=zones_number}, {_i=_i+1}] do  // BEGIN "FOR" LOOP --
{
   player globalChat format["Looking for zone location #%1...",_i];
   _found = false;
   _zone_radius = 0;
   _points_zone = 0;
        while {_zone_radius<=zones_min_radius} do { // BEGIN OF WHILE    --  LOOP UNTIL THE RADIUS MEET THE REQUIREMENTS
        // CREATE RANDOM PARAMETERS FOR THE ZONE -- BEGIN
        // generate random radius (max zones_max_radius) and then determine the pts
        _random_zones_max_radius = random zones_max_radius;
        _zone_radius = round _random_zones_max_radius;   
        _points_zone = round (_zone_radius/10);
        
        // CREATE RANDOM PARAMETERS FOR THE ZONE -- END
        }; // END OF WHILE, PARAMETERS ARE O.K.

while {!_found} do
{
        if (failsafe_zones_not_found) exitWith {  // FAILSAFE. IF ZONES NOT FOUND AFTER X SECONDS, RESET.        
        while {_infinite_failsafe_loop} do {
        hintSilent "Unable to find zones, please restart the mission and try:\n\n-Reducing the maximum radius of the zones\n-Reducing the amount of created zones\n-Increasing the maxiumum distance of created zones from the HQ";
        failsafe_zones_not_found = false; 
        chosen_settings = false;
        sleep 1;
        };
        };     // END OF FAILSAFE EXECUTION, RESET OVER.
        

		_Posfound = false;
		_posDeMeilleurTruc = [];
		while {!_Posfound} do {
			_posDeMeilleurTruc = [center_of_map, 0,half_of_map,5,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
			if (_posDeMeilleurTruc select 0 != 0 && _posDeMeilleurTruc select 1 != 0) then {_Posfound=true;};
		};
		_playerDistance = _posDeMeilleurTruc distance player;
		
		
		
		
		


    if (_playerDistance>(zones_max_radius + 500) && (hq_blu1 distance _posDeMeilleurTruc)<=zones_max_dist_from_hq)  then {  // VERIFIE SI ELOIGNE DU JOUEUR ET REGARDE LA DISTANCE DES AUTRES ZONES. REGARDE AUSSI LA DISTANCE PAR RAPPORT AU QG

     _found_distance = true;
     _MissionPos = _posDeMeilleurTruc;
      _distance = [];     
       for [{_t=1}, {_t<=count _zones_array}, {_t=_t+1}] do // I HAVE NO IDEA OF WHAT I'VE DONE
           {                                               
           _zones_array_index = _t-1;
           _distance = _distance +[(_zones_array select _zones_array_index) distance (_MissionPos)]; // _distance is an array of all the distances relative to the newly found position and the other zones
//           hint format["%1",_distance];
            };
       for [{_t=1}, {_t<=count _distance}, {_t=_t+1}] do // OH GAWD
           {                                               
           _distances_array_index = _t-1;
           _check = (_distance select _distances_array_index); // check the distances contained in _distance array 1 by 1 by sending them to _check.
              if (_check < zones_spacing) then {    // If _check is under 1000
              _found_distance = false;
              };
            };
     
    

     
     if (_found_distance) then {
     _missionPos = [round(_missionPos select 0),round(_missionPos select 1)];
     _generatezonescript = [format["Zone %1",_i],_points_zone,_zone_radius,_MissionPos,_fortified,true] execvm "initZones\createzone.sqf";     
     _found=true;
     _zones_array = _zones_array + [_MissionPos]; 

     player globalChat format["Zone location #%1 found !",_i];
	 player globalChat format["Generating zone #%1",_i];
	 waituntil {scriptdone _generatezonescript};
     }; // END OF THIRD LOOP     
   };  // END SECOND LOOP
};  // END WHILE LOOP --- LOCATION FOUND
}; // END FOR LOOP -- ALL ZONES CREATED 

//hintSilent format["All zones found\nWelcome to %1\nHave fun !\nDUWS by kibot",_worldName];
player globalChat format["All zones found. Welcome to %1, %2",_worldName,profileName];


hint format["Campaign generated\nzones: %1\nmaximum radius: %2m\nminimum radius: %3m\nmax. distance from HQ: %4m\n\nIf you experience performance issues, restart the mission and try reducing the amount of zones/and or their radius",zones_number,zones_max_radius,zones_min_radius,zones_max_dist_from_hq];
[] spawn {
sleep 20;
[] execVM "misc\bottom_right_message.sqf";
};


// For some reasons I had to add a zone [0,0,0] in _zones_array, now I must remove it:
_zones_array = [_zones_array, 0] call BIS_fnc_removeIndex;

//player globalchat format["%1",_zones_array];
_warcom_init = [_zones_array, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 2000] execVM "WARCOM\WARCOM_init.sqf"; // 2700 is 40 mins
waitUntil {scriptDone _warcom_init};
savegame;
sleep 1;
[[format["Campaign generated<br />Welcome to %1, %2",_worldName,profilename]]] spawn BIS_fnc_typeText;  
playMusic ["EventTrack01a_F_EPA", 0];

if (debugmode) exitWith {};

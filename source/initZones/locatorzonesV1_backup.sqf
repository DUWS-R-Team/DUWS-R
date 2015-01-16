_radius = _this select 0;
_diff = _this select 1;
_infinite_failsafe_loop = true;


[] spawn {  // Spawn the failsafe
sleep 30;
failsafe_zones_not_found = true;
};




// ON WATER ? >> FLAT ? >> DISTANCE BETWEEN ZONES ? >> OK !

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

_fortified = false;
//sleep 2;
_zones_array = [[0,0,0]];
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
//        endLoadingScreen;
        while {_infinite_failsafe_loop} do {
        hintSilent "Unable to find zones, please restart the mission and try reducing the maximum radius of the zones or the amount of created zones.";
        failsafe_zones_not_found = false; 
        chosen_settings = false;
        sleep 1;
        };
        };     // END OF FAILSAFE EXECUTION, RESET OVER.
        
   _truc = "Land_Sack_F" createVehicle ([0,0,0]);
   
   _posX = random x_mapsize ;
   _posY = random y_mapsize ;
   _truc setPosATL [_posX, _posY, 0];
   _posDeMeilleurTruc= getPos _truc;
   
   deleteVehicle _truc;
   _posDeTrucZ = _posDeMeilleurTruc select 2;

   if (_posDeMeilleurTruc select 2 > 0) then {   // SI AU DESSUS DE L'EAU


     _playerDistance = _posDeMeilleurTruc distance player;

     
     _trucX = "Land_Sack_F" createVehicle ([(_posDeMeilleurTruc select 0)+_radius, _posDeMeilleurTruc select 1, _posDeMeilleurTruc select 2]);
     _trucY = "Land_Sack_F" createVehicle ([_posDeMeilleurTruc select 0, (_posDeMeilleurTruc select 1)+_radius, _posDeMeilleurTruc select 2]);
     _truc_X = "Land_Sack_F" createVehicle ([(_posDeMeilleurTruc select 0)-_radius, _posDeMeilleurTruc select 1, _posDeMeilleurTruc select 2]);
     _truc_Y = "Land_Sack_F" createVehicle ([_posDeMeilleurTruc select 0, (_posDeMeilleurTruc select 1)-_radius, _posDeMeilleurTruc select 2]);
     
    _posTrucX = getpos _trucX;
    _posTrucY = getpos _trucY;
    _posTruc_X = getpos _truc_X;
    _posTruc_Y = getpos _truc_Y;
    
    _diffX = (_posDeMeilleurTruc select 2)-((getpos _trucX) select 2);
    _diffY = (_posDeMeilleurTruc select 2)-((getpos _trucY) select 2);
    _diff_X = (_posDeMeilleurTruc select 2)-((getpos _truc_X) select 2);
    _diff_Y = (_posDeMeilleurTruc select 2)-((getpos _truc_Y) select 2);
    
    _diffAbsX = abs _diffX;
    _diffAbsY = abs _diffY;
    _diffAbs_X = abs _diff_X;
    _diffAbs_Y = abs _diff_Y;
    
     deleteVehicle _trucX;
     deleteVehicle _trucY;
     deleteVehicle _truc_X;
     deleteVehicle _truc_Y; 
     

 // -------  check nearest object
    _nearObj =  nearestObject _posDeMeilleurTruc;
    _distnearObj = _posDeMeilleurTruc distance _nearObj;     
 // ------  end check nearest object
     



    if (_diffAbsX<=_diff AND _diffAbsY<=_diff AND _diffAbs_X<=_diff AND _diffAbs_Y<=_diff AND _playerDistance>zones_max_radius AND _distnearObj>2)  then {  // VERIFIE SI RADIUS A NIVEAU (-) ET ELOIGNE DU JOUEUR ET REGARDE LA DISTANCE DES AUTRES ZONES  

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
     _missionPos = [round(_missionPos select 0),round(_missionPos select 1),round(_missionPos select 2)];
     _null = [format["Zone %1",_i],_points_zone,_zone_radius,_MissionPos,_fortified] execvm "initZones\createzone.sqf";     
     _found=true;
     _zones_array = _zones_array + [_MissionPos]; 

     player globalChat format["Zone location #%1 found !",_i];
     }; // END OF THIRD LOOP     
   };  // END SECOND LOOP
   }; // END FIRST LOOP
};  // END WHILE LOOP --- LOCATION FOUND
}; // END FOR LOOP -- ALL ZONES CREATED 

//hintSilent format["All zones found\nWelcome to %1\nHave fun !\nDUWS by kibot",_worldName];
player globalChat format["All zones found. Welcome to %1, %2",_worldName,profileName];

// For some reasons I had to add a zone [0,0,0] in _zones_array, now I must remove it:
_zones_array = [_zones_array, 0] call BIS_fnc_removeIndex;

//player globalchat format["%1",_zones_array];
_warcom_init = [_zones_array, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 1500] execVM "WARCOM\WARCOM_init.sqf"; // 2700 is 40 mins
waitUntil {scriptDone _warcom_init};
sleep 0.1;
savegame;

if (debugmode) exitWith {};

//// --------------- taken from locatorflat  QUI MARCHE --- FUNCTION
_foundSafePos = _this select 0;
_radius = _this select 1;
_varname = _this select 2;
_array_exist = true;
_found_dist_away = true;


if (isnil (format["%1",_varname])) then call compile format["%1" = [[-99999,-99999,-99999]; _array_exist = true;],_varname];

 // check if the array of zones already exist. If not, give him at least 1 location with impossible value and tell that the array was NOT existing
     
_kibot_distances_array = [];

       for [{_t=1}, {_t<=count _varname}, {_t=_t+1}] do // for each element of the array of positions
           {                                         
           _kibot_pos_array_missionPos_index = _t-1;  // get the index of the element
           _kibot_distances_array = _kibot_distances_array +[(_varname select _kibot_pos_array_missionPos_index) distance (_foundSafePos)]; //compare the distance of the given pos with other pos in pos array and add it into an array of all the compared distance --> an array of distances is obtained
           };

       for [{_t=1}, {_t<=count _kibot_distances_array}, {_t=_t+1}] do // for each element of the array of distances we just generated...
           {                                           
           _kibot_distances_array_index = _t-1; // get the index of the tested element
           _check = (_kibot_distances_array select _kibot_distances_array_index); // select the element we just took the index so we can check them
           hint format["%1",_kibot_distances_array];
              if (_check < _radius) then {    // check the distances contained the distances array 1 by 1. If a distance is inferior to defined value, this is a no go.
              _found_dist_away = false;   // If no zone is under 1500 meters, tell it to this variable
              };
            };

// if a distance has been found, add the position to the array of pos, because it's a valid pos.
if (_found_dist_away) then {
call compile format["%1 = %1 + [%2],_varname,_foundsafepos];
true
}
else 
{
false
} 
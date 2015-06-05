_pos = getpos player;

_plane = createVehicle ["B_Plane_CAS_01_F", _pos,[], 0, "FLY"];
_plane setpos [_pos select 0, _pos select 1, (_pos select 2) + 1000];
_planegroup = createGroup west; 

_pilot = _planegroup createUnit ["B_Pilot_F", [5,5,5], [], 0, "NONE"];
_pilot setcaptive true;
_pilot allowfleeing 0;
_pilot disableAI "Target";  
_pilot moveindriver _plane;
_plane land "LAND";

waituntil {(istouchingground _plane)};
_plane engineOn false;
_plane setFuel 0;

waitUntil {(speed _plane) <= 0};
_plane setDamage 0;
deletevehicle _pilot;
_plane setfuel 1;
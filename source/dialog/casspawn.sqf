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

waitUntil {(speed _plane) <= 0};
if (!alive _plane) then {hint "Your A-164 CAS has crashed"} else {
	_pos2 = getPos _plane;
	_marker = format["plane",_pos2]; // Define marker name
	_markerstr = createMarker [str(_marker), _pos2];
	_markerstr setMarkerShape "ICON";
	str(_marker) setMarkerType "hd_end";
	str(_marker) setMarkerColor "ColorGreen";
	str(_marker) setMarkerText "A-164 CAS Lands Here";
};

waituntil {(speed _plane) > 0};
deleteMarker str(_marker);
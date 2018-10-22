/*
    File: cluster.sqf

    Author: Kibot

    Description: 
        Deploy a cluster of munitions at the specified location.

    Parameter(s):
        _this select 0 - POSITION - Center position of 'Strike Area'
        _this select 1 - NUMBER - Number of ordinance salvos
        _this select 2 - NUMBER - Radius of 'Strike Area'
        _this select 3 - NUMBER - Interval between salvos (in seconds)
        _this select 4 - NUMBER - Number of ordinance rounds per salvo
        _this select 5 - NUMBER - Support type enumerator (1 - Artillery, 2 - Mortar Shell, 3 - JDAM)
        _this select 6 - NUMBER - Cost of Support type
        _this select 7 - STRING - Ammo type used for salvos

    Returns: 
        - Nil -
*/

params["_position", "_salvos", "_radius", "_interval", "_rps", "_supportype", "_cost", "_ammotype"];

_rpsinit = _rps;

commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

hint "Coordinates received !";

// create marker on target
_markername = format["clus%1%2",_position]; // Define marker name
_markerstr = createMarker [str(_markername), _position];
_markerstr setMarkerShape "ELLIPSE";
str(_markername) setMarkerColor "ColorGrey";
str(_markername) setMarkerSize [_radius,_radius]; 


// make HQ zone notification trigger
_trg5=createTrigger["EmptyDetector",_position];
_trg5 setTriggerArea[_radius,_radius,0,false];
_trg5 setTriggerActivation["ANY","PRESENT",true];
_trg5 setTriggerStatements["this","", ""];


// create unit for comms
_group = createGroup west;
_unit = _group createUnit [Blufor_Squadleader, [0,0,0], [], 0, "FORM"];
_unit allowDamage false;
// generate randomname
_fobname = [1] call duws_fnc_random_name;
_random1 = round random 9;
_random2 = round random 9; 

_unit sidechat format["This is %1 %2-%3, we are approaching the designated target area, ETA 2 minutes",_fobname,_random1,_random2];
sleep 60;
_unit sidechat format["This is %1 %2-%3, ETA 1 minute",_fobname,_random1,_random2];
sleep 30;
_unit sidechat format["This is %1 %2-%3, we have the target in visual, CBUs release in 30 seconds.",_fobname,_random1,_random2];
sleep 30;
_unit sidechat format["CBUs released, splash in 20 seconds."];
sleep 20;


// NUMBER OF SALVOS
while {_salvos>0} do {
_rps = _rpsinit; // reset number of remaining rounds for next salvo


while {_rps>0} do { // FIRE SALVO
_bomb= _ammotype createVehicle [(_position select 0)+(random _radius)-(random _radius), (_position select 1)+(random _radius)-(random _radius), (_position select 2)]; //spawn shells
_bomb= _ammotype createVehicle [(_position select 0)+(random _radius)-(random _radius), (_position select 1)+(random _radius)-(random _radius), (_position select 2)]; //spawn shells
_bomb= _ammotype createVehicle [(_position select 0)+(random _radius)-(random _radius), (_position select 1)+(random _radius)-(random _radius), (_position select 2)]; //spawn shells
_bomb= _ammotype createVehicle [(_position select 0)+(random _radius)-(random _radius), (_position select 1)+(random _radius)-(random _radius), (_position select 2)]; //spawn shells
sleep ((random 1)/50);
_rps = _rps-1 // REMOVE 1 ROUND TO SALVO
};

_salvos = _salvos-1; // remove 1 salvo to counter
sleep _interval;
};
sleep 3;


_vehlist = list _trg5;
{
_modif = (random 10)/10;
_vehlife = getdammage _x;
_x setdammage (_vehlife + 0.7 + _modif);
} forEach _vehlist;
sleep 3;
_unit sidechat format["This is %1 %2-%3, target hit.",_fobname,_random1,_random2];

sleep 10;
_unit sidechat format["This is %1 %2-%3, winchester, we are RTB.",_fobname,_random1,_random2];

deleteVehicle _trg5;
deletemarker str(_markername);
deleteVehicle _unit;
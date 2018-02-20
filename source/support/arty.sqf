/*
    File: arty.sqf

    Author: Kibot

    Description: 
        Deploy a number of salvos of the supplied ammo type

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

hint "Coordinates received, splash in 30 seconds";

commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

sleep 30;

// NUMBER OF SALVOS
while {_salvos>0} do {
    _rps = _rpsinit; // Reset number of rounds for next salvo
    while {_rps>0} do { 
        _bomb = _ammotype createVehicle [(_position select 0)+(random _radius)-(random _radius), (_position select 1)+(random _radius)-(random _radius), (_position select 2)];
        sleep ((random 20)/10);
        _rps = _rps - 1;
    };

    _salvos = _salvos-1; // remove 1 salvo to counter
    sleep _interval;
};

hint "Ordinance complete";
/*
    File: mapclickarty.sqf

    Author: Kibot

    Description: 
        Guards and determines the position of a strike, based on location provided by the player, for arty.sqf

    Parameter(s):
        _this select 0 - NUMBER - Number of ordinance salvos
        _this select 1 - NUMBER - Radius of 'Strike Area'
        _this select 2 - NUMBER - Interval between salvos (in seconds)
        _this select 3 - NUMBER - Number of ordinance rounds per salvo
        _this select 4 - NUMBER - Support type enumerator (1 - Artillery, 2 - Mortar Shell, 3 - JDAM)
        _this select 6 - NUMBER - Cost of Support type
        _this select 7 - STRING - Ammo type used for salvos

    Returns: 
        - Nil -
*/

params["_salvos", "_radius", "_interval", "_rps", "_supportype", "_cost", "_ammotype"];
_timer = 60;
_pos = [];
clicked = false;

// Guard against calling UAV Recon too often
if (_supportype == 1 && {support_arty_timeout > 0}) exitWith {
    ["info",["Support is on Cooldown",format ["Artillery will be ready to fire again in %1 seconds", support_arty_timeout]]] call bis_fnc_showNotification;
};
if (_supportype == 2 && {support_mortar_timeout > 0}) exitWith {
    ["info",["Support is on Cooldown",format ["Mortar team will be ready again in %1 seconds", support_mortar_timeout]]] call bis_fnc_showNotification;
};
if (_supportype == 3 && {support_jdam_timeout > 0}) exitWith {
    ["info",["Support is on Cooldown",format ["JDAM drop will be ready again in %1 seconds", support_jdam_timeout]]] call bis_fnc_showNotification;
};

// IF NOT ENOUGH PTS
if (commandpointsblu1<_cost) exitWith {
    ["info",["Support","You don't have enough command points"]] call bis_fnc_showNotification;
};

hint "Click on your map to give the coordinates or wait 60 seconds to cancel the strike";
OnMapSingleClick format["_null = [_pos,%2,%3,%4,%5,%6,%7,'%8'] execVM 'support\arty.sqf';clicked=true;onMapSingleClick ''",_pos,_salvos,_radius,_interval,_rps,_supportype,_cost,_ammotype];

// TIMER
while {_timer > 0 AND !clicked} do {
    _timer = _timer-1; // remove 1 to timer
    sleep 1;
};

// TIMER ELLAPSED OR CLICKED
OnMapSingleClick "";

// Tickdown timeout guards
switch(_supportype) do {
    case 1: {
        support_arty_timeout = 60;
        while {support_arty_timeout > 0} do {
            sleep 1;
            support_arty_timeout = support_arty_timeout - 1;
            publicVariable "support_arty_timeout";
        };
    };
    case 2: {
        support_mortar_timeout = 60;
        while {support_mortar_timeout > 0} do {
            sleep 1;
            support_mortar_timeout = support_mortar_timeout - 1;
            publicVariable "support_mortar_timeout";
        };
    };
    case 3: {
        support_jdam_timeout = 60;
        while {support_jdam_timeout > 0} do {
            sleep 1;
            support_jdam_timeout = support_jdam_timeout - 1;
            publicVariable "support_jdam_timeout";
        };
    };
};
_vehicle = false;
_mounted_veh = vehicle player;
_uav = false;
_connected_uav = getConnectedUAV player;
_distanceFromHQ = 0;

if (commandpointsblu1<2) exitWith
{
  ["info",["Not enough command points","Not enough Command Points (2CP required)"]] call bis_fnc_showNotification;
};

if(_mounted_veh == player) then { // No vehicle to refit
    if(!isNull _connected_uav) then { // UAV to refit
        _uav = true;
        _distanceFromHQ = hq_blu1 distance _connected_uav;
    };
} else { // Vehicle takes priority over UAV;
    _vehicle = true;
    _distanceFromHQ = hq_blu1 distance _mounted_veh;
};

if(!_vehicle && !_uav) exitWith {
    hint "You must be connected to or inside a vehicle to refit it";
};

if (_distanceFromHQ > 100) exitWith {
    ["veh_refit_hint",["Too far away","Your vehicle must be near the base"]] call bis_fnc_showNotification;
};

if(_vehicle) then {
    _mounted_veh setDamage 0;
    _mounted_veh setFuel 1;
    _mounted_veh setVehicleAmmoDef 1;
};

if(_uav) then { // If refitting UAV, check UAV distance from HQ.
    _connected_uav setDamage 0;
    _connected_uav setFuel 1;
    _connected_uav setVehicleAmmoDef 1;
};

commandpointsblu1 = commandpointsblu1 - 2;
publicVariable "commandpointsblu1";
["veh_refit_hint",["Vehicle ready !","Your vehicle has been rearmed, refueled and repaired"]] call bis_fnc_showNotification;

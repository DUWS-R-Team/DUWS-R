/*
    File: ammobox.sqf

    Author: Kibot

    Description:
      Air-deploys a NATO ammobox with a parachute at a assigned location.

    Parameter(s):
        _this select 0 - OBJECT - A non-nil object with a physical location.

    Usage:
        _scriptHandle = [player] execVM 'ammobox.sqf';

    Returns:
        - Nil -
*/

params ["_target"];

_location = getpos _target;

if (commandpointsblu1<2) exitWith {
  ["info",["Not enough command points","Not enough Command Points (2CP required)"]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - 2;
publicVariable "commandpointsblu1";

hint "A supply crate has been dropped near your location";

// Create the parachute
_parachute = "Steerable_Parachute_F" CreateVehicle _location;
_parachute setPos [_location select 0, _location select 1, (_location select 2)+100];
// Create the supply crate
_ammo = Blufor_SupplyCrate CreateVehicle [_location select 0,_location select 1,(_location select 2)+50];
_ammo attachTo [_parachute,[0,0,0]];

{
    _ammo addItemCargo _x;
} forEach Blufor_Ammobox_Contents;

_ammo addBackpackCargo ["B_AssaultPack_khk",10];

if (support_armory_available) then
{
    [_ammo,["<t color='#ff1111'>Armory</t>",{[] call duws_fnc_bisArsenal},[], 0, false, false, "", "_this distance _target < 4"]] remoteExecCall ["addAction", 0, true];
};

waitUntil {sleep 1; getpos _ammo select 2<0.2};
_smoke = "SmokeShellGreen" CreateVehicle (getpos _ammo);
["info",["Supply delivered","The supply crate has been marked with green smokes"]] call bis_fnc_showNotification;

params ["_object","_caller","_actionId", "_arguments"];

_groupGuard = _arguments select 0;
_groupPatrol = _arguments select 1;
_centerPos = _arguments select 2;
_hq = _arguments select 3;

if (commandpointsblu1>20) then {
    commandpointsblu1 = commandpointsblu1 - 20;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach units _groupGuard;
    {deletevehicle _x} foreach units _groupPatrol;

    (_this select 0) removeaction (_this select 2);
    0 = [_centerPos, _hq] call duws_fnc_guards;    
} else {
    hint "Not enough Command Points (20CP required)";
};
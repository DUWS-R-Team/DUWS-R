params ["_object","_caller","_actionId", "_arguments"];

_groupGuard = _arguments select 0;
_groupPatrol = _arguments select 1;
_centerPos = _arguments select 2;
_fob = _arguments select 3;

if (commandpointsblu1>15) then {
    commandpointsblu1 = commandpointsblu1 - 15;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach units _groupGuard;
    {deletevehicle _x} foreach units _groupPatrol;

    (_this select 0) removeaction (_this select 2);
    [_centerPos, _fob] call duws_fnc_guardsFOB;    
} else {
    hint "Not enough Command Points (15CP required)";
};
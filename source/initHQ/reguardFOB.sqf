_groupGuard = (_this select 3) select 0;
_groupPatrol = (_this select 3) select 1;
_centerPos = (_this select 3) select 2;
_fob = (_this select 3) select 3;

if (commandpointsblu1>15) then {
    commandpointsblu1 = commandpointsblu1 - 15;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach units _groupGuard;
    {deletevehicle _x} foreach units _groupPatrol;

    (_this select 0) removeaction (_this select 2);
    _handle = [_centerPos, _fob] execVM "initHQ\guardsFOB.sqf";    
} else {
    hint "Not enough Command Points (15CP required)";
};
_aapod = (_this select 3) select 0;
_gl1pod = (_this select 3) select 1;
_atpod1 = (_this select 3) select 2;
_atpod2 = (_this select 3) select 3;
_atpod3 = (_this select 3) select 4;
_centerPos = (_this select 3) select 5;
_fob = (_this select 3) select 6;

if (commandpointsblu1>15) then {
    commandpointsblu1 = commandpointsblu1 - 15;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach crew _aapod + [_aapod];
    {deletevehicle _x} foreach crew _gl1pod + [_gl1pod];
    {deletevehicle _x} foreach crew _atpod1 + [_atpod1];
    {deletevehicle _x} foreach crew _atpod2 + [_atpod2];
    {deletevehicle _x} foreach crew _atpod3 + [_atpod3];

    (_this select 0) removeaction (_this select 2);
    0 = [_centerPos, _fob] execvm "initHQ\fortifyFOB2.sqf";
} else {
    hint "Not enough Command Points (15CP required)";
};
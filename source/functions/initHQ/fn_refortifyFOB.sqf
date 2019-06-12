params ["_target", "_caller", "_actionId", "_arguments"];

_aaPod = _arguments select 0;
_gl1Pod = _arguments select 1;
_atPod1 = _arguments select 2;
_atPod2 = _arguments select 3;
_atPod3 = _arguments select 4;
_centerPos = _arguments select 5;
_fob = _arguments select 6;

if (commandpointsblu1>15) then {
    commandpointsblu1 = commandpointsblu1 - 15;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach crew _aaPod + [_aaPod];
    {deletevehicle _x} foreach crew _gl1Pod + [_gl1Pod];
    {deletevehicle _x} foreach crew _atPod1 + [_atPod1];
    {deletevehicle _x} foreach crew _atPod2 + [_atPod2];
    {deletevehicle _x} foreach crew _atPod3 + [_atPod3];

    (_this select 0) removeaction (_this select 2);
    0 = [_centerPos, _fob] spawn duws_fnc_fortifyFOB2;
} else {
    hint "Not enough Command Points (15CP required)";
};
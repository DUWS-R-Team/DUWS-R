#include "macro.sqf"
/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for 'Load On Respawn', if no selection was found it will remove the 
	current respawn handler if it exists.
*/
VAS_slot = lbCurSel VAS_load_list;
if(VAS_slot == -1) exitWith {hint localize "STR_VAS_Prompt_onRespawnFail"; if(!isNil "VAS_Respawn_Handler") then {player removeEventHandler["Respawn",VAS_Respawn_Handler]; VAS_Respawn_Handler = nil;}};

if(isNil "VAS_Respawn_Handler") then
{
	VAS_Respawn_Handler = player addEventHandler ["Respawn", {[VAS_slot] spawn VAS_fnc_loadGear;}];
};
#include "macro.sqf"
/*
	File: fn_transferSaveGear.sqf
	
	Description:
	Laziness at it's best..
*/
private["_slot","_title"];
if(isNil "VAS_Loadout_Gear") exitWith {};
disableSerialization;
_title = ctrlText VAS_transfer_save_text;
_slot = lbCurSel VAS_transfer_save_list;

if(_slot == -1) exitWith {hint localize"STR_VAS_Prompt_slotSelFail"};

VAS_Loadout_Gear set[0,_title];
if(vas_disableLoadSave) then
{
	missionNamespace setVariable[format["vas_gear_new_%1",_slot],VAS_Loadout_Gear];
}
	else
{
	profileNameSpace setVariable[format["vas_gear_new_%1",_slot],VAS_Loadout_Gear];
	saveProfileNamespace;
};

closeDialog 0;

VAS_Loadout_Gear = nil;
#include "macro.sqf"
/*
	File: fn_transferMenu.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Opens the transfer menu to transfer a saved loadout to
	another player in the server.
*/
private["_control","_slot","_loadout","_teammates"];
disableSerialization;
_control = VAS_getControl(VAS_load_Display,VAS_load_fetch);
_slot = lbCurSel VAS_load_list;
if(_slot == -1) exitWith {hint localize "STR_VAS_Transfer_NoSlotSelection";};
if(vas_disableLoadSave) then
{
    VAS_Transfer_Loadout = missionNamespace getVariable format["vas_gear_new_%1",_slot];
}
    else
{
    VAS_Transfer_Loadout = profileNamespace getVariable format["vas_gear_new_%1",_slot];
};

if(isNil "VAS_Transfer_Loadout") exitWith {hint localize "STR_VAS_Transfer_NoSlotSelection";};
if(!createDialog "VAS_TransferMenu") exitWith {hint "Couldn't open the transfer menu?"};
(VAS_getControl(VAS_transfer_MainMenu,VAS_transfer_SaveMainMenu)) ctrlShow false;

_control = VAS_getControl(VAS_transfer_MainMenu,VAS_transfer_UnitsList);
//Fill the units units list.
{
	if(side _x == playerSide) then
	{
		_control lbAdd format["%1", name _x];
		_control lbSetData[(lbSize _control)-1,str _x];
		_control lbSetPicture [(lbSize _control)-1,([_x,"texture"] call BIS_fnc_rankParams)];
	};
} foreach playableUnits;
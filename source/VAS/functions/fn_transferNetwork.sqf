#include "macro.sqf"
/*
	File: fn_transferNetwork.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives information sent for a transfer request and prompts the user.
	
	STR_VAS_Transfer_Request
*/
private["_from"];
_from = [_this,0,"",[""]] call BIS_fnc_param;
_loadout = [_this,1,[],[[]]] call BIS_fnc_param;
if(_from == "") exitWith {};
if(count _loadout == 0) exitWith {};

if(!createDialog "VAS_prompt") exitWith {hint format["%1 tried to send you a saved loadout but we couldn't open the menu.",_from];};
disableSerialization;
waitUntil {!isNull (findDisplay VAS_prompt_Display)};
(VAS_getControl(VAS_prompt_Display,VAS_prompt_text)) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 %2</t></t><br/><t align='center'><t size='0.6px'>%3</t></t>",_from,localize "STR_VAS_Transfer_Request",localize "STR_VAS_Transfer_Request2"];
(VAS_getControl(VAS_prompt_Display,VAS_prompt_true)) ctrlSetText localize "STR_VAS_Prompt_deleteYes";
(VAS_getControl(VAS_prompt_Display,VAS_prompt_false)) ctrlSetText localize "STR_VAS_Prompt_deleteNo";

waitUntil {!isNil "vas_prompt_choice"};
if(vas_prompt_choice) then
{
	[_loadout] spawn VAS_fnc_transferSaveMenu;
};

vas_prompt_choice = nil;
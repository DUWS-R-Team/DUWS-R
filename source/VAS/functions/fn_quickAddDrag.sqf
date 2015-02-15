/*
	File: fn_quickAddDrag.sqf
	Version Edit: 2.5
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the new drag and drop system to add items to a specific container.
*/
private["_ctrl","_arr","_display"];
disableSerialization;
_ctrl = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_arr = [_this,4,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2500;
if(isNull _ctrl OR count _arr == 0) exitWith {}; //Bad data was sent so exit.

_arr = _arr select 0;
switch(_ctrl) do
{
	case (_display displayCtrl 2960):
	{
		player addItemToUniform (_arr select 2);
	};
	
	case (_display displayCtrl 2961):
	{
		player addItemToVest (_arr select 2);
	};
	
	case (_display displayCtrl 2962): 
	{
		player addItemToBackpack (_arr select 2);
	};
};

//Update UI.
[] call VAS_fnc_updateLoad;
[] spawn VAS_fnc_playerDisplay;
true;
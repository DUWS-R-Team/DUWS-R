#include "macro.sqf"
/*
	File: fn_transferSaveMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah allows the person to save the loadout sent to them from someone else.
	Pretty redundant design but I just got lazy at this point.
*/
private["_control","_loadout_array"];
VAS_Loadout_Gear = [_this,0,[],[[]]] call BIS_fnc_param;
if(!createDialog "VAS_TransferMenu") exitWith {hint "Couldn't open the transfer menu?"};
disableSerialization;
(VAS_getControl(VAS_transfer_MainMenu,VAS_transfer_unitsMenu)) ctrlShow false;

_control = VAS_getControl(VAS_transfer_MainMenu,VAS_transfer_save_list);
if(vas_disableLoadSave) then
{
	for "_i" from 0 to vas_customslots do
	{
		if(!isNil {missionNamespace getVariable format["vas_gear_new_%1",_i]}) then
		{
			_control lbAdd format["%1",(missionNamespace getVariable format["vas_gear_new_%1",_i]) select 0];
		}
			else
		{
			_control lbAdd format["%1 %2",localize "STR_VAS_Main_CL", _i+1];
		};
	};
}
	else
{
	for "_i" from 0 to vas_customslots do
	{
		if(!isNil {profileNamespace getVariable format["vas_gear_new_%1",_i]}) then
		{
			_control lbAdd format["%1",(profileNamespace getVariable format["vas_gear_new_%1",_i]) select 0];
		}
			else
		{
			_control lbAdd format["%1 %2",localize "STR_VAS_Main_CL", _i+1];
		};
	};
};

(VAS_getControl(VAS_transfer_MainMenu,VAS_transfer_save_text)) ctrlSetText (VAS_Loadout_Gear select 0);
_control = VAS_getControl(VAS_transfer_MainMenu,VAS_save_fetch);
_loadout_array = [];
{
    switch(typeName _x) do {
        case "STRING": {
            _loadout_array = _loadout_array + [_x];
        };
        case "ARRAY": {
            {
                _loadout_array = _loadout_array + [_x];
            } forEach _x;
        };
    };
} forEach VAS_Loadout_Gear;

_listItems = [];
{
    _className = _x;
    _details = [_x] call VAS_fnc_fetchCfgDetails;
    if(count _details > 0) then {
        _name = (_details select 1);
        if (_listItems find _name < 1) then {
            _control lbAdd format["[%1] %2",({_x == _className} count _loadout_array),_name];
            _control lbSetPicture [(lbSize _control)-1,(_details select 2)];
            _listItems = _listItems + [_name];
        };
    };
} forEach _loadout_array;
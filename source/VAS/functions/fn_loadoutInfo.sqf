#include "macro.sqf"
/*
    @version: 2.0
    @file_name: fn_loadoutInfo.sqf
    @file_author: TAW_Tonic
    @file_edit: 9/24/2013
    @file_description: Pulls up the selected saved slots loadout.
*/
private["_control","_slot","_type","_loadout"];
_type = _this select 0;
disableSerialization;

switch (_type) do
{
    case 0: {_control = VAS_getControl(VAS_save_Display,VAS_save_fetch); _slot = lbCurSel VAS_save_list;};
    case 1: {_control = VAS_getControl(VAS_load_Display,VAS_load_fetch); _slot = lbCurSel VAS_load_list};
};

lbClear _control;

if(_slot == -1) exitWith {hint localize "STR_VAS_Prompt_slotNoInfo";}; //No slot selected
if(vas_disableLoadSave) then
{
    _loadout = missionNamespace getVariable format["vas_gear_new_%1",_slot];
}
    else
{
    _loadout = profileNamespace getVariable format["vas_gear_new_%1",_slot];
};

if(isNil {_loadout}) exitWith {(VAS_getControl(VAS_save_Display,VAS_save_text)) ctrlSetText localize "STR_VAS_Save_CLN";}; //No information in this slot.
if(_type == 0) then
{
    (VAS_getControl(VAS_save_Display,VAS_save_text)) ctrlSetText (_loadout select 0);
};

// Original Code
/*
{
    switch(typeName _x) do
    {
        case "STRING":
        {
            _details = [_x] call VAS_fnc_fetchCfgDetails;
            if(count _details > 0) then
            {
                _control lbAdd format["%1", (_details select 1)];
                _control lbSetPicture [(lbSize _control)-1,(_details select 2)];
            };
        };
        
        case "ARRAY":
        {
            {
                _details = [_x] call VAS_fnc_fetchCfgDetails;
                if(count _details > 0) then
                {
                    _control lbAdd format["%1", (_details select 1)];
                    _control lbSetPicture [(lbSize _control)-1,(_details select 2)];
                };
            } foreach _x;
        };
    };
} foreach _loadout;
*/

// Modified Code by naong
private ["_listItems","_loadout_array","_className","_name"];
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
} forEach _loadout;

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
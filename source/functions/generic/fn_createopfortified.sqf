params ["_position"];

// hint format["%1",_position];

_group = [
    _position,
    EAST, [
        Opfor_Squadleader,
        Opfor_AA_Specialist,
        Opfor_AT_Specialist,
        Opfor_Grenadier,
        Opfor_Teamleader,
        Opfor_Autorifleman,
        Opfor_Rifleman_AT,
        Opfor_Grenadier],
    [],
    [],
    opfor_ai_skill] call BIS_fnc_spawnGroup;
[_group, _position] call bis_fnc_taskDefend;

// ADD QRF eventhandler
_EH = leader _group addEventHandler ["Fired", {[_this select 0] spawn duws_fnc_WARCOM_opf_qrf}];
params ["_hq"];

_hq addaction ["<t color='#ff00ff'>Player stats</t>",duws_fnc_info, "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#15ff00'>Request units</t>",{_this call duws_fnc_request}, "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#ffb700'>Squad manager</t>",duws_fnc_squadmng, "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#ffb700'>FOB manager</t>",duws_fnc_fobmanageropen, "", 0, true, true, "", "_this == player"];
if (isServer) then {
    _hq addaction ["<t color='#00b7ff'>Rest (wait/save)</t>", duws_fnc_savegame, "", 0, true, true, "", "_this == player"];
};

if (!isServer) then {
    _hq addaction ["<t color='#00b7ff'>Rest</t>",duws_fnc_savegameClient, "", 0, true, true, "", "_this == player"];
};

_hq addaction ["<t color='#00FFFF'>RESET SQUAD LEADER</t>",{[] call duws_fnc_groupReset}, "", 0, true, true, "", "_this == player"];

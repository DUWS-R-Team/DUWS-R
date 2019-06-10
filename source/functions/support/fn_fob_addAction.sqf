_this addaction ["<t color='#ff00ff'>Player stats</t>",duws_fnc_info, "", 0, true, true, "", "_this == player"];
_this addaction ["<t color='#15ff00'>Request ammobox drop(2CP)</t>",duws_fnc_fob_ammobox, "", 0, true, true, "", "_this == player"];
_this addaction ["<t color='#ffb700'>Squad manager</t>",duws_fnc_squadmng, "", 0, true, true, "", "_this == player"];
_this addaction ["<t color='#ffb700'>FOB manager</t>",duws_fnc_fobmanageropen, "", 0, true, true, "", "_this == player"];
if (support_armory_available) then {
    _this addaction ["<t color='#ff0066'>Armory (VA)</t>",{[] call duws_fnc_bisArsenal}, "", 0, true, true, "", "_this == player"];
};
if (isServer) then {
    _this addaction ["<t color='#00b7ff'>Rest (wait/save)</t>",duws_fnc_savegame, "", 0, true, true, "", "_this == player"];
} else {
    _this addaction ["<t color='#00b7ff'>Rest</t>",duws_fnc_savegameClient, "", 0, true, true, "", "_this == player"];
};

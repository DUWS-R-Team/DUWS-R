_hq = _this select 0;

_hq addaction ["<t color='#ff00ff'>Player stats</t>","dialog\info\info.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#15ff00'>Request units</t>","dialog\request.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#ffb700'>Squad manager</t>","dialog\squad\squadmng.sqf", "", 0, true, true, "", "_this == player"];
_hq addaction ["<t color='#ffb700'>FOB manager</t>","dialog\fob\FOBmanageropen.sqf", "", 0, true, true, "", "_this == player"];
if (isServer) then {
_hq addaction ["<t color='#00b7ff'>Rest (wait/save)</t>","savegame.sqf", "", 0, true, true, "", "_this == player"];

};
if (!isServer) then {
_hq addaction ["<t color='#00b7ff'>Rest</t>","savegameClient.sqf", "", 0, true, true, "", "_this == player"];
};
/*
    Author: UltraNoobian (Brenden Cai)

    Description:
    Dynamically generate and update the Support menus, then display the root menu.

    Parameter(s):
    None.

    Usage:
    [] call "dynamic_menu.sqf";

    Returns:
    - Nil -
*/

/*
DUWS note: This is available as a function! [params] call duws_fnc_dynamic_menu
*/
menuItemFormatter = {
    format [
        "[""%1"", [%2], """", -5, [[""expression"", ""%3""]], ""1"", ""%4""]",
        _this select 0,
        _this select 1,
        _this select 2,
        _this select 3
    ];
};

_itemsCount = 0;
_offensiveItems = [];
_logisticsItems = [];
_transportItems = [];

// Critical note: If you use escape quotes as part of your params to menuItemFormatter,
// You must double-escape those quotes
// eg. "Hello ""mate""" -> "Hello """"mate"""""
// eg. 'Hello "mate"' -> "Hello ""mate""'


//Offensive Submenu checks
if(support_mortar_available) then {
    _text = ["Mortar (2 CP)", 2, '_null = [8, 50, 5, 3, 2, 2, ""grenade""] spawn duws_fnc_mapclickarty', 1] call menuItemFormatter;
    _offensiveItems pushBack _text;
} else {
    _text = ["Mortar (N/A)", 2, "", 0] call menuItemFormatter;
    _offensiveItems pushBack _text;
};

if(support_arty_available) then {
    _text = ["Artillery Strike (4 CP)", 3, '_null = [6, 100, 8, 3, 1, 4, ""R_80mm_HE""] spawn duws_fnc_mapclickarty', 1] call menuItemFormatter;
    _offensiveItems pushBack _text;
} else {
    _text = ["Artillery Strike (N/A)", 3, "", 0] call menuItemFormatter;
    _offensiveItems pushBack _text;
};

if(support_cluster_available) then {
    _text = ["Cluster Bomb (6 CP)", 4, '_null = [1, 250, 1, 90, 1, 6, ""grenade""] spawn duws_fnc_cluster', 1] call menuItemFormatter;
    _offensiveItems pushBack _text;
} else {
    _text = ["Cluster Bomb (N/A)", 4, "", 0] call menuItemFormatter;
    _offensiveItems pushBack _text;
};

if(support_jdam_available) then {
    _text = ["JDAM Strike (1 CP)", 5, '_null = [1, 2, 1, 1, 3, 1, ""Bo_Mk82""] spawn duws_fnc_mapclickarty', 1] call menuItemFormatter;
    _offensiveItems pushBack _text;
} else {
    _text = ["JDAM (N/A)", 5, "", 0] call menuItemFormatter;
    _offensiveItems pushBack _text;
};

// Compilaton and Call for Offensive SubMenu
_finalString = "offensive_SubMenu = [[""Offensive Supports"",true],";
_offensiveItemsClassString = _offensiveItems joinString ",";
_finalString = _finalString + _offensiveItemsClassString;
_finalString = _finalString + "];";

_myCode = compile _finalString;
call _myCode;


//Logistics Submenu Checks
if(support_supplydrop_available) then {
    _text = ["Supply Drop (2 CP)", 2, '_null = [player] spawn duws_fnc_ammobox', 1] call menuItemFormatter;
    _logisticsItems pushBack _text;
} else {
    _text = ["Supply Drop ((N/A)", 2, '', 0] call menuItemFormatter;
    _logisticsItems pushBack _text;
};

if(support_paradrop_available) then {
    _text = ["Airborne troops (25 CP)", 3, '_null = [player] spawn duws_fnc_paradrop', 1] call menuItemFormatter;
    _logisticsItems pushBack _text;
} else {
    _text = ["Airborne troops (N/A)", 3, '', 0] call menuItemFormatter;
    _logisticsItems pushBack _text;
};

if(support_uav_recon_available) then {
    _text = ["UAV Recon (3 CP)", 4, '_null = [player] spawn duws_fnc_mapclickuav', 1] call menuItemFormatter;
    _logisticsItems pushBack _text;
} else {
    _text = ["UAV Recon (N/A)", 4, '', 0] call menuItemFormatter;
    _logisticsItems pushBack _text;
};

if(support_veh_refit_available) then {
    _text = ["Vehicle Refit (2 CP)", 5, '_null = [player] call duws_fnc_veh_refit', 1] call menuItemFormatter;
    _logisticsItems pushBack _text;
} else {
    _text = ["Vehicle Refit (N/A)", 5, '', 0] call menuItemFormatter;
    _logisticsItems pushBack _text;
};


// Compilaton and Call for Logistics SubMenu
_finalString = "logistic_SubMenu = [[""Logistical Supports"",true],";
_logisticsItemsClassString = _logisticsItems joinString ",";
_finalString = _finalString + _logisticsItemsClassString;
_finalString = _finalString + "];";

_myCode = compile _finalString;
call _myCode;

//Transport Submenu check
if(support_helotaxi_available) then {
    _text = ["Helicopter taxi(1 CP)", 2, '_nill = [getpos player,50] spawn duws_fnc_heloTaxi', 1] call menuItemFormatter;
    _transportItems pushBack _text;
} else {
    _text = ["Helicopter taxi(N/A)", 2, '', 0] call menuItemFormatter;
    _transportItems pushBack _text;
};

if(support_boattaxi_available) then {
    _text = ["Boat taxi (1 CP)", 3, '_null = [getpos player,10] spawn duws_fnc_boatTaxi', 1] call menuItemFormatter;
    _transportItems pushBack _text;
} else {
    _text = ["Boat taxi (N/A)", 3, '', 0] call menuItemFormatter;
    _transportItems pushBack _text;
};


// Compilaton and Call for Transport SubMenu
_finalString = "transport_SubMenu = [[""Transport Supports"",true],";
_transportItemsClassString = _transportItems joinString ",";
_finalString = _finalString + _transportItemsClassString;
_finalString = _finalString + "];";

_myCode = compile _finalString;
call _myCode;


//Construct and show Support Menu root
supportMenu =
[
	["Support Menu",false],
	["Offensive", [2], "#USER:offensive_SubMenu", -5, [["expression", ""]], "1", "1"],
    ["Logistics", [3], "#USER:logistic_SubMenu", -5, [["expression", ""]], "1", "1"],
    ["Transport", [4], "#USER:transport_SubMenu", -5, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:supportMenu";

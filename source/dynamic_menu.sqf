 /**
* Dynamically (re)create the support menus
*
* Generates and updates the Support menus so that they can be displayed by
*
* Params: None.
*
* Return: None.
*/

// MY_SUBMENU_inCommunication =
// [
// 	["User submenu",true],
// 	["Option-1", [2], "", -5, [["expression", "player sidechat ""-1"" "]], "0", "0", "\ca\ui\data\cursor_support_ca"],
// 	["Option 0", [3], "", -5, [["expression", "player sidechat "" 0"" "]], "1", "0", "\ca\ui\data\cursor_support_ca"],
// 	["Option 1", [4], "", -5, [["expression", "player sidechat "" 1"" "]], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
// ];

_itemsCount = 0;
_offensiveItems = [];
_logisticsItems = [];
_transportItems = [];

_Ucode = "dyn_menu = [[""User menu"",false],";


if(support_mortar_available) then {
    _text = "[""Mortar"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""1""]]";
    _offensiveItems pushBack _text;
} else {
    // code is same as above, BUT 'isActive' is false.
    _text = "[""Mortar"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""0""]]";
    _offensiveItems pushBack _text;
};

if(support_arty_available) then {
    _text = "[""Artillery"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""1""]]";
    _offensiveItems pushBack _text;
} else {
    _text = "[""Artillery"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""0""]]";
    _offensiveItems pushBack _text;
};

if(support_cluster_available) then {
    _text = "[""Cluster Bomb"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""1""]]";
    _offensiveItems pushBack _text;
} else {
    _text = "[""Cluster Bomb"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""0""]]";
    _offensiveItems pushBack _text;
};

if(support_jdam_available) then {
    _text = "[""JDAM"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""1""]]";
    _offensiveItems pushBack _text;
} else {
    _text = "[""JDAM"", [0], """", -5, [[""expression"", ""player sidechat """"First"""" ""]], ""1"", ""0""]]";
    _offensiveItems pushBack _text;
};

_finalString = "offensive_SubMenu = [[""Offensive Supports"",true],";
_finalString += _offensiveItems joinString ",";

diag_log format ["DUWS-R: Compiling this string (%1)",_finalString];
_myCode = call compile _finalString;

// if(support_supplydrop_available) then {
// }
// support_paradrop_available = false;
// support_pFLIR_available = false;
// support_uav_recon_available = false;
// support_veh_refit_available = false;

// support_helotaxi_available = false;
// support_boattaxi_available = false;

if(count _itemsCount > 0) then {
    //_Ucode =
    //call compile _Ucode;
    //showCommandingMenu "#USER:MY_MENU_inCommunication";
} else {
    player commandChat "No support items available at this time!";
}
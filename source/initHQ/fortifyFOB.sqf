_centerPos = (_this select 3) select 0;
_actionID = _this select 2;
_object = _this select 0;
_fob = (_this select 3) select 1;
aliveAllUnits = {alive _x} count allunits;

if (commandpointsblu1 < 4) exitWith {hint "You don't have enough Command Points"};
commandpointsblu1 = commandpointsblu1 - 4;
publicvariable "commandpointsblu1";


if ((Warcom_Limiter_Param == 1) && (aliveAllUnits>99)) exitWith {hint "*DUWS AI Limiter is ENABLED!*\n\nTry Fortifying again when there are less than 100 AI units on the map"};

_object removeAction _actionID;
playSound "loadgun";

_groupGuard = createGroup WEST;

// AA on the roof
_aaPod = createVehicle ["B_static_AA_F", [0,0,0], [], 0, "NONE"];
_aaPod allowdamage false;
_aaPod setdamage 0;
_aaPod setpos [_centerPos select 0, _centerPos select 1,(_centerPos select 2)+3.109];

_fobGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_fobGuard1 moveinGunner _aaPod;

// GMG
_gl1Pod = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_gl1Pod allowdamage false;
_gl1Pod setdamage 0;
_gl1Pod setpos [(_centerPos select 0)-7, (_centerPos select 1)+5.5];

_fobGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_fobGuard1 moveinGunner _gl1Pod;

// AT
_atPod1 = createVehicle ["B_static_AT_F", [0,0,0], [], 0, "NONE"];
_atPod1 setpos [(_centerPos select 0)-7, (_centerPos select 1)-8];
_atPod1 allowdamage false;
_atPod1 setdamage 0;
_atPod1 setdir 215;

_fobGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_fobGuard1 moveinGunner _atPod1;

// HMG
_atPod2 = createVehicle ["B_HMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atPod2 allowdamage false;
_atPod2 setdamage 0;
_atPod2 setpos [(_centerPos select 0)+8, (_centerPos select 1)-7];

_fobGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_fobGuard1 moveinGunner _atPod2;

// GMG
_atPod3 = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atPod3 allowdamage false;
_atPod3 setdamage 0;
_atPod3 setpos [(_centerPos select 0)+7, (_centerPos select 1)+8];

_fobGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_fobGuard1 moveinGunner _atPod3;

// LIGHTS
_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos [_centerPos select 0, _centerPos select 1];

_light2 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light2 allowdamage false;
_light2 setdamage 0;
_light2 setpos [(_centerPos select 0)+5.5, (_centerPos select 1)-5.5];

_light3 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light3 allowdamage false;
_light3 setdamage 0;
_light3 setpos [(_centerPos select 0)-5.5, (_centerPos select 1)+3.5];

_light4 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light4 allowdamage false;
_light4 setdamage 0;
_light4 setpos [(_centerPos select 0)+5.5, (_centerPos select 1)+3.5];

_light5 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light5 allowdamage false;
_light5 setdamage 0;
_light5 setpos [(_centerPos select 0)-5.5, (_centerPos select 1)-5.5];

sleep 2;
_atPod1 allowdamage true;
_atPod2 allowdamage true;
_atPod3 allowdamage true;
_gl1Pod allowdamage true;
_aaPod allowdamage true;
_light1 allowdamage true;
_light2 allowdamage true;
_light3 allowdamage true;
_light4 allowdamage true;
_light5 allowdamage true;

_fob addAction ["<t color='#ff0066'>Replace FOB Defences (15CP)</t>", "initHQ\refortifyFOB.sqf", [_aaPod, _gl1Pod, _atPod1, _atPod2, _atPod3, _centerPos, _fob], 0, true, true, "", "_this == player"];
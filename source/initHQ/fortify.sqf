_centerPos = _this select 0;
_hq = _this select 1;

_groupGuard = createGroup WEST;

// AA on the roof
_aaPod = createVehicle ["B_static_AA_F", [0,0,0], [], 0, "NONE"];
_aaPod allowdamage false;
_aaPod setdamage 0;
_aaPod setpos [_centerPos select 0, _centerPos select 1,(_centerPos select 2)+3.109];

_hqGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_hqGuard1 moveinGunner _aaPod;

// GMG
_gl1Pod = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_gl1Pod allowdamage false;
_gl1Pod setdamage 0;
_gl1Pod setpos [(_centerPos select 0)-7, (_centerPos select 1)+5.5];

_hqGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_hqGuard1 moveinGunner _gl1Pod;

// AT
_atPod1 = createVehicle ["B_static_AT_F", [0,0,0], [], 0, "NONE"];
_atPod1 setpos [(_centerPos select 0)-7, (_centerPos select 1)-8];
_atPod1 allowdamage false;
_atPod1 setdamage 0;
_atPod1 setdir 215;

_hqGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_hqGuard1 moveinGunner _atPod1;

// HMG
_atPod2 = createVehicle ["B_HMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atPod2 allowdamage false;
_atPod2 setdamage 0;
_atPod2 setpos [(_centerPos select 0)+8, (_centerPos select 1)-7];

_hqGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_hqGuard1 moveinGunner _atPod2;

// GMG
_atPod3 = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atPod3 allowdamage false;
_atPod3 setdamage 0;
_atPod3 setpos [(_centerPos select 0)+7, (_centerPos select 1)+8];

_hqGuard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_hqGuard1 moveinGunner _atPod3;

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

_light6 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light6 allowdamage false;
_light6 setdamage 0;
_light6 setpos [(_centerPos select 0)+2.75, (_centerPos select 1)-2.75];

_light7 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light7 allowdamage false;
_light7 setdamage 0;
_light7 setpos [(_centerPos select 0)-2.75, (_centerPos select 1)+1.75];

_light8 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light8 allowdamage false;
_light8 setdamage 0;
_light8 setpos [(_centerPos select 0)+2.75, (_centerPos select 1)+1.75];

_light9 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light9 allowdamage false;
_light9 setdamage 0;
_light9 setpos [(_centerPos select 0)-2.75, (_centerPos select 1)-2.75];

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
_light6 allowdamage true;
_light7 allowdamage true;
_light8 allowdamage true;
_light9 allowdamage true;


_hq addAction ["<t color='#ff0066'>Replace Defences (20CP)</t>", "initHQ\refortify.sqf", [_aaPod, _gl1Pod, _atPod1, _atPod2, _atPod3, _centerPos, _hq], 0, true, true, "", "_this == player"];
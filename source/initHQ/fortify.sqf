_centerPos = _this select 0;

_groupGuard = createGroup WEST;

// AA on the roof
_aapod = createVehicle ["B_static_AA_F", [0,0,0], [], 0, "NONE"];
_aapod allowdamage false;
_aapod setdamage 0;
_aapod setpos [_centerpos select 0, _centerpos select 1,(_centerpos select 2)+3.109];

_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _aapod;

// GMG
_gl1pod = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_gl1pod allowdamage false;
_gl1pod setdamage 0;
_gl1pod setpos [(_centerpos select 0)-7, (_centerpos select 1)+5.5];

_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _gl1pod;

// AT
_atpod1 = createVehicle ["B_static_AT_F", [0,0,0], [], 0, "NONE"];
_atpod1 setpos [(_centerpos select 0)-7, (_centerpos select 1)-8];
_atpod1 allowdamage false;
_atpod1 setdamage 0;
_atpod1 setdir 215;

_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _atpod1;

// HMG
_atpod2 = createVehicle ["B_HMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atpod2 allowdamage false;
_atpod2 setdamage 0;
_atpod2 setpos [(_centerpos select 0)+8, (_centerpos select 1)-7];

_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _atpod2;

// GMG
_atpod3 = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_atpod3 allowdamage false;
_atpod3 setdamage 0;
_atpod3 setpos [(_centerpos select 0)+7, (_centerpos select 1)+8];

_HQguard1 = _groupGuard createUnit ["B_Soldier_F", _centerPos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _atpod3;

sleep 2;
_atpod1 allowdamage true;
_atpod2 allowdamage true;
_atpod3 allowdamage true;
_gl1pod allowdamage true;
_aapod allowdamage true;

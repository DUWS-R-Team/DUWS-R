_index = lbCurSel 2102;


_spawnPos = getpos player;
_spawnPos = [(_spawnPos select 0)+30, _spawnPos select 1];

addEWS_EH = {
    (_this select 0) addEventHandler ["IncomingMissile", {
        _target = _this select 0;
        _attacker = _this select 3;

        if(player in crew (_target)) then {
            _target say3D ["alarmCar", 2, 1];
            _azi = (_target) getDir (_attacker);

            titleText [format["Incoming Missile: Bearing %1", str floor _azi], "PLAIN", 0.4];
        };
    }];
};

vehic = nil;

switch (_index) do {
    case 0: { // Small Truck 1
        if (commandpointsblu1 >= 4) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 4;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "I_G_Offroad_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 1: { // Small Truck 2
        if (commandpointsblu1 >= 6) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 6;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "I_G_Van_01_transport_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 2: { // Prowler Unarmed
        if (commandpointsblu1 >= 5) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 5;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_LSV_01_unarmed_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 3: { // Prowler Armed
        if (commandpointsblu1 >= 13) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 13;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_LSV_01_armed_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 4: { // Hunter Unarmed
        if (commandpointsblu1 >= 5) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 5;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MRAP_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 5: { // Hunter HMG
        if (commandpointsblu1 >= 18) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 18;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MRAP_01_hmg_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 6: { // Hunter GMG
        if (commandpointsblu1 >= 25) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 25;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MRAP_01_gmg_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 7: { // Marshall
        if (commandpointsblu1 >= 35) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 35;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_APC_Wheeled_01_cannon_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 8: { //HEMETT Transport Covered
        if (commandpointsblu1 >= 8) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 8;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Truck_01_covered_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 9: { // Pawnee
        if (commandpointsblu1 >= 25) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 25;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Heli_Light_01_armed_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 10: { // Blackfoot
        if (commandpointsblu1 >= 45) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 45;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Heli_Attack_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 11: { // HummingBird
        if (commandpointsblu1 >= 15) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 15;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Heli_Light_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 12: { // M-900 Civ.
        if (commandpointsblu1 >= 12) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 12;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "C_Heli_Light_01_civil_F" createVehicle _spawnPos;
            vehic setVariable ["color",13];
        } else {
            hint "Not enough command points";
        };
    };
    case 13: { // Taru Empty
        if (commandpointsblu1 >= 18) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 18;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "O_Heli_Transport_04_F" createVehicle _spawnPos;
            null = [vehic] execVM "\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_basic_black.sqf";
        } else {
            hint "Not enough command points";
        };
    };
    case 14: { // GhostHawk
        if (commandpointsblu1 >= 22) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 22;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Heli_Transport_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 15: { // Huron
        if (commandpointsblu1 >= 26) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 26;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Heli_Transport_03_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 16: { // Panther IFV
        if (commandpointsblu1 >= 25) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 25;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_APC_Tracked_01_rcws_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 17: { // ATV Quad
        if (commandpointsblu1 >= 1) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 1;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Quadbike_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 18: { // Cheetah AA
        if (commandpointsblu1 >= 30) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 30;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_APC_Tracked_01_AA_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 19: { // Slammer
        if (commandpointsblu1 >= 40) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 40;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MBT_01_cannon_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 20: { // Bobcat
        if (commandpointsblu1 >= 28) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 28;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_APC_Tracked_01_CRV_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 21: { // SF SUV
        if (commandpointsblu1 >= 2) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 2;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "C_Offroad_01_F" createVehicle _spawnPos;
            sleep 1;
            vehic setObjectTexture [0, "#(argb,8,8,3)color(0.141,0.118,0.082,1)"];
            vehic animate ["Hidepolice", 1];
            vehic animate ["Hideservices", 1];
            vehic animate ["Hidebackpacks", 0];
            vehic animate ["Hidebumper1", 0];
            vehic animate ["Hidebumper2", 0];
            vehic animate ["Hideconstruction", 0];
            vehic animate ["Hidedoor1", 1];
            vehic animate ["Hidedoor2", 1];
            vehic animate ["Hidedoor3", 1];
            vehic animate ["Hideglass2", 1];
        } else {
            hint "Not enough command points";
        };
    };
    case 22: { // MLRS Artillery
        if (commandpointsblu1 >= 75) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 75;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MBT_01_mlrs_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 23: { // Scorcher Artillery
        if (commandpointsblu1 >= 75) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 75;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MBT_01_arty_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 24: { // Fuel Truck (van)
        if (commandpointsblu1 >= 10) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 10;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_G_Van_01_fuel_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 25: { // Wipeout CAS
        if (commandpointsblu1 >= 45) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 45;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_Plane_CAS_01_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 26: { // Slammer Urban Purpose
        if (commandpointsblu1 >= 40) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 40;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_MBT_01_TUSK_F" createVehicle _spawnPos;
            [vehic] remoteExec ["addEWS_EH", 0, true];
        } else {
            hint "Not enough command points";
        };
    };
    case 27: { // Stomper RCWS
        if (commandpointsblu1 >= 20) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 20;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_UGV_01_rcws_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 28: { // Stomper Scout
        if (commandpointsblu1 >= 10) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 10;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_UGV_01_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 29: { // Greyhawk ATG
        if (commandpointsblu1 >= 15) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 15;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_UAV_02_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 30: { // Greyhawk CAS
        if (commandpointsblu1 >= 15) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 15;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_UAV_02_CAS_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 31: { // MQ-12 Falcon
        if (commandpointsblu1 >= 60) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 60;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_UAV_03_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 32: { // Darter UAV
        if (commandpointsblu1 >= 5) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 5;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_UAV_01_F" createVehicle _spawnPos; createVehicleCrew vehic;
        } else {
            hint "Not enough command points";
        };
    };
    case 33: { // Blackfish (Infantry)
        if (commandpointsblu1 >= 40) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 40;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_VTOL_01_infantry_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 34: { // Blackfish (Vehicle)
        if (commandpointsblu1 >= 45) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 45;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_VTOL_01_vehicle_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
    case 35: { // Blackfish (Armed)
        if (commandpointsblu1 >= 60) then {
            hint "Vehicle ready !";
            commandpointsblu1 = commandpointsblu1 - 60;
            ctrlSetText [1000, format["%1",commandpointsblu1]];
            vehic = "B_T_VTOL_01_armed_F" createVehicle _spawnPos;
        } else {
            hint "Not enough command points";
        };
    };
};
vehic = nil;
publicVariable "commandpointsblu1";
//hint format["index: %1",_index];

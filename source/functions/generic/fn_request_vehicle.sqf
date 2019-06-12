diag_log "DUWS-R: dialog/request_vehicle.sqf running...";

_index = lbCurSel 2102;

//findEmptyPosition example
_spawnPos = (getpos hq_blu1) findEmptyPosition [20, 70];
_spawnPos = [(_spawnPos select 0)+30, _spawnPos select 1];

vehic = nil;

switch (_index) do requestVehicleCases;

/*{
    case 0: { // Small Truck 1
        [4, "I_G_Offroad_01_F"] call duws_fnc_spawnVehicle;
    };
    case 1: { // Small Truck 2
        [6, "I_G_Van_01_transport_F"] call duws_fnc_spawnVehicle;
    };
    case 2: { // Prowler Unarmed
        [5, "B_T_LSV_01_unarmed_F"] call duws_fnc_spawnVehicle;
    };
    case 3: { // Prowler Armed
        [13, "B_T_LSV_01_armed_F"] call duws_fnc_spawnVehicle;
    };
    case 4: { // Hunter Unarmed
        [5, "B_MRAP_01_F"] call duws_fnc_spawnVehicle;
    };
    case 5: { // Hunter HMG
        [18, "B_MRAP_01_hmg_F"] call duws_fnc_spawnVehicle;
    };
    case 6: { // Hunter GMG
        [25, "B_MRAP_01_gmg_F"] call duws_fnc_spawnVehicle;
    };
    case 7: { // Marshall
        [35, "B_APC_Wheeled_01_cannon_F"] call duws_fnc_spawnVehicle;
    };
    case 8: { //HEMETT Transport Covered
        [8, Blufor_Truck_Covered] call duws_fnc_spawnVehicle;
    };
    case 9: { // Pawnee
        [25, "B_Heli_Light_01_armed_F"] call duws_fnc_spawnVehicle;
    };
    case 10: { // Blackfoot
        [45, "B_Heli_Attack_01_F"] call duws_fnc_spawnVehicle;
    };
    case 11: { // HummingBird
        [15, "B_Heli_Light_01_F"] call duws_fnc_spawnVehicle;
    };
    case 12: { // M-900 Civ.
        [12, "C_Heli_Light_01_civil_F"] call duws_fnc_spawnVehicle;
    };
    case 13: { // Taru Empty
        [18, "O_Heli_Transport_04_F"] call duws_fnc_spawnVehicle;
    };
    case 14: { // GhostHawk
        [22, "B_Heli_Transport_01_F"] call duws_fnc_spawnVehicle;
    };
    case 15: { // Huron
        [26, "B_Heli_Transport_03_F"] call duws_fnc_spawnVehicle;
    };
    case 16: { // Panther IFV
        [25, "B_APC_Tracked_01_rcws_F"] call duws_fnc_spawnVehicle;
    };
    case 17: { // ATV Quad
        [1, "B_Quadbike_01_F"] call duws_fnc_spawnVehicle;
    };
    case 18: { // Cheetah AA
        [30, "B_APC_Tracked_01_AA_F"] call duws_fnc_spawnVehicle;
    };
    case 19: { // Slammer
        [40, "B_MBT_01_cannon_F"] call duws_fnc_spawnVehicle;
    };
    case 20: { // Bobcat
        [28, "B_APC_Tracked_01_CRV_F"] call duws_fnc_spawnVehicle;
    };
    case 21: { // SF SUV
        [2, "C_Offroad_01_F"] call duws_fnc_spawnVehicle;
    };
    case 22: { // MLRS Artillery
        [75, "B_MBT_01_mlrs_F"] call duws_fnc_spawnVehicle;
    };
    case 23: { // Scorcher Artillery
        [75, "B_MBT_01_arty_F"] call duws_fnc_spawnVehicle;
    };
    case 24: { // Fuel Truck (van)
        [10, "B_G_Van_01_fuel_F"] call duws_fnc_spawnVehicle;
    };
    case 25: { // Wipeout CAS
        [45, "B_Plane_CAS_01_F"] call duws_fnc_spawnVehicle;
    };
    case 26: { // Slammer Urban Purpose
        [40, "B_MBT_01_TUSK_F"] call duws_fnc_spawnVehicle;
    };
    case 27: { // Stomper RCWS
        [20, "B_UGV_01_rcws_F"] call duws_fnc_spawnVehicle;
    };
    case 28: { // Stomper Scout
        [10, "B_UGV_01_F"] call duws_fnc_spawnVehicle;
    };
    case 29: { // Greyhawk ATG
        [15, "B_UAV_02_F"] call duws_fnc_spawnVehicle;
    };
    case 30: { // Greyhawk CAS
        [15, "B_UAV_02_CAS_F"] call duws_fnc_spawnVehicle;
    };
    case 31: { // MQ-12 Falcon
        [60, "B_T_UAV_03_F"] call duws_fnc_spawnVehicle;
    };
    case 32: { // Darter UAV
        [5, "B_UAV_01_F"] call duws_fnc_spawnVehicle;
    };
    case 33: { // Blackfish (Infantry)
        [40, "B_T_VTOL_01_infantry_F"] call duws_fnc_spawnVehicle;
    };
    case 34: { // Blackfish (Vehicle)
        [45, "B_T_VTOL_01_vehicle_F"] call duws_fnc_spawnVehicle;
    };
    case 35: { // Blackfish (Armed)
        [60, "B_T_VTOL_01_armed_F"] call duws_fnc_spawnVehicle;
    };
    case 36: { //WASP
        [50, "B_Plane_Fighter_01_F"] call duws_fnc_spawnVehicle;
    };
    case 37: { //WASP (Stealth)
        [60, "B_Plane_Fighter_01_Stealth_F"] call duws_fnc_spawnVehicle;
    };
    case 38: { //Rhino (Stealth)
        [38, "B_AFV_Wheeled_01_cannon_F"] call duws_fnc_spawnVehicle;
    };
    case 39: { //Rhino UP (Stealth)
        [42, "B_AFV_Wheeled_01_up_cannon_F"] call duws_fnc_spawnVehicle;
    };
};*/
vehic = nil;
publicVariable "commandpointsblu1";
//hint format["index: %1",_index];

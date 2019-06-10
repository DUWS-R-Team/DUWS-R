// DUWS-R Config

DUWS_Version = "0.7.0";           //Do not touch

// Blufor Faction
Blufor_Faction =                  "BLU_F";

// Blufor Soldiers
Blufor_Officer =                  "B_officer_F";
Blufor_Squadleader =              "B_Soldier_SL_F";
Blufor_Teamleader =               "B_Soldier_TL_F";
Blufor_Medic =                    "B_medic_F";
Blufor_Engineer =                 "B_engineer_F";
Blufor_Rifleman =                 "B_Soldier_F";
Blufor_Rifleman_Light =           "B_Soldier_lite_F";
Blufor_Rifleman_AT =              "B_Soldier_LAT_F";
Blufor_Marksman =                 "B_soldier_M_F";
Blufor_Recon_Scout =              "B_recon_F";
Blufor_Grenadier =                "B_Soldier_GL_F";
Blufor_Autorifleman =             "B_soldier_AR_F";
Blufor_HeavyGunner =              "B_HeavyGunner_F";
Blufor_AT_Specialist =            "B_soldier_AT_F";
Blufor_AA_Specialist =            "B_soldier_AA_F";
Blufor_Pilot =                    "B_pilot_F";
Blufor_Heli_Pilot =               "B_Helipilot_F";
Blufor_Crewman =                  "B_crew_F";
Blufor_Repair_Specialist =        "B_soldier_repair_F";
Blufor_diver =                    "B_diver_F";
Blufor_sniper =                   "B_sniper_F";
Blufor_spotter =                  "B_spotter_F";
Blufor_Explosive_Specialist =     "B_soldier_exp_F";

// Blufor Purchasable Units
// Format: ["classname", cost, SF Skill (optional boolean)]
blufor_unit_array = [
    [Blufor_Rifleman, 2],
    [Blufor_Grenadier, 3],
    [Blufor_Autorifleman, 3],
    [Blufor_Rifleman_AT, 3],
    [Blufor_Medic, 4],
    [Blufor_AA_Specialist, 4],
    [Blufor_Repair_Specialist, 4],
    [Blufor_AT_Specialist, 4],
    [Blufor_diver, 3, true],
    [Blufor_Marksman, 3],
    [Blufor_sniper, 4, true],
    [Blufor_spotter, 3, true],
    [Blufor_Explosive_Specialist, 4]
];

// Blufor Purchasable Groups
// Format [cost, cfgGroups entry, SF Skill (optional boolean)]
blufor_cfgGroup_array =
[
    [8, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")],
    [16, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad")],
    [18, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons")],
    [12, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AT")],
    [15, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AA")],
    [12, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_ReconPatrol"), true],
    [20, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_ReconSquad"), true],
    [12, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "SpecOps" >> "BUS_DiverTeam"), true],
    [8, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_SniperTeam"), true],
    [10, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Support" >> "BUS_Support_CLS")],
    [28, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Motorized" >> "BUS_MotInf_Team")],
    [46, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInfSquad")]
];

// Blufor Vehicles
Blufor_Flag = "Flag_NATO_F";
Blufor_Helowreck = "Land_Wreck_Heli_Attack_01_F"; // Used for 'Downed Pilot' side mission
Blufor_SupplyCrate = "B_supplyCrate_F"; // Used for ammobox support
Blufor_AA_Static = "B_static_AA_F";
Blufor_GMG_Static = "B_GMG_01_high_F";
Blufor_AT_Static = "B_static_AT_F";
Blufor_HMG_Static = "B_HMG_01_high_F";
Blufor_Truck_Covered = "B_Truck_01_covered_F";
Blufor_Truck_Open = "B_TrucK_01_transport_F";
Blufor_Taxi_Boat = "B_Lifeboat";
Blufor_Taxi_Helo = "B_Heli_Transport_01_camo_F";

// Contents of Ammobox Support
// Format: ["classname", amount]
// classname can be of types: item, weapons, magazine
// For more info, see https://community.bistudio.com/wiki/addItemCargo
Blufor_Ammobox_Contents =
[
    ["30Rnd_65x39_caseless_mag", 70],
    ["30Rnd_65x39_caseless_mag_Tracer", 70],
    ["100Rnd_65x39_caseless_mag", 70],
    ["100Rnd_65x39_caseless_mag_tracer", 70],
    ["1Rnd_HE_Grenade_shell", 90],
    ["UGL_FlareRed_F", 70],
    ["UGL_FlareGreen_F", 70],
    ["1Rnd_Smoke_Grenade_shell", 70],
    ["1Rnd_SmokeRed_Grenade_shell", 70],
    ["1Rnd_SmokeBlue_Grenade_shell", 70],
    ["NLAW_F", 70],
    ["Chemlight_green", 70]
];


// Blufor Purchasable Vehicles
// Format: ["vehicle", cost]
blufor_vehicle_array = [
    [5, "B_LSV_01_unarmed_F"],
    [13, "B_LSV_01_armed_F"],
    [16,"B_LSV_01_AT_F"],
    [5, "B_MRAP_01_F"],
    [18, "B_MRAP_01_hmg_F"],
    [25, "B_MRAP_01_gmg_F"],
    [35, "B_APC_Wheeled_01_cannon_F"],
    [8, "B_Truck_01_covered_F"],
    [25, "B_Heli_Light_01_armed_F"],
    [45, "B_Heli_Attack_01_F"],
    [15, "B_Heli_Light_01_F"],
    [12, "B_Heli_Transport_01_F"],
    [26, "B_Heli_Transport_03_F"],
    [25, "B_APC_Tracked_01_rcws_F"],
    [1, "B_Quadbike_01_F"],
    [30, "B_APC_Tracked_01_AA_F"],
    [40, "B_MBT_01_cannon_F"],
    [28, "B_APC_Tracked_01_CRV_F"],
    [75, "B_MBT_01_mlrs_F"],
    [75, "B_MBT_01_arty_F"],
    [45, "B_Plane_CAS_01_F"],
    [34, "B_MBT_01_cannon_F"],
    [40, "B_MBT_01_TUSK_F"],
    [20, "B_UGV_01_rcws_F"],
    [15, "B_UAV_02_F"],
    [15, "B_UAV_02_CAS_F"],
    [60, "B_T_UAV_03_F"],
    [40, "B_T_VTOL_01_infantry_F"],
    [45, "B_T_VTOL_01_vehicle_F"],
    [60, "B_T_VTOL_01_armed_F"],
    [50, "B_Plane_Fighter_01_F"],
    [60, "B_Plane_Fighter_01_Stealth_F"],
    [38, "B_AFV_Wheeled_01_cannon_F"],
    [42, "B_AFV_Wheeled_01_up_cannon_F"]
];

// Opfor Faction
Opfor_Faction =                 "OPF_F";

// Opfor Soldiers
Opfor_Officer =                 "O_officer_F";
Opfor_Squadleader =             "O_Soldier_SL_F";
Opfor_Teamleader =                 "O_Soldier_TL_F";
Opfor_Medic =                     "O_medic_F";
Opfor_Rifleman =                 "O_Soldier_F";
Opfor_Rifleman_Light =             "O_Soldier_lite_F";
Opfor_Rifleman_AT =             "O_Soldier_LAT_F";
Opfor_Marksman =                 "O_soldier_M_F";
Opfor_Grenadier =                 "O_Soldier_GL_F";
Opfor_Autorifleman =             "O_Soldier_AR_F";
Opfor_HeavyGunner =             "O_HeavyGunner_F";
Opfor_AT_Specialist =             "O_Soldier_AT_F";
Opfor_AA_Specialist =             "O_Soldier_AA_F";
Opfor_Pilot =                     "O_Pilot_F";
Opfor_Heli_Pilot =                 "O_helipilot_F";
Opfor_Crewman =                 "O_crew_F";

// Opfor Vehicles (Used for objectives)
Opfor_Flag =                     "Flag_CSAT_F";
Opfor_Supplycrate =             "O_supplyCrate_F";
Opfor_Quadbike =                 "O_Quadbike_01_F";
Opfor_Truck_Covered =             "O_Truck_02_covered_F";
Opfor_Truck_Open =                 "O_TrucK_02_transport_F";
Opfor_MRAP =                     "O_MRAP_02_F";

// Opfor Groups
Opfor_WARCOM_Fireteam =         (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam");
Opfor_WARCOM_Infantry_Squad =     (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad");
Opfor_WARCOM_Weapons_Squad =     (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons");
Opfor_WARCOM_Mech_Inf_Squad =     (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Mechanized" >> "OIA_MechInfSquad");
Opfor_WARCOM_Mech_Wpn_Squad =     (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Mechanized" >> "OIA_MechInf_AT");

// Indfor faction
Indfor_Faction = "IND_F";

// Civilian faction
Civilian_Faction = "CIV_F";

///////Special Operatives///////
duws_operator_list=[
    [0.35,0.62,0.67,0.48,0.66,0.32,"Scout","Ready","Matthew 'Ghost' Norton","ghost","B_recon_F","H_Shemag_olive_hs",0,0],
    [0.57,0.39,0.49,0.28,0.51,0.35,"Rifleman","Ready","Tyler Adams","adams","B_Soldier_F","H_Cap_oli_hs",0,0],
    [0.40,0.35,0.42,0.45,0.40,0.62,"LAT Rifleman","Ready","John Campbell","campbell","B_Soldier_LAT2_F","H_HelmetB_camo",0,0],
    [0.33,0.29,0.33,0.37,0.41,0.21,"Medic","Ready","Julian 'Jester' Foote","jester","B_medic_F","H_HelmetB_grass",0,0],
    [0.58,0.25,0.31,0.39,0.24,0.54,"Machinegunner","Ready","Ryan Armstrong","armstrong","B_CTRG_soldier_AR_A_F","H_Beret_02",0,0],
    [0.68,0.22,0.58,0.28,0.31,0.21,"Sniper","Ready","Darnell Sykes","sykes","B_sniper_F","H_Booniehat_khk",0,0],
    [0.47,0.33,0.48,0.59,0.55,0.36,"Team leader","Ready","James O'Connor","oconnor","B_Soldier_TL_F","H_MilCap_ocamo",0,0],
    [0.45,0.36,0.38,0.31,0.33,0.52,"Grenadier","Ready","Nick 'Viper' Mundy","viper","B_Soldier_GL_F","H_Booniehat_khk_hs",0,0],
    [0.31,0.33,0.37,0.36,0.41,0.29,"Engineer","Ready","Martin 'Frost' Moore","frost","B_CTRG_soldier_engineer_exp_F","H_Watchcap_blk",0,0],
    [0.40,0.21,0.32,0.39,0.45,0.21,"Medic","Ready","Chris Hawkins","hawkins","B_CTRG_soldier_M_medic_F","H_HelmetB_camo",0,0],
    [0.64,0.26,0.55,0.25,0.46,0.31,"Marksman","Ready","Alex Taylor","taylor","B_Soldier_M_F","H_Watchcap_blk",0,0],
    [0.35,0.33,0.39,0.38,0.24,0.53,"AT Specialist","Ready","Arnold Patterson","patterson","B_soldier_AT_F","H_HelmetB",0,0],
    [0.58,0.40,0.49,0.41,0.24,0.44,"Rifleman","Ready","Marcus Lopez","lopez","B_Soldier_F","H_Booniehat_mcamo",0,0],
    [0.54,0.32,0.27,0.39,0.30,0.49,"Machinegunner","Ready","Adam Reynolds","reynolds","B_soldier_AR_F","H_Cap_headphones",0,0],
    [0.30,0.40,0.49,0.41,0.24,0.44,"AA Specialist","Ready","Andrew Levine","levine","B_soldier_AA_F","H_HelmetB_camo",0,0],
    [0.49,0.35,0.30,0.36,0.44,0.51,"Grenadier","Ready","Hines McKendrick","mckendrick","B_Story_Protagonist_F","H_Cap_tan_specops_US",0,0],
    [0.38,0.41,0.42,0.29,0.33,0.36,"Saboteur","Ready","Sean 'Snake' Vincent","snake","B_recon_exp_F","H_MilCap_ocamo",0,0],
    [0.45,0.32,0.55,0.66,0.61,0.24,"Squad leader","Ready","Darryl Franklin","franklin","B_Soldier_SL_F","H_Beret_02",0,0],
    [0.41,0.45,0.68,0.27,0.30,0.24,"Spotter","Ready","Julian 'Fox' Warren","fox","B_spotter_F","H_Beret_red",0,0],
    [0.37,0.41,0.25,0.22,0.29,0.29,"Repair specialist","Ready","Samuel Martinez","martinez","B_soldier_repair_F","H_HelmetB",0,0],
    [0.37,0.35,0.47,0.49,0.23,0.55,"AT Rifleman","Ready","Mike 'Stranger' Sanders","stranger","B_CTRG_soldier_GL_LAT_F","H_Booniehat_khk_hs",0,0],
    [0.62,0.25,0.57,0.29,0.30,0.27,"Marksman","Ready","Charles Dixon","dixon","B_recon_M_F","H_Shemag_olive_hs",0,0]
];

/*
0: aim
1: reflexes
2: spotting
3: courage
4: communications
5: reload speed
6: role
7: status (always "Ready")
8: name
9: CfgIdentity class
10: soldier class
11: hat
12: time before heal
13: available spendable points
*/

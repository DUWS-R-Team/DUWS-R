// MAX RADIUS
_index = lbCurSel 2100;
switch (_index) do {
    case index_max_radius_500: {
        zones_max_radius = 500
    };
    case index_max_radius_750: {
        zones_max_radius = 750
    };
    case index_max_radius_1000: {
        zones_max_radius = 1000
    };
    case index_max_radius_1250: {
        zones_max_radius = 1250
    };
    case index_max_radius_1500: {
        zones_max_radius = 1500
    };
    case index_max_radius_1750: {
        zones_max_radius = 1750
    };
    case index_max_radius_2000: {
        zones_max_radius = 2000
    };
    case index_max_radius_2500: {
        zones_max_radius = 2500
    };
    case index_max_radius_3000: {
        zones_max_radius = 3000
    };
    case index_max_radius_4000: {
        zones_max_radius = 4000
    };
};

// MIN RADIUS
_index = lbCurSel 2101;
switch (_index) do {
    case index_min_radius_250: {
        zones_min_radius = 250
    };
    case index_min_radius_500: {
        zones_min_radius = 500
    };
    case index_min_radius_750: {
        zones_min_radius = 750
    };
    case index_min_radius_1000: {
        zones_min_radius = 1000
    };
    case index_min_radius_1250: {
        zones_min_radius = 1250
    };
    case index_min_radius_1500: {
        zones_min_radius = 1500
    };
    case index_min_radius_1750: {
        zones_min_radius = 1750
    };
    case index_min_radius_2000: {
        zones_min_radius = 2000
    };
    case index_min_radius_2500: {
        zones_min_radius = 2500
    };
    case index_min_radius_3000: {
        zones_min_radius = 3000
    };
};

// ZONES NUMBER
_index = lbCurSel 2102;
switch (_index) do {
    case index_amount_zones_1: {
        zones_number = 1
    };
    case index_amount_zones_2: {
        zones_number = 2
    };
    case index_amount_zones_3: {
        zones_number = 3
    };
    case index_amount_zones_4: {
        zones_number = 4
    };
    case index_amount_zones_5: {
        zones_number = 5
    };
    case index_amount_zones_6: {
        zones_number = 6
    };
    case index_amount_zones_7: {
        zones_number = 7
    };
    case index_amount_zones_8: {
        zones_number = 8
    };
    case index_amount_zones_9: {
        zones_number = 9
    };
    case index_amount_zones_10: {
        zones_number = 10
    };
    case index_amount_zones_11: {
        zones_number = 11
    };
    case index_amount_zones_12: {
        zones_number = 12
    };
    case index_amount_zones_13: {
        zones_number = 13
    };
    case index_amount_zones_14: {
        zones_number = 14
    };
    case index_amount_zones_15: {
        zones_number = 15
    };
    case index_amount_zones_16: {
        zones_number = 16
    };
    case index_amount_zones_17: {
        zones_number = 17
    };
    case index_amount_zones_18: {
        zones_number = 18
    };
    case index_amount_zones_19: {
        zones_number = 19
    };
    case index_amount_zones_20: {
        zones_number = 20
    };
};

// Starting CP
_index = lbCurSel 2103;
switch (_index) do {
    case index_amount_cp_5: {
        commandpointsblu1 = 5
    };
    case index_amount_cp_10: {
        commandpointsblu1 = 10
    };
    case index_amount_cp_20: {
        commandpointsblu1 = 20
    };
    case index_amount_cp_30: {
        commandpointsblu1 = 30
    };
    case index_amount_cp_40: {
        commandpointsblu1 = 40
    };
    case index_amount_cp_50: {
        commandpointsblu1 = 50
    };
    case index_amount_cp_60: {
        commandpointsblu1 = 60
    };
    case index_amount_cp_70: {
        commandpointsblu1 = 70
    };
    case index_amount_cp_80: {
        commandpointsblu1 = 80
    };
    case index_amount_cp_90: {
        commandpointsblu1 = 90
    };
    case index_amount_cp_100: {
        commandpointsblu1 = 100
    };
    case index_amount_cp_200: {
        commandpointsblu1 = 200
    };
    case index_amount_cp_300: {
        commandpointsblu1 = 300
    };
    case index_amount_cp_400: {
        commandpointsblu1 = 400
    };
    case index_amount_cp_500: {
        commandpointsblu1 = 500
    };
    case index_amount_cp_600: {
        commandpointsblu1 = 600
    };
};

// Weather type
_index = lbCurSel 2106;
switch (_index) do {
    case index_weather_type_tropical: {
        weather_type = "tropical";
    };
    case index_weather_type_arid: {
        weather_type = "arid";
    };
    case index_weather_type_temperate: {
        weather_type = "temperate";
    };
    case index_weather_type_temperate_cold: {
        weather_type = "temperate_cold";
    };
    case index_weather_type_mediterranean: {
        weather_type = "mediterranean";
    };
    case index_weather_type_varied: {
        weather_type = "varied";
    };
    case index_weather_type_disable: {
        dynamic_weather_enable = false;
    };
};

// AI opf Skill
_index = lbCurSel 2107;
switch (_index) do {
    case index_op_skill_elite: {
        opfor_ai_skill = [0.8,1.0];
    };
    case index_op_skill_commando: {
        opfor_ai_skill = [0.6,0.8];
    };
    case index_op_skill_veteran: {
        opfor_ai_skill = [0.4,0.7];
    };
    case index_op_skill_trained: {
        opfor_ai_skill = [0.2,0.5];
    };
    case index_op_skill_rookie: {
        opfor_ai_skill = [0,0.3];
    };
};

// AI BLUFOR Skill
_index = lbCurSel 2108;
switch (_index) do {
    case index_blu_skill_elite: {
        blufor_ai_skill = [0.8,1.0];
    };
    case index_blu_skill_commando: {
        blufor_ai_skill = [0.6,0.8];
    };
    case index_blu_skill_veteran: {
        blufor_ai_skill = [0.4,0.7];
    };
    case index_blu_skill_trained: {
        blufor_ai_skill = [0.2,0.5];
    };
    case index_blu_skill_rookie: {
        blufor_ai_skill = [0,0.3];
    };
};

// ARMY POWER BLUFOR
_index = lbCurSel 2104;
switch (_index) do {
    case index_blufor_ap_0: {
        blufor_ap = 0;
    };
    case index_blufor_ap_10: {
        blufor_ap = 10;
    };
    case index_blufor_ap_50: {
        blufor_ap = 50;
    };
    case index_blufor_ap_80: {
        blufor_ap = 80;
    };
    case index_blufor_ap_110: {
        blufor_ap = 110;
    };
    case index_blufor_ap_170: {
        blufor_ap = 170;
    };
    case index_blufor_ap_200: {
        blufor_ap = 200;
    };
};

// ARMY POWER OPFOR
_index = lbCurSel 2105;
switch (_index) do {
    case index_opfor_ap_0: {
        opfor_ap = 0;
    };
    case index_opfor_ap_10: {
        opfor_ap = 10;
    };
    case index_opfor_ap_50: {
        opfor_ap = 50;
    };
    case index_opfor_ap_80: {
        opfor_ap = 80;
    };
    case index_opfor_ap_110: {
        opfor_ap = 110;
    };
    case index_opfor_ap_170: {
        opfor_ap = 170;
    };
    case index_opfor_ap_200: {
        opfor_ap = 200;
    };
};

// ENABLE CHOPPER FAST TRAVEL
_index = lbCurSel 2109;
switch (_index) do {
    case index_chopper_travel_false: {
        enableChopperFastTravel = false;
    };
    case index_chopper_travel_true: {
        enableChopperFastTravel = true;
    };
};

// FAST TRAVEL
_index = lbCurSel 2714;
switch (_index) do {
    case index_fast_travel_false: {
        enable_fast_travel = false;
    };
    case index_fast_travel_true: {
        enable_fast_travel = true;
    };
};

// MAX DIST FROM HQ
_index = lbCurSel 2188;
switch (_index) do {
    case index_max_dist_hq_25: {
        zones_max_dist_from_hq = 2500;
    };
    case index_max_dist_hq_50: {
        zones_max_dist_from_hq = 5000;
    };
    case index_max_dist_hq_75: {
        zones_max_dist_from_hq = 7500;
    };
    case index_max_dist_hq_100: {
        zones_max_dist_from_hq = 10000;
    };
    case index_max_dist_hq_125: {
        zones_max_dist_from_hq = 12500;
    };
    case index_max_dist_hq_150: {
        zones_max_dist_from_hq = 15000;
    };
    case index_max_dist_hq_175: {
        zones_max_dist_from_hq = 17500;
    };
    case index_max_dist_hq_200: {
        zones_max_dist_from_hq = 20000;
    };
    case index_max_dist_hq_250: {
        zones_max_dist_from_hq = 25000;
    };
    case index_max_dist_hq_300: {
        zones_max_dist_from_hq = 30000;
    };
    case index_max_dist_hq_400: {
        zones_max_dist_from_hq = 40000;
    };
    case index_max_dist_hq_500: {
        zones_max_dist_from_hq = 50000;
    };
};

_index = lbCurSel 2189;
switch (_index) do {
    case index_cp_reward_multiplier_half:{
        cp_reward_multiplier = 0.5;
    };
    case index_cp_reward_multiplier_one:{
        cp_reward_multiplier = 1;
    };
    case index_cp_reward_multiplier_two:{
        cp_reward_multiplier = 2;
    };
    case index_cp_reward_multiplier_five:{
        cp_reward_multiplier = 5;
    };
};

 // CHECK IF MAX/MIN RADIUS PARAMETERS CORRECT
if (zones_max_radius <= zones_min_radius) exitWith {Hint "Unable to generate campaign:\nMaximum radius of a zone\nmust be superior to\nMinimum radius of a zone"};

zones_spacing = zones_max_radius + 200;
publicVariable "chosen_settings";
publicVariable "zones_max_radius";
publicVariable "zones_min_radius";
publicVariable "zones_number";
publicVariable "commandpointsblu1";
publicVariable "weather_type";
publicVariable "blufor_ai_skill";
publicVariable "opfor_ai_skill";
publicVariable "opfor_ap";
publicVariable "blufor_ap";
publicVariable "enableChopperFastTravel";
publicVariable "enable_fast_travel";
publicVariable "zones_max_dist_from_hq";


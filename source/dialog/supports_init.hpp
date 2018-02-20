support_supplydrop_available = false;
support_paradrop_available = false;
support_jdam_available = false;
support_mortar_available = false;
support_arty_available = false;
support_pFLIR_available = false;
support_uav_recon_available = false;
support_veh_refit_available = false;
support_helotaxi_available = false;
support_boattaxi_available = false;
support_cluster_available = false;

if (isNil "support_specialized_training_available") then {
    support_specialized_training_available = false;
};

if (isNil "support_armory_available") then {
    support_armory_available = false;
};

/*
    Support Timeout variables
    Variables that hold the next VALID time to use that supports (in seconds)
    Supports should set the next valid time as:
    support_exampleSupport_timeout = *now* + xyz seconds;
*/

support_mortar_timeout = 0;
support_jdam_timeout = 0;
support_arty_timeout = 0;
support_cluster_timeout = 0;
support_uav_recon_timeout = 0;
//support_helotaxi_timeout = 0; format may not be suitable
//support_boattaxi_timeout = 0;

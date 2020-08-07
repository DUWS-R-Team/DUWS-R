//https://community.bistudio.com/wiki/Functions_Library_(Arma_3)
class CfgFunctions
{
    class duws
    {
        class initMission
        {
            //duws_fnc_clientInit
            class clientInit
            {
                //postInit = 1;
            };
            //duws_fnc_serverInit
            class serverInit
            {
                //preInit = 1;
            };
            class DUWS_CONFIG
            {
                preInit = 1;
                file = "DUWS_CONFIG.sqf";
            };
            class processUnitConfig {};
            class processVehicleConfig {};
            class processGroupConfig {};
        };

        class generic
        {
            class bisArsenal {};
            // [] call duws_fnc_bisArsenal
            class captured {};
            // [place, points, markername, markername2, triggerPos] call duws_fnc_captured
            class createopfortified {};
            // [position] call duws_fnc_createopfortified
            class createoppatrol {};
            // [position, radius] call duws_fnc_createoppatrol
            class createopteam {};
            // [position, radius] call duws_fnc_createopteam
            class createopwpteam {};
            // [position, radius] call duws_fnc_createopwpteam
            class createpatrol {};
            // [position, radius] call duws_fnc_createpatrol
            class convertCPtoAP {};
            // [] call duws_fnc_convertCPtoAP
            class dynamic_menu {};
            // [???] spawn duws_fnc_dynamic_menu
            class dyn_music_init
            {
                postInit = 1;
            };
            // [] spawn duws_fnc_dynamic_music_init
            class enterlocation {};
            // [place, trigger] spawn duws_fnc_enterlocation
            class mapsize {};
            // [unit, debug] spawn duws_fnc_mapsize
            class musicloop {};
            // [] spawn duws_fnc_musicloop
            class random_name {};
            // [length] call duws_fnc_random_name
            class random_veh {};
            // [faction, vehClass, position, radius] spawn duws_fnc_random_veh
            class request {};
            // [] call duws_fnc_request
            class request_squad {};
            // [] call duws_fnc_request_squad
            class request_support {};
            // [] call duws_fnc_request_support
            class request_unit {};
            // [] call duws_fnc_request_unit
            class request_vehicle {};
            // [] call duws_fnc_request_vehicle
            class savegame {};
            // [] spawn duws_fnc_savegame
            class savegameClient {};
            // [] spawn duws_fnc_savegameClient
            class spawnVehicle {};
            //[requiredPoints, vehicleType] call duws_fnc_spawnVehicle
            class zones_bonus {};
            // [] spawn duws_fnc_zones_bonus
            class zonesundercontrol {};
            // [] spawn duws_fnc_zonesundercontrol
            class hc_init {};
            // [] call duws_fnc_hc_init
        };

        class fob
        {
            class fast_travel {};
            // [] call duws_fnc_fast_travel
            class fobmanageropen {};
            // [] spawn duws_fnc_fobmanageropen
            class radiochatter {};
            // [object] spawn duws_fnc_radiochatter
            class reinforce {};
            // [] spawn duws_fnc_reinforce
        };

        class utilities
        {
            class autoSave {};
            // [] spawn duws_fnc_autoSave
            class groupReset {};
            // [] call duws_fnc_groupReset
        };

        class WARCOM
        {
            class random_veh_blu_patrol {};
            // [faction, vehclass, position, radius] spawn duws_fnc_random_veh_blu_patrol
            class random_veh_opf_patrol {};
            //  [faction, vehclass, position, radius] spawn duws_fnc_random_veh_opf_patrol
            class WARCOM_blu_assault {};
            // [] call duws_fnc_WARCOM_blu_assault
            class WARCOM_blu_patrol {};
            // [] call duws_fnc_WARCOM_blu_patrol
            class WARCOM_gps_marker {};
            // [group, TFname] spawn duws_fnc_WARCOM_gps_marker
            class WARCOM_init {};
            // [array of zones total, blu hq pos, op hq pos, blufor ap, opfor ap, blu attack delay, blu ai skill range, opfor ai skill, opfor assault delay] call duws_fnc_WARCOM_init
            class WARCOM_opf_assault {};
            // [] call duws_fnc_WARCOM_opf_assault
            class WARCOM_opf_patrol {};
            // [] call duws_fnc_WARCOM_opf_patrol
            class WARCOM_opf_qrf {};
            // [attachedUnit] spawn duws_fnc_WARCOM_opf_qrf
            class WARCOM_wp {};
            // [group] call duws_fnc_WARCOM_wp
            class WARCOM_wp_blu_patrol {};
            // [group] call duws_fnc_WARCOM_wp_blu_patrol
            class WARCOM_wp_opf {};
            // [group] call duws_fnc_WARCOM_wp_opf
            class WARCOM_wp_opf_patrol {};
            // [group] call duws_fnc_WARCOM_wp_opf_patrol
            class WARCOM_wp_opf_qrf {};
            // [group, unitpos] call duws_fnc_WARCOM_wp_opf_qrf
        };

        class initHQ
        {
            class BluHQinit {};
            // [_hqblu] spawn duws_fnc_BluHQinit
            class drawIcon {};
            // [] spawn duws_fnc_drawIcon
            // Used for generating HQ 3d marker
            class drawIconFnc {};
            // [] spawn duws_fnc_drawIconFnc
            // Called from duws_fnc_drawIcon
            class fobmanager {};
            // [] call duws_fnc_fobmanager
            class fortify {};
            // [_centerPos, _hq] spawn duws_fnc_fortify
            class fortifyFOB {};
            // (in addaction) '_this spawn duws_fnc_fortifyFOB' with arguments '[(getpos _fob), _fob]'
            class fortifyFOB2 {};
            // [_centerPos, _fob] spawn duws_fnc_fortifyFOB2
            class guards {};
            // [_centerPos, _hq] call duws_fnc_guards
            class guardsFOB {};
            // [_centerPos, _fob, _size] call duws_fnc_guardsFOB
            class guardsHQ {};
            // [_centerPos, _distance] call duws_fnc_guardsHQ
            class hq_radioloop {};
            // [_object] spawn duws_fnc_radioloop
            class HQaddactions {};
            // [_hq] call duws_fnc_HQaddactions
            class locatorhq {};
            // [] spawn duws_fnc_locatorhq
            class refortify {};
            // (in addaction) '_this call duws_fnc_fortify' with arguments '[_aaPod, _gl1Pod, _atPod1, _atPod2, _atPod3, _centerPos, _hq]'
            class refortifyFOB {};
            // (in addaction) '_this call duws_fnc_refortifyFOB' with arguments '[_aaPod, _gl1Pod, _atPod1, _atPod2, _atPod3, _centerPos, _fob]'
            class reguard {};
            // (in addaction) '_this call duws_fnc_reguard' with arguments '[_groupGuard, _groupPatrol, _centerPos, _hq]'
            class reguardFOB {};
            // (in addaction) '_this call duws_fnc_reguardFOB' with arguments '[_groupGuard, _groupPatrol, _centerPos, _fob]'
            class teleport {};
            // [_fobpos] call duws_fnc_teleport
            class commanderAnim {};
            // [unit] call duws_fnc_commanderAnim
        };

        class startup
        {
            class endconditions {};
            // [] spawn duws_fnc_endconditions
            class manual {};
            // [] spawn duws_fnc_manual
            class placement {};
            // [] spawn duws_fnc_placement
            class placement_closed {};
            // [] spawn duws_fnc_placement_closed
            class random {};
            // [] call duws_fnc_random
            class startup {};
            // [] spawn duws_fnc_startup
            class startup_closed {};
            // [] call duws_fnc_startup_closed
            class startup_common {};
            // [] call duws_fnc_startup_common
            class startup_manual_start {};
            // [] spawn duws_fnc_startup_manual_start
            class startup_random_start {};
            // [] spawn duws_fnc_startup_random_start
            class weather {};
            // [] spawn duws_fnc_weather
            class weather_broadcast {};
            // [] spawn duws_fnc_weather_broadcast
            class weather_client {};
            // [] spawn duws_fnc_weather_client
        };

        class initZones
        {
            class createzone {};
            // ["Outpost Airbase",5,50,getpos this,true] spawn duws_fnc_createzone
            class createzonebackup {};
            // ["Outpost Airbase",5,50,getpos this,true] spawn duws_fnc_createzonebackup
            class locatorzonesV1 {};
            // [radius, diff] spawn duws_fnc_locatorzonesV1
            class locatorzonesV1_backup {};
            // [radius, diff] spawn duws_fnc_locatorzonesV1_backup
            class locatorzonesV2 {};
            // [radius, diff] spawn duws_fnc_locatorzonesV2
        };

        class zonescap
        {
            class blufor_cap {};
            // [place, points, markername, markername2, triggerPos] call duws_fnc_blufor_cap
            class opfor_cap {};
            // [place, points, markername, markername2, triggerPos] call duws_fnc_opfor_cap
        };

        class prefabs
        {
            class site_Barracks {};
            class site_campsite {};
            class site_commandOP {};
            class site_CommStation {};
            class site_outpost1 {};
            class site_outpost2 {};
            class site_powerRelay {};
            class site_reconOutpost {};
            class site_researchBunker {};
            class site_researchStation {};
            class site_vehfittingstation {};
        };

        class persistent
        {
            class persistent_stats_init {};
            // [] call duws_fnc_persistent_stats_init;
            class persistent_stats_missions_total {};
            // [] call duws_fnc_persistent_stats_missions_total;
            class persistent_stats_reset {};
            // [] spawn duws_fnc_persistent_stats_reset;
            class persistent_stats_win {};
            // [] call duws_fnc_persistent_stats_win;
            class persistent_stats_zones_add {};
            // [] call duws_fnc_persistent_stats_zones_add;

            class experience_init {};
            // [] call duws_fnc_experience_init;
            class experience_ability_check {};
            // [] spawn duws_fnc_experience_ability_check
            class experience_ability_fieldcomm {};
            // [player] spawn duws_fnc_experience_ability_fieldcomm;
            class experience_ability_heal {};
            // [player] spawn duws_fnc_experience_ability_heal;
            class experience_ability_logistic {};
            // [player] spawn duws_fnc_experience_ability_logistic;
            class experience_ability_logistic_boost {};
            // [player] spawn duws_fnc_experience_ability_logistic_boost
            class experience_ability_refit {};
            // [player] spawn duws_fnc_experience_ability_refit
            class experience_ability_slowtime {};
            // [player] spawn duws_fnc_experience_ability_slowtime;
            class experience_ability_stamina {};
            // [player] spawn duws_fnc_experience_ability_stamina;
            class experience_ability_warrior {};
            // [player] spawn duws_fnc_experience_ability_warruir
        };

        class operative
        {
            class operator_add_aim {};
            // [] call duws_fnc_operator_add_aim
            class operator_add_comms {};
            // [] call duws_fnc_operator_add_comms
            class operator_add_courage {};
            // [] call duws_fnc_operator_add_courage
            class operator_add_reflexes {};
            // [] call duws_fnc_operator_add_reflexes
            class operator_add_reload {};
            // [] call duws_fnc_operator_add_reload
            class operator_add_spotting {};
            // [] call duws_fnc_operator_add_spotting
            class lbselected {};
            // [] call duws_fnc_lbselected
            class operative_mission_complete {};
            // [] call operative_mission_complete
            class operator_open {};
            // [] spawn duws_fnc_operator_open
            class operator_recruit {};
            // [] spawn duws_fnc_operator_recruit
        };

        class missions
        {
            class destroy_mission {};
            // [location] spawn duws_fnc_destroy_mission
            class pilot_mission {};
            // [location] spawn duws_fnc_pilot_mission
            class rescue_mission {};
            // [location] spawn duws_fnc_rescue_mission
            class rescue_success {};
            // ["_markername","_sol1","_sol2","_sol3","_MissionPos","_markername2","_trg"] spawn duws_fnc_rescue_success
            class sabotage_mission {};
            // [location] spawn duws_fnc_sabotage_mission
            class sabotage_success {};
            // (in addaction) {_this call duws_fnc_sabotage_success;}
            class steal_mission {};
            // [location] spawn duws_fnc_steal_mission
            class target_mission {};
            // [location] spawn duws_fnc_target_mission
            class underwater_mission {};
            // [location] spawn duws_fnc_underwater_mission
            class underwater_success {};
            // (in addaction) {_this call duws_fnc_underwater_success;}

            class missionTimer {};
            // [] spawn duws_fnc_missionTimer
            class stratmap {};
            // [] spawn duws_fnc_stratmap
        };

        class squad
        {
            class copyloadout {};
            // [] call duws_fnc_copyLoadout
            class dismiss {};
            // [] call duws_fnc_dismiss
            class dismissHC {};
            // [] spawn duws_fnc_dismissHC
            class renamesquad {};
            // [] spawn duws_fnc_renamesquad
            class squadmng {};
            // [] spawn duws_fnc_squadmng
        };

        class support
        {
            class ammobox {};
            // [target] spawn duws_fnc_ammobox
            class arty {};
            // [position, salvos, radius, interval, rps, supporttype, cost, ammotype] spawn duws_fnc_arty
            class fob {};
            // [position, size] spawn duws_fnc_fob
            class fob_addAction {};
            // object remoteExecCall ["DUWS_fnc_fob_addAction", ]
            class fob_ammobox {};
            // [target, location] spawn duws_fnc_fob_ammobox
            class FOBactions {};
            // [fob] call duws_fnc_FOBactions
            class FOBreceiveaction {};
            // [] spawn duws_fnc_FOBreceiveaction
            class mapclickarty {};
            // [salvos, radius, interval, rps, supporttype, cost, ammotype] spawn duws_fnc_mapclickarty
            class mapclickuav {};
            // [] spawn duws_fnc_mapclickuav
            class paradrop {};
            // [] spawn duws_fnc_paradrop
            class sitrep {};
            // [] spawn duws_fnc_sitrep
            class uav_map {};
            // [centerPos, checkedRadius] spawn duws_fnc_uav_map
            class veh_refit {};
            // [] call duws_fnc_veh_refit

            // Taxi
            class boatTaxi
            {
                file = "functions\support\taxi\fn_boatTaxi.sqf";
            };
            // [posplayer, radius] spawn duws_fnc_boatTaxi
            class heloTaxi
            {
                file = "functions\support\taxi\fn_heloTaxi.sqf";
            };
            // [posplayer, radius] spawn duws_fnc_heloTaxi
            class mapclickboat
            {
                file = "functions\support\taxi\fn_mapclickboat.sqf";
            };
            // (in addaction) {_this spawn duws_fnc_mapclickboat}
            class mapclickhelo
            {
                file = "functions\support\taxi\fn_mapclickhelo.sqf";
            };
            // (in addaction) {_this spawn duws_fnc_mapclickhelo}
            class random_music
            {
                file = "functions\support\taxi\fn_random_music.sqf";
            };
            // [] call duws_fnc_random_music

            // Cluster
            class cluster
            {
                file = "functions\support\cluster\fn_cluster.sqf";
            };
            // [position, salvos, radius, interval, rps, supporttype, cost, ammotype] spawn duws_fnc_cluster
            class mapclickcluster
            {
                file = "functions\support\cluster\fn_mapclickcluster.sqf";
            };
            // [salvos, radius, interval, rps, supporttype, cost, ammotype] spawn duws_fnc_mapclickcluster
        };

        class misc
        {
            class bottom_right_message {};
            // [position, date] call duws_fnc_bottom_right_message
            class gps_marker {};
            // [] spawn duws_fnc_gps_marker
        };

        class info
        {
            class info {};
            // [] spawn duws_fnc_info
        };

        class pFLIR
        {
            class livefeed {};
            class livefeed1 {};
            class livefeedexit {};
        };

    };
    class TAW_VD
    {
        tag = "TAWVD";

        class TAW_VD
        {
            class stateTracker {
                ext = ".fsm";
                postInit = 1;
                headerType = -1;
            };

            class onSliderChanged {};
            class onTerrainChanged {};
            class updateViewDistance {};
            class openMenu {};
            class onChar {};
            class openSaveManager {};
            class onSavePressed {};
            class onSaveSelectionChanged {};
        };
    };

    #include "..\AIS\cfgFunctions.hpp"
};

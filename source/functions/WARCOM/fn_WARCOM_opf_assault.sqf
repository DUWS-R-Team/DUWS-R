_loop = true;

WARCOM_opf_attack_wave_type = "";
WARCOM_opf_attack_wave_avalaible = false;

// Type of attack wave
[] spawn {

          waitUntil {sleep 1; WARCOM_opfor_ap>=10};
          WARCOM_opf_attack_wave_avalaible = true;
          WARCOM_opf_attack_wave_type = Opfor_WARCOM_Fireteam;
      
          waitUntil {sleep 1; WARCOM_opfor_ap>40};          
          WARCOM_opf_attack_wave_type = Opfor_WARCOM_Infantry_Squad;
          
          waitUntil {sleep 1; WARCOM_opfor_ap>65};          
          WARCOM_opf_attack_wave_type = Opfor_WARCOM_Weapons_Squad;

          waitUntil {sleep 1; WARCOM_opfor_ap>100};          
          WARCOM_opf_attack_wave_type = Opfor_WARCOM_Mech_Inf_Squad;

          waitUntil {sleep 1; WARCOM_opfor_ap>135};          
          WARCOM_opf_attack_wave_type = Opfor_WARCOM_Mech_Wpn_Squad;


};











// Attack waves main
[] spawn {
          waitUntil {sleep 600; WARCOM_opf_attack_wave_avalaible};

          while {true} do {
          sleep 2;
          
          // find a zone where to spawn OPF wave *** BEGIN
          _found = false;
          _randomZone = [];
          _failSafe = 0;
            while {!_found} do {
            _randomZone = WARCOM_zones_controled_by_OPFOR call BIS_fnc_selectRandom;
            if (_randomZone distance player > 2000) then {_found=true;};
            sleep 0.2;
//            player sidechat format["Failsafe: %1",_failsafe];
            _failSafe = _failSafe + 1;
            if (_failsafe > 10) then {sleep 300; _failsafe = 0;}
            };
          // find a zone *** end 
          _randomZone = [(_randomZone select 0)+40,_randomZone select 1];
          _group = [_randomZone, EAST, WARCOM_opf_attack_wave_type,[],[],WARCOM_opf_ai_skill_range] call BIS_fnc_spawnGroup;
          
          [_group,_randomZone] call duws_fnc_WARCOM_wp_opf;
//        [_group,"derp"] spawn duws_fnc_WARCOM_gps_marker;          

          sleep (WARCOM_opf_attack_delay + random 1200);
          
          };
};

  _handle = createDialog "startup_dialog";  
  waitUntil {dialog};
  
  /// MAX RADIUS
  index_max_radius_4000 = lbAdd [2100, "4000 meters"]; 
  index_max_radius_3000 = lbAdd [2100, "3000 meters"];       
  index_max_radius_2500 = lbAdd [2100, "2500 meters"];       
  index_max_radius_2000 = lbAdd [2100, "2000 meters"];       
  index_max_radius_1750 = lbAdd [2100, "1750 meters"];      
  index_max_radius_1500 = lbAdd [2100, "1500 meters"];   
  index_max_radius_1250 = lbAdd [2100, "1250 meters"];     
  index_max_radius_1000 = lbAdd [2100, "1000 meters (default)"];   
  index_max_radius_750 = lbAdd [2100, "750 meters"];     
  index_max_radius_500 = lbAdd [2100, "500 meters"];      
  lbSetCurSel [2100, index_max_radius_1000];  
             
  // MIN RADIUS           
  index_min_radius_3000 = lbAdd [2101, "3000 meters"];       
  index_min_radius_2500 = lbAdd [2101, "2500 meters"];       
  index_min_radius_2000 = lbAdd [2101, "2000 meters"];       
  index_min_radius_1750 = lbAdd [2101, "1750 meters"];      
  index_min_radius_1500 = lbAdd [2101, "1500 meters"];   
  index_min_radius_1250 = lbAdd [2101, "1250 meters"];     
  index_min_radius_1000 = lbAdd [2101, "1000 meters"];   
  index_min_radius_750 = lbAdd [2101, "750 meters"];     
  index_min_radius_500 = lbAdd [2101, "500 meters"]; 
  index_min_radius_250 = lbAdd [2101, "250 meters (default)"]; 
  lbSetCurSel [2101, index_min_radius_250];  
                                    
  // AMOUNT ENEMY ZONES           
  index_amount_zones_20 = lbAdd [2102, "20"]; 
  index_amount_zones_19 = lbAdd [2102, "19"]; 
  index_amount_zones_18 = lbAdd [2102, "18"];       
  index_amount_zones_17 = lbAdd [2102, "17"];       
  index_amount_zones_16 = lbAdd [2102, "16"];       
  index_amount_zones_15 = lbAdd [2102, "15"];      
  index_amount_zones_14 = lbAdd [2102, "14"];   
  index_amount_zones_13 = lbAdd [2102, "13"];     
  index_amount_zones_12 = lbAdd [2102, "12"];   
  index_amount_zones_11 = lbAdd [2102, "11"];     
  index_amount_zones_10 = lbAdd [2102, "10"]; 
  index_amount_zones_9 = lbAdd [2102, "9"]; 
  index_amount_zones_8 = lbAdd [2102, "8"]; 
  index_amount_zones_7 = lbAdd [2102, "7"]; 
  index_amount_zones_6 = lbAdd [2102, "6 (default)"]; 
  index_amount_zones_5 = lbAdd [2102, "5"]; 
  index_amount_zones_4 = lbAdd [2102, "4"]; 
  index_amount_zones_3 = lbAdd [2102, "3"];
  index_amount_zones_2 = lbAdd [2102, "2"]; 
  index_amount_zones_1 = lbAdd [2102, "1"];
  lbSetCurSel [2102, index_amount_zones_6];  
    
  // STARTING CP AVAILABLE           
  index_amount_cp_2 = lbAdd [2103, "2 (very hard start)"]; 
  index_amount_cp_5 = lbAdd [2103, "5"];
  index_amount_cp_10 = lbAdd [2103, "10"]; 
  index_amount_cp_20 = lbAdd [2103, "20 (default start)"];
  index_amount_cp_30 = lbAdd [2103, "30"];
  index_amount_cp_40 = lbAdd [2103, "40"];
  index_amount_cp_50 = lbAdd [2103, "50"];
  index_amount_cp_60 = lbAdd [2103, "60 (very easy start)"]; 
  lbSetCurSel [2103, index_amount_cp_20];       
       
  // BLUFOR AP         
  index_blufor_ap_0 = lbAdd [2104, "0 (default start)"]; 
  index_blufor_ap_10 = lbAdd [2104, "10"];
  index_blufor_ap_50 = lbAdd [2104, "50"];
  index_blufor_ap_80 = lbAdd [2104, "80"];
  index_blufor_ap_110 = lbAdd [2104, "110 (very easy start)"];
  lbSetCurSel [2104, index_blufor_ap_0];         
       
  // OPFOR AP         
  index_opfor_ap_0 = lbAdd [2105, "0 (default start)"]; 
  index_opfor_ap_10 = lbAdd [2105, "10"]; 
  index_opfor_ap_50 = lbAdd [2105, "50"]; 
  index_opfor_ap_80 = lbAdd [2105, "80"];
  index_opfor_ap_110 = lbAdd [2105, "110"];
  lbSetCurSel [2105, index_opfor_ap_0]; 
  
  // WEATHER TYPE         
  index_weather_type_tropical = lbAdd [2106, "Tropical"];
  index_weather_type_arid = lbAdd [2106, "Arid"];
  index_weather_type_temperate = lbAdd [2106, "Temperate"];
  index_weather_type_temperate_cold = lbAdd [2106, "Temperate cold"];
  index_weather_type_mediterranean = lbAdd [2106, "Mediterranean"];
  index_weather_type_disable = lbAdd [2106, "Disable dynamic weather"];  
  lbSetCurSel [2106, index_weather_type_mediterranean];        
   
	  
	  /*
	  index_weather_type_tropical = lbAdd [2106, "Disabled due to AI bugs"];  
	  lbSetCurSel [2106, index_weather_type_tropical];  
*/
	  
  // AI OPF SKILL         
  index_op_skill_elite = lbAdd [2107, "Elite (0.8-1)"];
  index_op_skill_commando = lbAdd [2107, "Commando (0.6-0.8)"];
  index_op_skill_veteran = lbAdd [2107, "Veteran (0.4-0.7)"];
  index_op_skill_trained = lbAdd [2107, "Trained (0.2-0.5)"];
  index_op_skill_rookie = lbAdd [2107, "Rookie (0-0.3)"];
  lbSetCurSel [2107, index_op_skill_trained]; 
       
  // AI BLU SKILL         
  index_blu_skill_elite = lbAdd [2108, "Elite (0.8-1)"];
  index_blu_skill_commando = lbAdd [2108, "Commando (0.6-0.8)"];
  index_blu_skill_veteran = lbAdd [2108, "Veteran (0.4-0.7)"];
  index_blu_skill_trained = lbAdd [2108, "Trained (0.2-0.5)"];
  index_blu_skill_rookie = lbAdd [2108, "Rookie (0-0.3)"];
  lbSetCurSel [2108, index_blu_skill_trained]; 
  
  // ENABLE CHOPPER FAST TRAVEL
  index_chopper_travel_false = lbAdd [2109, "No"];   
  index_chopper_travel_true = lbAdd [2109, "Yes"];
  lbSetCurSel [2109, index_chopper_travel_true]; 
       
  // FAST TRAVEL
  index_fast_travel_true = lbAdd [2714, "Yes"];   
  index_fast_travel_false = lbAdd [2714, "No"];
  lbSetCurSel [2714, index_fast_travel_true]; 
       
  // MAX DISTANCE FROM HQ
  index_max_dist_hq_25 = lbAdd [2188, "2.5 km"];    
  index_max_dist_hq_50 = lbAdd [2188, "5 km"];   
  index_max_dist_hq_75 = lbAdd [2188, "7.5 km"]; 
  index_max_dist_hq_100 = lbAdd [2188, "10 km"];   
  index_max_dist_hq_125 = lbAdd [2188, "12.5 km"];    
  index_max_dist_hq_150 = lbAdd [2188, "15 km"];   
  index_max_dist_hq_175 = lbAdd [2188, "17.5 km"]; 
  index_max_dist_hq_200 = lbAdd [2188, "20 km"];     
  index_max_dist_hq_250 = lbAdd [2188, "25 km"];   
  index_max_dist_hq_300 = lbAdd [2188, "30 km"];  
  index_max_dist_hq_400 = lbAdd [2188, "40 km"];      
  index_max_dist_hq_500 = lbAdd [2188, "50 km"];    
  lbSetCurSel [2188, index_max_dist_hq_50];       
       
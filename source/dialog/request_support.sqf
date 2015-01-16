_index2 = lbCurSel 2103;

switch (_index2) do
{
    case 0:  
    {
         if (commandpointsblu1 >= 5) then 
             {
              if (!support_supplydrop_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 5;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"ammo"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 0, [0, 1, 0, 1]];
				  playSound "boots";
                  support_supplydrop_available = true;
                }
              else
                {
                  hint "This support is already available";
                };    
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 1:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_arty_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"artillery"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 1, [0, 1, 0, 1]];
				  playSound "boots";
                  support_arty_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 2:
    {
         if (commandpointsblu1 >= 10) then 
             {
              if (!support_mortar_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 10;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"mortar"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 2, [0, 1, 0, 1]];
				  playSound "boots";
                  support_mortar_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

        case 3:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_paradrop_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"paradrop"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 3, [0, 1, 0, 1]];
				  playSound "boots";
                  support_paradrop_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    
    case 4:
    {
         if (commandpointsblu1 >= 15) then 
             {
              if (!support_jdam_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 15;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _supplydrop = [player,"jdam"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 4, [0, 1, 0, 1]];
				  playSound "boots";
                  support_jdam_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    
    case 5:
    {
         if (commandpointsblu1 >= 8) then 
             {
              if (!support_armory_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 8;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  hq_blu1 addaction ["<t color='#ff1111'>Armory</t>","VAS\open.sqf", "", 0, true, true, "", "_this == player"];
                  lbSetColor [2103, 5, [0, 1, 0, 1]];
                  support_armory_available = true;
				  playSound "loadgun";
				  publicVariable "support_armory_available";
                  ["armory",["Armory Unlocked","Access the armory at the HQ and at the dropped supply crates"]] call bis_fnc_showNotification;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };  
    
    case 6:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_PFLIR_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  pFLIRenable = player addaction ["<t color='#a9ff59'>Activate FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"];
                  lbSetColor [2103, 6, [0, 1, 0, 1]];
                  support_pflir_available = true;
				  playSound "loadgun";
                  ["pflir",["Personal FLIR display","Toggle you personal FLIR display using the action menu"]] call bis_fnc_showNotification;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 7:
    {
         if (commandpointsblu1 >= 10) then 
             {
              if (!support_uav_recon_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 10;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _uav_recon = [player,"uav_recon"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 7, [0, 1, 0, 1]];
				  playSound "boots";
                  support_uav_recon_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 8:
    {
         if (commandpointsblu1 >= 3) then 
             {
              if (!support_veh_refit_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 3;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _veh_refit = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 8, [0, 1, 0, 1]];
				  playSound "loadgun";
                  support_veh_refit_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
             
    case 9:
    {
         if (commandpointsblu1 >= 3) then 
             {
              if (!support_helotaxi_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 3;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _veh_refit = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 9, [0, 1, 0, 1]];
				  playSound "boots";
                  support_helotaxi_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 10:
    {
         if (commandpointsblu1 >= 25) then 
             {
              if (!support_cluster_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 25;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  _cluster = [player1,"cluster"] call BIS_fnc_addCommMenuItem;
                  lbSetColor [2103, 10, [0, 1, 0, 1]];
				  playSound "boots";
                  support_cluster_available = true;
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
	
    case 11:
    {
         if (commandpointsblu1 >= 20) then 
             {
              if (!support_specialized_training_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 20;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  ["inf_training",["Specialized Infantry training","Our troops are now more skilled in battle"]] call bis_fnc_showNotification;
				  blufor_ai_skill = [(blufor_ai_skill select 0)+0.3,(blufor_ai_skill select 1)+0.3];
                  lbSetColor [2103, 11, [0, 1, 0, 1]];
                  support_specialized_training_available = true;
				  publicVariable "support_specialized_training_available";
				  playSound "boots";
				  publicVariable "blufor_ai_skill";				  
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };	
	
    case 12:
    {
         if (commandpointsblu1 >= 2) then 
             {
              if (!support_boattaxi_available) then
                {
                  commandpointsblu1 = commandpointsblu1 - 2;
                  ctrlSetText [1000, format["%1",commandpointsblu1]];
                  lbSetColor [2103, 12, [0, 1, 0, 1]];
                  support_boattaxi_available = true;
				  _supplydrop = [player,"boat_taxi"] call BIS_fnc_addCommMenuItem;
				  playSound "boots";
                }
              else
                {
                  hint "This support is already available";
                };
             } 
          else 
             {
               hint "Not enough command points";
             };
    };		
	
};

//hint format["index: %1",_index2];


publicVariable "commandpointsblu1";

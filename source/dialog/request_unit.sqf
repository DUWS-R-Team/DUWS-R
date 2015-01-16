_index = lbCurSel 2100;

_skill = (blufor_ai_skill select 0)+0.2;
_skillSF = (blufor_ai_skill select 0)+0.5;
_spawnpos = [(getpos hq_blu1 select 0)-8, (getpos hq_blu1 select 1)-3.5];

switch (_index) do
{
    case 0:  
    {
         if (commandpointsblu1 >= 2) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 2;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_Soldier_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 1:
    {
         if (commandpointsblu1 >= 3) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_Soldier_GL_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 2:
    {
         if (commandpointsblu1 >= 3) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_Soldier_AR_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 3:
    {
         if (commandpointsblu1 >= 3) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_Soldier_LAT_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 4:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_medic_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 5:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_soldier_AA_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    case 6:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_soldier_repair_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    case 7:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_soldier_AT_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
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
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_diver_F" createUnit [_spawnpos, _group, "", _skillSF, "private"] ;
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
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_soldier_M_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    case 10:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_sniper_F" createUnit [_spawnpos, _group, "", _skillSF, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 
    case 11:
    {
         if (commandpointsblu1 >= 3) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 3;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_spotter_F" createUnit [_spawnpos, _group, "", _skillSF, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 	
    case 12:
    {
         if (commandpointsblu1 >= 4) then 
             {
               hint "Unit ready !";
               commandpointsblu1 = commandpointsblu1 - 4;
               ctrlSetText [1000, format["%1",commandpointsblu1]];
               _group = group player ;
               "B_soldier_exp_F" createUnit [_spawnpos, _group, "", _skill, "private"] ;
             } 
          else 
             {
               hint "Not enough command points";
             };
    }; 		
	
};

//hint format["AI skill: %1",_skill];            
publicVariable "commandpointsblu1";

//hint format["index: %1",_index];
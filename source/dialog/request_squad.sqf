_index = lbCurSel 2101;

_spawnPos = getpos hq_blu1;
_spawnPos = [(_spawnPos select 0)+15, _spawnPos select 1];

  switch (_index) do
{
    case 0:  
    {
    _cost = 8;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_fireteam = DUWS_number_fireteam + 1;
			  _group setGroupId [format["Fireteam %1",DUWS_number_fireteam]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 1:  
    {
    _cost = 16;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_riflesquad = DUWS_number_riflesquad + 1;
			  _group setGroupId [format["Rifle squad %1",DUWS_number_riflesquad]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 2:  
    {
    _cost = 18;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_weaponsquad = DUWS_number_weaponsquad + 1;
			  _group setGroupId [format["Wpns squad %1",DUWS_number_weaponsquad]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 3:  
    {
    _cost = 12;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AT");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_at = DUWS_number_at + 1;
			  _group setGroupId [format["AT team %1",DUWS_number_at]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

        case 4:  
    {
    _cost = 15;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam_AA");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_aa = DUWS_number_aa + 1;
			  _group setGroupId [format["AA team %1",DUWS_number_aa]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 5:  
    {
    _cost = 12;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_ReconPatrol");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], [0.9,1]] call BIS_fnc_spawnGroup;  // these have special AI skill range
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_sfteam = DUWS_number_sfteam + 1;
			  _group setGroupId [format["SF team %1",DUWS_number_sfteam]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    
    case 6:  
    {
    _cost = 20;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_ReconTeam");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], [0.9,1]] call BIS_fnc_spawnGroup;  // these have special AI skill range
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_sfsquad = DUWS_number_sfsquad + 1;
			  _group setGroupId [format["SF squad %1",DUWS_number_sfsquad]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 7:  
    {
    _cost = 12;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "SpecOps" >> "BUS_DiverTeam");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], [0.9,1]] call BIS_fnc_spawnGroup;  // these have special AI skill range
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_divers = DUWS_number_divers + 1;
			  _group setGroupId [format["Divers team %1",DUWS_number_divers]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 8:  
    {
    _cost = 8;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_SniperTeam");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], [0.9,1]] call BIS_fnc_spawnGroup;  // these have special AI skill range
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_sniper = DUWS_number_sniper + 1;
			  _group setGroupId [format["Sniper team %1",DUWS_number_sniper]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };

    case 9:  
    {
    _cost = 10;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Support" >> "BUS_Support_CLS");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_medical = DUWS_number_medical + 1;
			  _group setGroupId [format["Medical team %1",DUWS_number_medical]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 10:  
    {
    _cost = 28;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Motorized" >> "BUS_MotInf_Team");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_motor = DUWS_number_motor + 1;
			  _group setGroupId [format["Mot. scouts %1",DUWS_number_motor]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };
    
    case 11:  
    {
    _cost = 46;
    _grouptype = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInfSquad");
         if (commandpointsblu1 >= _cost) then 
             {
              _group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup; 
              player hcsetgroup [_group,""];
              commandpointsblu1 = commandpointsblu1 - _cost;
              ctrlSetText [1000, format["%1",commandpointsblu1]];
			  DUWS_number_meca = DUWS_number_meca + 1;
			  _group setGroupId [format["Mec. squad %1",DUWS_number_meca]];
              hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
             } 
          else 
             {
               hint "Not enough command points";
             };
    };


};


publicVariable "commandpointsblu1";
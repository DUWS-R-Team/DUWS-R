_index = lbCurSel 2102;


_spawnPos = getpos hq_blu1;
_spawnPos = [(_spawnPos select 0)+20, _spawnPos select 1];

switch (_index) do
{
    case 0:  
    {
          if (commandpointsblu1 >= 5) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 5;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MRAP_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

    case 1:  
    {
          if (commandpointsblu1 >= 18) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 18;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MRAP_01_hmg_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };

    case 2:  
    {
          if (commandpointsblu1 >= 25) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 25;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MRAP_01_gmg_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 3:  
    {
          if (commandpointsblu1 >= 35) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 35;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Wheeled_01_cannon_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 4:  
    {
          if (commandpointsblu1 >= 2) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 2;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Truck_01_transport_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 5:  
    {
          if (commandpointsblu1 >= 40) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 40;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Light_01_armed_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 6:  
    {
          if (commandpointsblu1 >= 75) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 75;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Attack_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 7:  
    {
          if (commandpointsblu1 >= 15) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 15;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Light_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 8:  
    {
          if (commandpointsblu1 >= 22) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 22;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Heli_Transport_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };
    };
    
    case 9:  
    {
          if (commandpointsblu1 >= 35) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 35;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_rcws_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
    
    case 10:  
    {
          if (commandpointsblu1 >= 1) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 1;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_Quadbike_01_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
   
    case 11:  
    {
          if (commandpointsblu1 >= 30) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 30;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_AA_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };

    case 12:  
    {
          if (commandpointsblu1 >= 55) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 55;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_MBT_01_cannon_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };
   
    case 13:  
    {
          if (commandpointsblu1 >= 28) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 28;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "B_APC_Tracked_01_CRV_F" createVehicle _spawnPos;
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };   

    case 14:  
    {
          if (commandpointsblu1 >= 2) then 
          {
           hint "Vehicle ready !";
           commandpointsblu1 = commandpointsblu1 - 2;
           ctrlSetText [1000, format["%1",commandpointsblu1]];
           _vehic = "C_Offroad_01_F" createVehicle _spawnPos;
		   sleep 1;
		   _vehic setObjectTexture [0, "#(argb,8,8,3)color(0.141,0.118,0.082,1)"];
		   _vehic animate ["Hidepolice", 1];
		   _vehic animate ["Hideservices", 1];
		   _vehic animate ["Hidebackpacks", 0];
		   _vehic animate ["Hidebumper1", 0];
		   _vehic animate ["Hidebumper2", 0];
		   _vehic animate ["Hideconstruction", 0];
		   _vehic animate ["Hidedoor1", 1];
		   _vehic animate ["Hidedoor2", 1];
		   _vehic animate ["Hidedoor3", 1];
		   _vehic animate ["Hideglass2", 1];
          } 
          else 
          {
          hint "Not enough command points";
          };  
    };  
   
};
publicVariable "commandpointsblu1";
//hint format["index: %1",_index];


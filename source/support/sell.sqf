sell = {
    _veh = vehicle player;
    removeallactions _veh;
    _undoaction = false;
    _veh addAction ["<t color='#00b7ff'>Cancel transaction</t>", {_null = [] call undo; _undoaction = true;}, "", 0, true, true, "", "vehicle _this == _target"];  

    hint "Get out of vehicle to complete transaction or cancel by selecting the new action.";
    
    waituntil {_undoaction || (vehicle player != _veh)};
    
    if (_undoaction) then {
        _undoaction = false;
        _null = [] call undo;
    } else {
        if (_veh iskindof "B_MRAP_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 2.5 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 2.5;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 9 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 5;
               publicvariable "commandpointsblu1";
            };
        };
        
        
        if (_veh iskindof "B_MRAP_01_hmg_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 9 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 9;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 18 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 18;
               publicvariable "commandpointsblu1";
            };
        };
        
        
        if (_veh iskindof "B_MRAP_01_gmg_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 14 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 14;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 25 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 25;
               publicvariable "commandpointsblu1";
            };
        };
        
        
        if (_veh iskindof "B_APC_Wheeled_01_cannon_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 17 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 17;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 35 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 35;
               publicvariable "commandpointsblu1";
            };
        };
        
        
        if (_veh iskindof "B_Truck_01_transport_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 1 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 1;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 2 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 2;
               publicvariable "commandpointsblu1";
            };
        };
        
        
        if (_veh iskindof "B_Heli_Light_01_armed_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 17 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 17;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 35 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 35;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_Heli_Attack_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 22 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 22;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 45 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 45;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_Heli_Light_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 7.5 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 7.5;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 15 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 15;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_Heli_Transport_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 11 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 11;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 22 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 22;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_APC_Tracked_01_rcws_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 17.5 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 17.5;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 35 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 35;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_Quadbike_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding .5 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + .5;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 1 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 1;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_APC_Tracked_01_AA_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 15 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 15;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 30 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 30;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_MBT_01_cannon_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 27.5 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 27.5;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 55 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 55;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "B_APC_Tracked_01_CRV_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 14 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 14;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 28 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 28;
               publicvariable "commandpointsblu1";
            };
        };
        
        if (_veh iskindof "C_Offroad_01_F") then {
            if (_veh gethit "motor" > 0.7) then {
               hint "Engine damaged. Adding 1 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 1;
               publicvariable "commandpointsblu1";
            } else {
               hint "Vehicle is fine. Adding 2 CP";
               deletevehicle _veh;            
               commandpointsblu1 = commandpointsblu1 + 2;
               publicvariable "commandpointsblu1";
            };
        };
    };
};

undo = {
    hint "Get in another vehicle if you wish to sell it.";
    waituntil {(vehicle player != player)};

    _veh = vehicle player;
    _veh addAction ["<t color='#00b7ff'>Sell this vehicle</t>", {_null = [] call sell;}, "", 0, true, true, "", "vehicle _this == _target"];
};

hint "Enter the vehicle you wish to sell";

waituntil {(vehicle player != player)};

_veh = vehicle player;
_veh addAction ["<t color='#00b7ff'>Sell this vehicle</t>", {_null = [] call sell;}, "", 0, true, true, "", "vehicle _this == _target"];
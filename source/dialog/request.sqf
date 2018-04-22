_handle = createDialog "ressourceheader";
waitUntil {dialog};
ctrlSetText [1000, format["%1",commandpointsblu1]];
ctrlSetText [1001, format["%1",zoneundercontrolblu]];
ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];

// UNITS
_index = lbAdd [2100, "Rifleman(2CP)"];                  // 0
_index = lbAdd [2100, "Grenadier(3CP)"];                 // 1
_index = lbAdd [2100, "Automatic Rifleman(3CP)"];        // 2
_index = lbAdd [2100, "AT Rifleman(3CP)"];               // 3
_index = lbAdd [2100, "Medic(4CP)"];                     // 4
_index = lbAdd [2100, "AA Specialist(4CP)"];             // 5
_index = lbAdd [2100, "Repair Specialist(4CP)"];         // 6
_index = lbAdd [2100, "AT Specialist(4CP)"];             // 7
_index = lbAdd [2100, "SF Diver(3CP)"];                  // 8
_index = lbAdd [2100, "Marksman(3CP)"];                  // 9
_index = lbAdd [2100, "Sniper(4CP)"]; 	                 // 10
_index = lbAdd [2100, "Spotter(3CP)"];                   // 11
_index = lbAdd [2100, "Explosive specialist(4CP)"];      // 12

lbSetCurSel [2100, 0];

// SQUADS
_index0 = lbAdd [2101, "Fireteam(8CP)"];                   // 0
_index0 = lbAdd [2101, "Rifle Squad(16CP)"];               // 1
_index0 = lbAdd [2101, "Weapons Squad(18CP)"];             // 2
_index0 = lbAdd [2101, "AT Team(12CP)"];                   // 3
_index0 = lbAdd [2101, "AA Team(15CP)"];                   // 4
_index0 = lbAdd [2101, "SF Recon Team(12CP)"];             // 5
_index0 = lbAdd [2101, "SF Recon Squad(20CP)"];            // 6
_index0 = lbAdd [2101, "Divers Team(12CP)"];               // 7
_index0 = lbAdd [2101, "Sniper Team(8CP)"];                // 8
_index0 = lbAdd [2101, "Medical Team(10CP)"];              // 9
_index0 = lbAdd [2101, "Motorized scouts(28CP)"];          // 10
_index0 = lbAdd [2101, "Mechanized squad(46CP)"];          // 11
lbSetCurSel [2101, 0];

// VEHICLES
_index1 = lbAdd [2102, "Small Transport Truck 1 (seats 6 - 4CP)"];       // 0
_index1 = lbAdd [2102, "Small Transport Truck 2 (seats 9 - 6CP)"];       // 1
_index1 = lbAdd [2102, "Prowler Unarmed (5CP)"];                         // 2
_index1 = lbAdd [2102, "Prowler Armed (13CP)"];                          // 3
_index1 = lbAdd [2102, "Hunter Unarmed(5CP)"];                           // 4
_index1 = lbAdd [2102, "Hunter HMG(18CP)"];                              // 5
_index1 = lbAdd [2102, "Hunter GMG(25CP)"];                              // 6
_index1 = lbAdd [2102, "AMV-7 Marshall(35CP)"];                          // 7
_index1 = lbAdd [2102, "HEMTT Transport Covered(8CP)"];                  // 8
_index1 = lbAdd [2102, "AH-9 Pawnee (25CP)"];                            // 9
_index1 = lbAdd [2102, "AH-99 Blackfoot(45CP)"];                         // 10
_index1 = lbAdd [2102, "MH-9 Hummingbird(15CP)"];                        // 11
_index1 = lbAdd [2102, "M-900 Civilian Copter(12CP)"];                   // 12
_index1 = lbAdd [2102, "Mi-290Black Taru Sling(18CP)"];                  // 13
_index1 = lbAdd [2102, "UH-80 Ghosthawk(22CP)"];                         // 14
_index1 = lbAdd [2102, "CH-67 Huron(26CP)"];                             // 15
_index1 = lbAdd [2102, "IFV-6c Panther(25CP)"];                          // 16
_index1 = lbAdd [2102, "ATV(1CP)"];                                      // 17
_index1 = lbAdd [2102, "IFV-6c Cheetah(30CP)"];                          // 18
_index1 = lbAdd [2102, "M2A1 Slammer(40CP)"];                            // 19
_index1 = lbAdd [2102, "CRV-6e Bobcat(28CP)"];                           // 20
_index1 = lbAdd [2102, "SF SUV(2CP)"];                                   // 21
_index1 = lbAdd [2102, "MLRS Artillary (75CP)"];                         // 22
_index1 = lbAdd [2102, "Scorcher Artillary (75CP)"];                     // 23
_index1 = lbAdd [2102, "Fuel Truck (10CP)"];                             // 24
_index1 = lbAdd [2102, "BUY ONLY AT AIRPORTS A-164 CAS(45CP)"];          // 25
_index1 = lbAdd [2102, "M2A4 SlammerUP(40CP)"];                          // 26
_index1 = lbAdd [2102, "Stomper RCWS Autonomous(20CP)"];                 // 27
_index1 = lbAdd [2102, "Stomper Autonomous Recon(10CP)"];                // 28
_index1 = lbAdd [2102, "UAV GreyHawk w/ATG Missiles(15CP)"];             // 29
_index1 = lbAdd [2102, "UAV GreyHawk w/Bombs(15CP)"];                    // 30
_index1 = lbAdd [2102, "UAV VTOL Falcon (60CP)"];                        // 31
_index1 = lbAdd [2102, "UAV Darter(5CP)"];                               // 32
_index1 = lbAdd [2102, "Blackfish Infantry (40CP)"];                     // 33
_index1 = lbAdd [2102, "Blackfish Vehicle (45CP)"];                      // 34
_index1 = lbAdd [2102, "Blackfish Armed (60CP)"];                        // 35
_index1 = lbAdd [2102, "Black Wasp II (50CP)"];                             // 36
_index1 = lbAdd [2102, "Black Wasp II (Stealth) (60CP)"];                   // 37
_index1 = lbAdd [2102, "Rhino MGS (40CP)"];                                 // 38
_index1 = lbAdd [2102, "Rhino MGS UP (42CP)"];                              // 39
lbSetCurSel [2102, 0];

// Supports  !!! CHECK TO ADD AT INIT
index_support_supply = lbAdd [2103, "Supply drop(5CP)"];                      // 0
index_support_arty = lbAdd [2103, "Artillery strike(20CP)"];                  // 1
index_support_mortar = lbAdd [2103, "Mortar strike(10CP)"];                   // 2
index_support_paradrop = lbAdd [2103, "Airborne troops(20CP)"];               // 3
index_support_jdam = lbAdd [2103, "JDAM strike(15CP)"];                       // 4
index_support_armory = lbAdd [2103, "Armory(8CP)"];                           // 5
index_support_pFLIR = lbAdd [2103, "Personal FLIR display(20CP)"];            // 6
index_support_uavrecon = lbAdd [2103, "UAV Recon(10CP)"];                     // 7
index_support_refit = lbAdd [2103, "Vehicle Refit(3CP)"];                     // 8
index_support_helotaxi = lbAdd [2103, "Helicopter Taxi(3CP)"];                // 9
index_support_cluster = lbAdd [2103, "Mk.20 II CBU(25CP)"];                   // 10
index_support_training = lbAdd [2103, "Specialized Infantry training(20CP)"]; // 11
index_support_boattaxi = lbAdd [2103, "Boat Taxi(2CP)"];                      // 12

//  lbSetCurSel [2103, 0];
if (support_supplydrop_available) then {
    lbSetColor [2103, 0, [0, 1, 0, 1]];
};
if (support_arty_available) then {
    lbSetColor [2103, 1, [0, 1, 0, 1]];
};
if (support_mortar_available) then {
    lbSetColor [2103, 2, [0, 1, 0, 1]];
};
if (support_paradrop_available) then {
    lbSetColor [2103, 3, [0, 1, 0, 1]];
};
if (support_jdam_available) then {
    lbSetColor [2103, 4, [0, 1, 0, 1]];
};
if (support_armory_available) then {
    lbSetColor [2103, 5, [0, 1, 0, 1]];
};
if (support_pflir_available) then {
    lbSetColor [2103, 6, [0, 1, 0, 1]];
};
if (support_uav_recon_available) then {
    lbSetColor [2103, 7, [0, 1, 0, 1]];
};
if (support_veh_refit_available) then {
    lbSetColor [2103, 8, [0, 1, 0, 1]];
};
if (support_helotaxi_available) then {
    lbSetColor [2103, 9, [0, 1, 0, 1]];
};
if (support_cluster_available) then {
    lbSetColor [2103, 10, [0, 1, 0, 1]];
};
if (support_specialized_training_available) then {
    lbSetColor [2103, 11, [0, 1, 0, 1]];
};
if (support_boattaxi_available) then {
    lbSetColor [2103, 12, [0, 1, 0, 1]];
};

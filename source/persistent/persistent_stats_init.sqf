

mission_array_of_islands_captured = profileNamespace getVariable "profile_array_of_islands_captured"; // Choppe la variable profile_array_of_islands_captured si elle existe

if (isNil {mission_array_of_islands_captured}) then { // si array_of_islands_captured n'existe pas --> la variable n'a pas encore été init.
profileNamespace setVariable ["profile_array_of_islands_captured", []]; // Crée l'array profile_array_of_islands_captured dans profileNamespace
saveProfileNamespace; // Sauvegarde la variable dans le profil
mission_array_of_islands_captured = profileNamespace getVariable "profile_array_of_islands_captured"; // Choppe la variable profile_array_of_islands_captured maintenant qu'elle a été crée
};   // fin de création de profile_array_of_islands_captured, 
     // mission_array_of_islands_captured a été appellé dans la mission.



mission_number_of_zones_captured = profileNamespace getVariable "profile_number_of_zones_captured";

if (isNil {mission_number_of_zones_captured}) then { 
profileNamespace setVariable ["profile_number_of_zones_captured", 0]; 
saveProfileNamespace;
mission_number_of_zones_captured = profileNamespace getVariable "profile_number_of_zones_captured";
};  


mission_number_of_missions_done = profileNamespace getVariable "profile_number_of_missions_done";

if (isNil {mission_number_of_missions_done}) then { 
profileNamespace setVariable ["profile_number_of_missions_done", 0]; 
saveProfileNamespace;
mission_number_of_missions_done = profileNamespace getVariable "profile_number_of_missions_done";
};     


mission_DUWS_firstlaunch = profileNamespace getVariable "profile_DUWS_firstlaunch";

if (isNil {mission_DUWS_firstlaunch}) then { 
profileNamespace setVariable ["profile_DUWS_firstlaunch", true]; 
saveProfileNamespace;
mission_DUWS_firstlaunch = profileNamespace getVariable "profile_DUWS_firstlaunch";
};      

// TOUTES LES VARIABLES PERSISTANCES ON ETE APPELLES ET MISES DANS LA MISSION


// Lance l'init de l'xp
_handle = [] execVM "persistent\experience\experience_init.sqf";
waitUntil {scriptDone _handle};

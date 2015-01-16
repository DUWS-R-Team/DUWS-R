
 

          waitUntil {sleep 2; experience_total>=5};          
          _handle = [player] execVM "persistent\experience\experience_ability_stamina.sqf";
          ["new_ability",["New ability: Enhanced Conditionning","Boost your endurance, evade and escape ennemies"]] call bis_fnc_showNotification; 
          ["new_ability",["Abilities","More info on abilities inside the briefing"]] call bis_fnc_showNotification;
          _index = player createDiarySubject ["abilities_info","Abilities"]; 
          player createDiaryRecord ["abilities_info", ["Abilities", "Each time you will earn a new ability, a new entry will appear inside this tab and you'll be able to read its description. Access the abilities with the radio menu (0-0)."]];
          player createDiaryRecord ["abilities_info", ["Enhanced Conditionning", "<font color='#FF0000'>Cooldown: 180 seconds</font color><br />Description:<br />When activated through the radio menu, you get a 20 seconds boost where you can run, sprint up mountains and aim without any effect on your stamina. Use this to quickly evade ennemies or for quick exfiltration."]];


         if (!isMultiplayer) then {                                           
          waitUntil {sleep 2; experience_total>=15};          
          _handle = [player] execVM "persistent\experience\experience_ability_slowtime.sqf"; 
          ["new_ability",["New ability: Quick Reflexes","Slow down time, take your shot"]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Quick Reflexes", "<font color='#FF0000'>Cooldown: 5 minutes</font color><br />Description:<br />When activated through the radio menu, the time is slowed down for around 12 seconds, allowing you to clear rooms, compound or kill in a brief amount of tyme a group of ennemies."]];
		 };




          waitUntil {sleep 2; experience_total>=25};          
          _handle = [player] execVM "persistent\experience\experience_ability_heal.sqf"; 
          ["new_ability",["New ability: Field Surgery","You are really hard to kill, you know that ?"]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Field Surgery", "<font color='#FF0000'>Cooldown: 20 minutes</font color><br />Description:<br />When activated through the radio menu, you will be fully healed after a short period of time"]];
          
		 waitUntil {sleep 2; experience_total>=30};          
          _handle = [player] execVM "persistent\experience\experience_ability_fieldcomm.sqf"; 
          ["new_ability",["New ability: Field Commander","Leading the way"]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Field Commander", "<font color='#FF0000'>Cooldown: N/A</font color><br />Description:<br />You can now access the squad manager when you want."]];
                      
          
          
          waitUntil {sleep 2; experience_total>=35};          
          _handle = [player] execVM "persistent\experience\experience_ability_warrior.sqf"; 
          ["new_ability",["New ability: Veteran Instinct","I think I saw someone around this corner..."]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Veteran Instinct", "<font color='#FF0000'>Cooldown: 10 minutes</font color><br />Description:<br />When activated through the radio menu, for 60 seconds you will know if the zone in a radius of 50 meters around you is clear of enemies or not."]];
          
          waitUntil {sleep 2; experience_total>=45};          
          _handle = [player] execVM "persistent\experience\experience_ability_refit.sqf"; 
          ["new_ability",["New ability: Field Repair","Did someone say MacGyver ?"]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Field Repair", "<font color='#FF0000'>Cooldown: 1 hour</font color><br />Description:<br />When activated through the radio menu, the vehicle in wich you are inside will be repaired, and a little bit of fuel added."]];
                    
          waitUntil {sleep 2; experience_total>=55};          
          _handle = [player] execVM "persistent\experience\experience_ability_logistic.sqf"; 
          ["new_ability",["New ability: Logistic Support","They're sending lots of ressources your way"]] call bis_fnc_showNotification;
          player createDiaryRecord ["abilities_info", ["Logistic Support", "<font color='#FF0000'>Cooldown: 15 minutes (passive)</font color><br />Description:<br />This passive ability gives you +1 command point every 15 minutes."]];
                      
          
          
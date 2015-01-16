_loop = true;

waitUntil {chosen_settings};
sleep 1800;

while {_loop} do  
{
waitUntil {daytime < 1 or daytime > 2};
playmusic "wasteland";

waitUntil {daytime > 2};
playmusic "fallout";

waitUntil {daytime > 4};
playmusic "Track11_StageB_stealth";

waitUntil {daytime > 7};
playMusic "Track09_Night_percussions";

waitUntil {daytime > 9};
playMusic "BackgroundTrack01a_F";

waitUntil {daytime > 12};
playMusic "LeadTrack01_F_EPA";



waitUntil {daytime > 16};
playMusic "LeadTrack02_F";
};





 
_timer = 60;
clicked = false;

// Guard against calling UAV Recon too often
if(support_uav_recon_timeout > 0) exitWith {
    ["info",["Support is on Cooldown",format ["UAV Recon will be ready in %1 seconds", support_uav_recon_timeout]]] call bis_fnc_showNotification;
};

// IF NOT ENOUGH PTS
if (commandpointsblu1<3) exitWith {
    ["info",["Not enough command points","Not enough Command Points (3CP required)"]] call bis_fnc_showNotification;
};

hint "Click on your map to scan a location using the UAV";
OnMapSingleClick "_null = [_pos,500] spawn duws_fnc_uav_map;clicked=true;onMapSingleClick ''; hint 'Coordinates received'";

// TIMER
while {_timer>0 AND !clicked} do {

_timer = _timer-1; // remove 1 to timer
sleep 1;
};

// TIMER ELAPSED OR CLICKED
OnMapSingleClick "";

// Tick down timeout guard
support_uav_recon_timeout = 80;
while {support_uav_recon_timeout > 0} do {
    sleep 1;
    support_uav_recon_timeout = support_uav_recon_timeout - 1;
    publicVariable "support_uav_recon_timeout";
};
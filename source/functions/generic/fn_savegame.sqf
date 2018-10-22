{deleteVehicle _x} forEach allDeadMen;
{_x setdammage 0} forEach units group player;
player setdammage 0;

if (isServer) then {
    skiptime 6;
    sleep 0.3;
    saveGame;

    hint "You and your squad members have been fully healed";
    savegameNumber = savegameNumber + 1;
    publicVariable "savegameNumber";

    sleep 2;
    [] call duws_fnc_bottom_right_message;
};
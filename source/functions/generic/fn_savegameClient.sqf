[6, true, true] call BIS_fnc_setDate;
player setdammage 0;
{_x setdammage 0} forEach units group player;
hint "You and your squad members have been fully healed";

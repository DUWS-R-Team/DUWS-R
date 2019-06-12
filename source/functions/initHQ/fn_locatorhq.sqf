_found = false;
_foundSafePos = [];
player globalChat "recherche zone";
while {!_found} do {
    _foundSafePos = [center_of_map, 0,half_of_map,5,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
    if (_foundSafePos select 0 != 0 && _foundSafePos select 1 != 0) then {_found=true;};
};
player globalChat format ["foundSafePos: %1", _foundSafePos];
_handle = [_foundSafePos] spawn duws_fnc_BluHQinit;
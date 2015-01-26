if (count Array_of_FOBname < 1) exitWith {hint "You don't have any FOB's"};
_array_of_fobs_list = [];  // init the array of fobs
_list = [];
_array_for_stratmap = [];

_index = -1;
{
    _array_of_fobs_list = _array_of_fobs_list + [[getpos _x]]; // add the FOB (pos) into a nested array

    _index = _index + 1;
    _array_of_fobs_list_selected = _array_of_fobs_list select _index; // select the current array inside _array_of_fobs_list

    _actual_fobname = Array_of_FOBname select _index;
    _array_of_fobs_list_selected = _array_of_fobs_list_selected + [_actual_fobname];

    _list = _list + [_array_of_fobs_list_selected];
} forEach Array_of_FOBS;

{
    _fobpos = _x select 0;
    _fobname = _x select 1;
    _fob_fobname = "FOB " + _fobname;

    _actual_array = [_fobpos,
        {_handle = [_fobpos] execVM "initHQ\teleport.sqf";},
        _fob_fobname,
        format["Fast travel to %1",_fob_fobname],
        "",
        "\a3\ui_f\data\gui\cfg\hints\Waypoint_ca.paa",
        0.5,
        []
    ];
    _array_for_stratmap = _array_for_stratmap + [_actual_array];
} forEach _list;

// -------****- NOW OPEN THE MAP
_isNight = false;
if ((20 < daytime) OR (daytime < 5)) then {_isNight=true};

[
    (findDisplay 46),            // 0: DISPLAY - parent display. When empty, mission display is used.
    getpos player,               // 1: ARRAY - default view position in format [x,y,y] or [x,y]
    _array_for_stratmap,         // 2: ARRAY - list of missions in format:
    [],                          // 3: ARRAY - list of ORBAT groups in format:
    [],                          // 4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
    [],                          // 5: ARRAY - list of custom images in format:
    1,                           // 6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
    _isNight                     // 7: BOOL - true for night version of strategic map (darker with blue tone)
] call BIS_fnc_strategicMapOpen;
// https://community.bistudio.com/wiki/BIS_fnc_StrategicMapOpen
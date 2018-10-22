private _request_group_cases_string = "";
private _skillSF = [0.9,1];
private _skill = blufor_ai_skill;

{
    _cfgGroup = _x select 1;
    _cost = _x select 0;
    _indexNumber = blufor_cfgGroup_array find _x;
    _request_group_cases_string = _request_group_cases_string + format ['
        case %1: {
        if (commandpointsblu1 >= %2) then {
                commandpointsblu1 = commandpointsblu1 - %2;
                ctrlSetText [1000, str commandpointsblu1];
                _group = group player ;
                _group = [_spawnPos, WEST, %3, [], [], %4] call BIS_fnc_spawnGroup;
                player hcsetgroup [_group,""];
                hint "Squad ready !\nAccess it with [L.CTRL - SPACE]";
            }  else  {
                hint "Not enough command points";
            };
        };
    ',
    _indexNumber, 
    _cost, 
    [[[_cfgGroup], ""] call BIS_fnc_configPath, "", true] call BIS_fnc_configPath, 
    if (!isnil "_skillBoolean" && {_skillBoolean}) then {_skillSF} else {_skill}];
}
forEach blufor_cfgGroup_array;

requestGroupCases = compileFinal _request_group_cases_string;
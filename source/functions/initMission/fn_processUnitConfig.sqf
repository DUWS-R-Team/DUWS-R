private _request_unit_cases_string = "";
private _skillSF = (blufor_ai_skill select 0) + 0.5;
private _skill = (blufor_ai_skill select 0) + 0.2;

{
    _unit = _x select 0;
    _cost = _x select 1;
    _skillBoolean = _x select 2;
    _indexNumber = blufor_unit_array find _x;
    _request_unit_cases_string = _request_unit_cases_string + format ['
        case %1: {
        if (commandpointsblu1 >= %2) then {
                hint "Unit ready !";
                commandpointsblu1 = commandpointsblu1 - %2;
                ctrlSetText [1000, str commandpointsblu1];
                _group = group player ;
                "%3" createUnit [_spawnpos, _group, "", %4, "private"] ;
            }  else  {
                hint "Not enough command points";
            };
        };
    ',_indexNumber, _cost, _unit, if (!isnil "_skillBoolean" && {_skillBoolean}) then {_skillSF} else {_skill}];
}
forEach blufor_unit_array;

requestUnitCases = compileFinal _request_unit_cases_string;
_requiredPoints = _this select 0;
_vehicleType = _this select 1;

if (commandpointsblu1 >= _requiredPoints) then {
    commandpointsblu1 = commandpointsblu1 - 4;
    ctrlSetText [1000, format["%1",commandpointsblu1]];
    _spawnPos = (getpos hq_blu1) findEmptyPosition [40, 120, _vehicleType];
    _spawnPos = [(_spawnPos select 0), _spawnPos select 1];
    vehic = _vehicleType createVehicle _spawnPos;

    if(unitIsUAV vehic) then {
        createVehicleCrew vehic;
    };

    if(vehic isKindOf "Tank") then {

    };

    if(vehic isKindOf "Wheeled_APC") then {

    };

    hint "Vehicle ready !";
} else {
    hint "Not enough command points";
};

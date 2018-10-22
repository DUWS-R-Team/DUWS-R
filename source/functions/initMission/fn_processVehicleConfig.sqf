//Dynamically creates cases for duws_fnc_request

private _request_vehicle_cases_string = "";

{
	_vehicle = _x select 0;
	_cost = _x select 1;
	_indexNumber = blufor_vehicle_array find _x;
	_request_vehicle_cases_string = _request_vehicle_cases_string + format ['
		case %1: {
		[%2,"%3"] call duws_fnc_spawnVehicle;
		};
	',_indexNumber, _vehicle, _cost];
} foreach blufor_vehicle_array;

requestVehicleCases = compileFinal _request_vehicle_cases_string;
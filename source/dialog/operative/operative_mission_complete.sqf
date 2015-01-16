// update the values of the array
{
_selected_soldier_aim = _x select 0;
_selected_soldier_reflexes = _x select 1;
_selected_soldier_spotting = _x select 2;
_selected_soldier_courage = _x select 3;
_selected_soldier_comms = _x select 4;
_selected_soldier_reload = _x select 5;

// generate the new skills
_selected_soldier_aim_new = _selected_soldier_aim + ((round (random 5))/100);
_selected_soldier_reflexes_new = _selected_soldier_reflexes + ((round (random 5))/100);
_selected_soldier_spotting_new = _selected_soldier_spotting + ((round (random 5))/100);
_selected_soldier_courage_new = _selected_soldier_courage + ((round (random 5))/100);
_selected_soldier_comms_new = _selected_soldier_comms + ((round (random 5))/100);
_selected_soldier_reload_new = _selected_soldier_reload + ((round (random 5))/100);

// make sure it doesn't go above 100
if (_selected_soldier_aim_new > 1) then {_selected_soldier_aim_new = 1};
if (_selected_soldier_reflexes_new > 1) then {_selected_soldier_reflexes_new = 1};
if (_selected_soldier_spotting_new > 1) then {_selected_soldier_spotting_new = 1};
if (_selected_soldier_courage_new > 1) then {_selected_soldier_courage_new = 1};
if (_selected_soldier_comms_new > 1) then {_selected_soldier_comms_new = 1};
if (_selected_soldier_reload_new > 1) then {_selected_soldier_reload_new = 1};

// update the list
_x set [0,_selected_soldier_aim_new];
_x set [1,_selected_soldier_reflexes_new];
_x set [2,_selected_soldier_spotting_new];
_x set [3,_selected_soldier_courage_new];
_x set [4,_selected_soldier_comms_new];
_x set [5,_selected_soldier_reload_new];
} forEach duws_operator_list;

// update the skill of the squad members
{
_selected_soldier_aim = _x skill "aimingAccuracy";
_selected_soldier_aim_2 = _x skill "aimingShake";
_selected_soldier_reflexes = _x skill "aimingSpeed";
_selected_soldier_spotting = _x skill "spotDistance";
_selected_soldier_spotting_2 = _x skill "spotTime";
_selected_soldier_courage = _x skill "courage";
_selected_soldier_reload = _x skill "reloadSpeed";
_selected_soldier_comms = _x skill "commanding";

_selected_soldier_aim_new = _selected_soldier_aim + ((round (random 5))/100);
_selected_soldier_aim_new_2 = _selected_soldier_aim_2 + ((round (random 5))/100);
_selected_soldier_reflexes_new = _selected_soldier_reflexes + ((round (random 5))/100);
_selected_soldier_spotting_new = _selected_soldier_spotting + ((round (random 5))/100);
_selected_soldier_spotting_new_2 = _selected_soldier_spotting_2 + ((round (random 5))/100);
_selected_soldier_courage_new = _selected_soldier_courage + ((round (random 5))/100);
_selected_soldier_comms_new = _selected_soldier_comms + ((round (random 5))/100);
_selected_soldier_reload_new = _selected_soldier_reload + ((round (random 5))/100);

_x setskill ["aimingAccuracy",_selected_soldier_aim_new];
_x setskill ["aimingShake",_selected_soldier_aim_new_2];
_x setskill ["aimingSpeed",_selected_soldier_reflexes_new];
_x setskill ["spotDistance",_selected_soldier_spotting_new];
_x setskill ["spotTime",_selected_soldier_spotting_new_2];
_x setskill ["courage",_selected_soldier_courage_new];
_x setskill ["reloadSpeed",_selected_soldier_comms_new];
_x setskill ["commanding",_selected_soldier_reload_new];

} forEach units group player; 

// now add spendable points to "OPERATIVE" operators
{
_status = _x select 7;
	if (_status == "Operating") then {
	_spendable_pts = _x select 13;
	_spendable_pts_new = _spendable_pts + 10;
	_x set [13,_spendable_pts_new];
	};
} forEach duws_operator_list;

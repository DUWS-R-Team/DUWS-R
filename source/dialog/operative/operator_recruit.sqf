_selected_soldier = duws_operator_list select lbCurSel 1500;
_selected_soldier_index = lbCurSel 1500;

_selected_soldier_aim = _selected_soldier select 0;
_selected_soldier_reflexes = _selected_soldier select 1;
_selected_soldier_spotting = _selected_soldier select 2;
_selected_soldier_courage = _selected_soldier select 3;
_selected_soldier_comms = _selected_soldier select 4;
_selected_soldier_reload = _selected_soldier select 5;

_selected_soldier_status = _selected_soldier select 7;
_selected_soldier_name = _selected_soldier select 8;
_selected_soldier_identity = _selected_soldier select 9;
_selected_soldier_class = _selected_soldier select 10;
_selected_soldier_headgear = _selected_soldier select 11;

_proceed = true;

switch (_selected_soldier_status) do
{
  case "Ready": {
	if (commandpointsblu1<5) exitWith {_proceed = false;};
	commandpointsblu1 = commandpointsblu1 - 5;
  };

  case "Healed": {
	if (commandpointsblu1<2) exitWith {_proceed = false;};
	commandpointsblu1 = commandpointsblu1 - 2;
  };  
};
if (!_proceed) exitWith {hint "You don't have enough Command Points"};

_soldier = group player createUnit [_selected_soldier_class, [getpos hq_blu1 select 0, (getpos hq_blu1 select 1)+20], [], 0, "FORM"];
removeGoggles _soldier;
_soldier setidentity _selected_soldier_identity;

_soldier setskill ["aimingAccuracy",_selected_soldier_aim];
_soldier setskill ["aimingShake",_selected_soldier_aim];
_soldier setskill ["aimingSpeed",_selected_soldier_reflexes];
_soldier setskill ["spotDistance",_selected_soldier_spotting];
_soldier setskill ["spotTime",_selected_soldier_spotting];
_soldier setskill ["courage",_selected_soldier_courage];
_soldier setskill ["reloadSpeed",_selected_soldier_reload];
_soldier setskill ["commanding",_selected_soldier_comms];

removeheadgear _soldier;
_soldier addHeadgear _selected_soldier_headgear;


 

_selected_index = lbCurSel 1500;
lbSetColor [1500, _selected_index, [0, 1, 0, 1]];

duws_operator_list select lbCurSel 1500 set [7,"Operating"];
ctrlSetText [1013, format["%1",_selected_soldier_status]];

buttonSetAction [1601, "hint ""This operative is already active in this theatre of operation"""]; 
ctrlSetText [1601, "ALREADY DEPLOYED"];	




// wait until the operator is dead
waitUntil {sleep 2; !alive _soldier}; 

_soldier_timeheal = 1200 + (random 3600);
duws_operator_list select _selected_soldier_index set [12,_soldier_timeheal];
duws_operator_list select _selected_soldier_index set [7,"Injured"];

// the timer
for [{_timer=_soldier_timeheal}, {_timer>0}, {_timer=_timer-1}] do
{
    duws_operator_list select _selected_soldier_index set [12,_timer];
	sleep 1;
};
// soldier is healed
duws_operator_list select _selected_soldier_index set [12,0];
duws_operator_list select _selected_soldier_index set [7,"Healed"];
["operator_healed",[_selected_soldier_name]] call bis_fnc_showNotification;
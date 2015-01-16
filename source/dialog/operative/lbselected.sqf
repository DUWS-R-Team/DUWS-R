_selected_index = lbCurSel 1500;

_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index

// extract the skill value and do x100
_selected_soldier_aim = (_selected_soldier select 0)*100;
_selected_soldier_reflexes = (_selected_soldier select 1)*100;
_selected_soldier_spotting = (_selected_soldier select 2)*100;
_selected_soldier_courage = (_selected_soldier select 3)*100;
_selected_soldier_comms = (_selected_soldier select 4)*100;
_selected_soldier_reload = (_selected_soldier select 5)*100;
_selected_soldier_spendable_pts = (_selected_soldier select 13);


_selected_soldier_timeheal = round ((_selected_soldier select 12)/60);


_selected_soldier_role = _selected_soldier select 6;
_selected_soldier_status = _selected_soldier select 7;

 ctrlSetText [1006, format["%1",_selected_soldier_aim]];
 ctrlSetText [1007, format["%1",_selected_soldier_reflexes]];
 ctrlSetText [1008, format["%1",_selected_soldier_spotting]];
 ctrlSetText [1009, format["%1",_selected_soldier_courage]];
 ctrlSetText [1010, format["%1",_selected_soldier_comms]];
 ctrlSetText [1011, format["%1",_selected_soldier_reload]];
 
 ctrlSetText [1017, format["%1",_selected_soldier_spendable_pts]];

 ctrlSetText [1014, format["%1",_selected_soldier_role]];
 ctrlSetText [1013, format["%1",_selected_soldier_status]];
 ctrlSetText [1016, format["%1 minutes",_selected_soldier_timeheal]];
 

switch (_selected_soldier_status) do
{
  case "Ready": {
	buttonSetAction [1601, "execVM 'dialog\operative\operator_recruit.sqf'"];
	ctrlSetText [1601, "DEPLOY (5 CP)"];
  };
  
  case "Injured": {
	buttonSetAction [1601, "hint ""You can't deploy this operative, he must be fully healed first"""]; 
	ctrlSetText [1601, "CANNOT DEPLOY"];	
  };
  
  case "Operating": {
	buttonSetAction [1601, "hint ""This operative is already active in this theatre of operation"""]; 
	ctrlSetText [1601, "ALREADY DEPLOYED"];	
  };
  
  case "Healed": {
	buttonSetAction [1601, "execVM 'dialog\operative\operator_recruit.sqf'"]; 
	ctrlSetText [1601, "REDEPLOY (2 CP)"];	
  };  
};



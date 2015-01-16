
class operativemaingui
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.063, #Kozezi)
////////////////////////////////////////////////////////
class background_operative: RscText
{
	idc = 1018;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 34.5 * GUI_GRID_W;
	h = 16.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};
class operative_main_frame: RscFrame
{
	idc = 1800;
	text = "Recruit special operatives"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 33.5 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class operative_exit_button: RscButton
{
	idc = 1600;
	text = "EXIT"; //--- ToDo: Localize;
	x = 30.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0";
};
class operative_recruit_button: RscButton
{
	idc = 1601;
	text = "DEPLOY (X CP)"; //--- ToDo: Localize;
	x = 17.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Add this operative to your squad"; //--- ToDo: Localize;
};
class operative_info_button: RscButton
{
	idc = 1602;
	text = "INFO"; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = ""; //--- ToDo: Localize;
	action = "hint ""Open your map and read the ''Special operatives'' tab for more informations about operatives""";	
};
class operative_listbox: RscListbox
{
	idc = 1500;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
	onLBSelChanged  = "execVM 'dialog\operative\LBselected.sqf'"; //UI event handler		
};
class operative_skill_frame: RscFrame
{
	idc = 1801;
	text = "Skills"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class operative_aim_txt: RscText
{
	idc = 1000;
	text = "Aiming:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "General accuracy of the operative with weapons"; //--- ToDo: Localize;
};
class operative_spot_txt: RscText
{
	idc = 1001;
	text = "Spotting:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "General spotting skill of the operative"; //--- ToDo: Localize;
};
class operative_courage_txt: RscText
{
	idc = 1002;
	text = "Courage:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Morale of the operative"; //--- ToDo: Localize;
};
class operative_communications_txt: RscText
{
	idc = 1003;
	text = "Communications: "; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Affects how quickly recognized targets are shared with the group"; //--- ToDo: Localize;
};
class operative_reflexes_txt: RscText
{
	idc = 1004;
	text = "Reflexes:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Affects how quickly the operative can rotate and stabilize its aim"; //--- ToDo: Localize;
};
class operative_reload_txt: RscText
{
	idc = 1005;
	text = "Reload speed:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "How quickly the operative reload and switch weapons"; //--- ToDo: Localize;
};
class operative_aiming_value: RscText
{
	idc = 1006;
	text = "xxx"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "General accuracy of the operative with weapons"; //--- ToDo: Localize;
};
class operative_reflexes_value: RscText
{
	idc = 1007;
	text = "xxx"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Affects how quickly the operative can rotate and stabilize its aim"; //--- ToDo: Localize;
};
class operative_spotting_value: RscText
{
	idc = 1008;
	text = "xxx"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "General spotting skill of the operative"; //--- ToDo: Localize;
};
class operative_courage_value: RscText
{
	idc = 1009;
	text = "xxx"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Morale of the operative"; //--- ToDo: Localize;
};
class operative_communications_value: RscText
{
	idc = 1010;
	text = "xxx"; //--- ToDo: Localize;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Affects how quickly recognized targets are shared with the group"; //--- ToDo: Localize;
};
class operative_reload_value: RscText
{
	idc = 1011;
	text = "xxx"; //--- ToDo: Localize;
	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "How quickly the operative reload and switch weapons"; //--- ToDo: Localize;
};
class operative_role_frame: RscFrame
{
	idc = 1802;
	text = "Role"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
};
class operative_status_frame: RscFrame
{
	idc = 1803;
	text = "Status"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
};
class operative_status_value: RscText
{
	idc = 1013;
	text = "xxxx"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class operative_time_remaining: RscText
{
	idc = 1012;
	text = "Wait time:"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class operative_role_value: RscText
{
	idc = 1014;
	text = "xxxx"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class operative_time_remaining_value: RscText
{
	idc = 1016;
	text = "xxxx"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class operative_available_points_txt: RscText
{
	idc = 1015;
	text = "Available points:"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Available points to spend"; //--- ToDo: Localize;
};
class operative_available_points_value: RscText
{
	idc = 1017;
	text = "xxx"; //--- ToDo: Localize;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Available points to spend"; //--- ToDo: Localize;
};
class operative_add_aiming: RscButton
{
	idc = 1603;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_aim"; 
};
class operative_add_reflexes: RscButton
{
	idc = 1604;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_reflexes"; 
};
class operative_add_spotting: RscButton
{
	idc = 1605;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_spotting"; 
};
class operative_add_courage: RscButton
{
	idc = 1606;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_courage"; 
};
class operative_add_comms: RscButton
{
	idc = 1607;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_comms"; 
};
class operative_add_reload: RscButton
{
	idc = 1608;
	text = "+"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Spend 1 point on this skill"; //--- ToDo: Localize;
	action  = "call DUWS_operator_add_reload"; 
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////






};
};

class fob_mng_dialog
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.063, #Sevoly)
////////////////////////////////////////////////////////
class background_request: RscText
{
	idc = 9745;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 10.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};
class mainframe_fobmanager: RscFrame
{
	idc = 1800;
	text = "FOB Manager"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 29 * GUI_GRID_W;
	h = 9.5 * GUI_GRID_H;
	moving = 1;	
};
class fob_reinforce_frame: RscFrame
{
	idc = 1801;
	text = "Reinforce a FOB"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	tooltip = "Send a team from your High Command to reinforce a specific FOB"; //--- ToDo: Localize;
};
class reinforce_combo: RscCombo
{
	idc = 2101;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Select a FOB"; //--- ToDo: Localize;
};
class reinforce_button: RscButton
{
	idc = 1600;
	text = "Send reinforcements"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Send a team from your High Command to reinforce a specific FOB"; //--- ToDo: Localize;
	action = "_derp = [] execVM 'dialog\fob\reinforce.sqf'";
};
class frame_fast_travel: RscFrame
{
	idc = 1802;
	text = "Fast travel"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	tooltip = "Fast travel between the FOB's and the base"; //--- ToDo: Localize;
};
class fast_travel_button: RscButton
{
	idc = 1601;
	text = "Fast travel"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_derp = [] execVM 'dialog\fob\fast_travel.sqf'";	
	tooltip = "Fast travel between the FOB's and the base"; //--- ToDo: Localize;
};
class fast_travel_combo: RscCombo
{
	idc = 2100;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Select a FOB"; //--- ToDo: Localize;
};
class exit_button: RscButton
{
	idc = 1602;
	text = "EXIT"; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Leave the FOB manager"; //--- ToDo: Localize;
	action = "closeDialog 0";	
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};
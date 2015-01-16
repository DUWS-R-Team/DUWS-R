


class squad_rename_dialog
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Miwysa)
////////////////////////////////////////////////////////

class renameHCmainframe: RscFrame
{
	idc = 1800;
	text = "Enter new name"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	moving = 1;
	tooltip = "Enter the new name of the selected HC squad"; //--- ToDo: Localize;
};
class editbox_rename: RscEdit
{
	idc = 1400;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 29 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Enter the new name of the selected HC squad"; //--- ToDo: Localize;
};
class confirm_button: RscButton
{
	idc = 1600;
	text = "Confirm"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_derp = [] execVM 'dialog\squad\rename\renamesquad.sqf'";	
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////





};
};



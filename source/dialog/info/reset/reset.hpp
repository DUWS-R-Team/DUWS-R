
class reset_confirm
{
	idd = -1;
	movingenable = false;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Ceroce)
////////////////////////////////////////////////////////

class confirmation_frame: RscFrame
{
	idc = 1800;
	text = "Confirmation"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 29 * GUI_GRID_W;
	h = 5.5 * GUI_GRID_H;
};
class confirmation_text: RscText
{
	idc = 1000;
	text = "You will need to restart the mission"; //--- ToDo: Localize;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class reset_button: RscButton
{
	idc = 1600;
	text = "RESET STATS"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	sizeEx = 0.05;
	colorBackground[] = {1, 0, 0,0.5};
	colorBackgroundActive[] = {1,0.2,0.2,1};
	colorFocused[] = {1,0.2,0.2,0};
	action = "_hurr = [] execVM ""persistent\persistent_stats_reset.sqf""";
};
class no_button: RscButton
{
	idc = 1601;
	text = "KEEP STATS"; //--- ToDo: Localize;
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	action = "closeDialog 0";
	sizeEx = 0.05;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};




class startup_hq_placement_dialog
{
	idd = -1;
	movingenable = false;
	onUnload = "_nul = execVM ""dialog\startup\hq_placement\placement_closed.sqf"""; //UI event handler
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.063, #Kedytu)
////////////////////////////////////////////////////////
class background_request: RscText
{
	idc = 1445;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 21 * GUI_GRID_W;
	h = 9.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};
class hq_placement_frame: RscFrame
{
	idc = 1800;
	text = "Select how the HQ is placed on the island"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 20 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class hq_placement_random_button: RscButton
{
	idc = 1600;
	text = "RANDOM"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "The HQ is randomly placed somewhere on the island"; //--- ToDo: Localize;
	action = "_nul = [] execvm ""dialog\startup\hq_placement\random.sqf""; closedialog 0;";	
};
class hq_placement_manual_button: RscButton
{
	idc = 1601;
	text = "MANUAL PLACEMENT"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "You choose where the HQ is placed on the island"; //--- ToDo: Localize;
	action = "_nul = [] execvm ""dialog\startup\hq_placement\manual.sqf""; closedialog 0;";	
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};


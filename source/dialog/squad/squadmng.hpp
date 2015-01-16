


class squad_mng_dialog
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Xynure)
////////////////////////////////////////////////////////
class background_request: RscText
{
	idc = 1445;
	x = -0.46 * GUI_GRID_W + GUI_GRID_X;
	y = 7.52 * GUI_GRID_H + GUI_GRID_Y;
	w = 41 * GUI_GRID_W;
	h = 18 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};
class squadmng_mainframe: RscFrame
{
	idc = 1800;
	text = "SQUAD MANAGER"; //--- ToDo: Localize;
	x = 0.04 * GUI_GRID_W + GUI_GRID_X;
	y = 8.02 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 17 * GUI_GRID_H;
	moving = 1;
};
class dismiss_frame: RscFrame
{
	idc = 1801;
	text = "Your personnal squad"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 5.5 * GUI_GRID_H;
};
class dismissbutton: RscButton
{
	idc = 1600;
	text = "Add yellow team to High Command control"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Add the squad members under your control with High Command"; //--- ToDo: Localize;
	action = "_derp = [] execVM 'dialog\squad\dismiss.sqf'; closeDialog 0";
};
class dismiss_txt_info: RscText
{
	idc = 1000;
	text = "To select a squad member, select him(F1-F12) then assign him to team yellow with the radio menu (9-4)"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	style = ST_MULTI;	
	sizeEx = 0.03;
};
class HCdismiss_frame: RscFrame
{
	idc = 1802;
	text = "High Command squads"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 5.5 * GUI_GRID_H;
};
class dismissHC_txt: RscText
{
	idc = 1001;
	text = "When asked to select a squad, you'll have 10 seconds to select it with the command menu (F1-F12)"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	style = ST_MULTI;	
	sizeEx = 0.03;	
};
class dismissHC_button: RscButton
{
	idc = 1601;
	text = "Disband selected HC squad and add the units to your squad"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Dismiss a HC squad and add the units under your direct control"; //--- ToDo: Localize;
	action = "_derp = [] execVM 'dialog\squad\dismissHC.sqf'; closeDialog 0";	
};
class renameHC_button: RscButton
{
	idc = 1601;
	text = "Rename a HC squad"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Rename a HC squad"; //--- ToDo: Localize;
	action = "closeDialog 0; _handle = createDialog 'squad_rename_dialog'";	
};
class leave_button: RscButton
{
	idc = 1600;
	text = "LEAVE"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Exit the squad manager"; //--- ToDo: Localize;
	action = "closeDialog 0";		
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




};
};



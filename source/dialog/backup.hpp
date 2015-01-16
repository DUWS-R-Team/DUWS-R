
class ressourceheader
{
	idd = -1;
	movingenable = false;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Fimogu)
////////////////////////////////////////////////////////

class mainframebackground: RscFrame
{
	idc = 1800;
	text = "ASSETS INTERFACE"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "SQUADS"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 20.5 * GUI_GRID_H;
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "UNITS"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 20.5 * GUI_GRID_H;
};
class RscFrame_1803: RscFrame
{
	idc = 1803;
	text = "VEHICLES"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 20.5 * GUI_GRID_H;
};
class RscFrame_1804: RscFrame
{
	idc = 1804;
	text = "UNLOCK SUPPORT"; //--- ToDo: Localize;
	x = 30.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 20.5 * GUI_GRID_H;
};
class unitlistbox: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	text = "squadlistbox"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	text = "vehiclelistbox"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};
class RscListbox_1503: RscListbox
{
	idc = 1503;
	text = "supportlistbox"; //--- ToDo: Localize;
	x = 31 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};
class requestunitsbutton: RscButton
{
	idc = 1600;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_nil=[]ExecVM ""dialog\request_unit.sqf""";
};
class requestsquadbutton: RscButton
{
	idc = 1601;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class requestvehiclebutton: RscButton
{
	idc = 1602;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class supportunlockbutton: RscButton
{
	idc = 1603;
	text = "UNLOCK"; //--- ToDo: Localize;
	x = 31 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class exitbutton: RscButton
{
	idc = 1604;
	text = "EXIT"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
  action = "closeDialog 0";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};

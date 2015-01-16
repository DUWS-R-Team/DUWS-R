
class ressourceheader
{
	idd = -1;
	movingenable = true;
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Foputi)
////////////////////////////////////////////////////////

class mainframebackground: RscFrame
{
	idc = 1800;
	text = "ASSETS INTERFACE"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "SQUADS"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "SINGLE UNITS"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class RscFrame_1803: RscFrame
{
	idc = 1803;
	text = "EMPTY VEHICLES"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class RscFrame_1804: RscFrame
{
	idc = 1804;
	text = "UNLOCK SUPPORT"; //--- ToDo: Localize;
	x = 30.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class unitlistbox: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	text = "squadlistbox"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	text = "vehiclelistbox"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
};
class RscListbox_1503: RscListbox
{
	idc = 1503;
	text = "supportlistbox"; //--- ToDo: Localize;
	x = 31 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
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
 	tooltip = "Request a single unit AI to join your own personnal squad";
};
class requestsquadbutton: RscButton
{
	idc = 1601;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_nil=[]ExecVM ""dialog\request_squad.sqf""";
 	tooltip = "Request an entire squad, accessible through High Command";
};
class requestvehiclebutton: RscButton
{
	idc = 1602;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
 	tooltip = "Request an EMPTY vehicle to spawn at your position";
	action = "_nil=[]ExecVM ""dialog\request_vehicle.sqf""";
};
class supportunlockbutton: RscButton
{
	idc = 1603;
	text = "UNLOCK"; //--- ToDo: Localize;
	x = 31 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_nil=[]ExecVM ""dialog\request_support.sqf""";
 	tooltip = "Unlock supports accessible with the communication menu (0-8) in the radio";
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
class RscText_1000: RscText
{
	idc = 1000;
	text = "CP: XXX"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "ZUC:XXX"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
};
class RscFrame_1805: RscFrame
{
	idc = 1805;
	text = "Command points"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	tooltip = "Command points available"; //--- ToDo: Localize;
};
class RscFrame_1806: RscFrame
{
	idc = 1806;
	text = "Zones under control"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	tooltip = "Number of zones you have captured on this island"; //--- ToDo: Localize;
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "REQUEST SIDE MISSION"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_derp = [] execVM 'missions\stratmap.sqf'; closeDialog 0";
	tooltip = "Select a random side mission. Accomplishing a side mission gives you CP."; //--- ToDo: Localize;  
};
class ap_mainframe: RscFrame
{
	idc = 1807;
	text = "Army Power"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	tooltip = "Actual strenght of BLUFOR presence"; //--- ToDo: Localize;
};
class ap_text: RscText
{
	idc = 1002;
	text = "000"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Actual strenght of BLUFOR presence"; //--- ToDo: Localize;
	colorText[] = {1,1,1,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




};
};

        /*
        
        ////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Bavoge)
////////////////////////////////////////////////////////

class mainframebackground: RscFrame
{
	idc = 1800;
	text = "ASSETS INTERFACE"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class requestsquadframe: RscFrame
{
	idc = 1802;
	text = "SQUAD"; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class emptyvehicleframe: RscFrame
{
	idc = 1803;
	text = "EMPTY VEHICLE"; //--- ToDo: Localize;
	x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class supportunlockframe: RscFrame
{
	idc = 1804;
	text = "UNLOCK SUPPORT"; //--- ToDo: Localize;
	x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class requestunitframe: RscFrame
{
	idc = 1801;
	text = "UNIT"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class requestunitsbutton: RscButton
{
	idc = 1600;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class requestsquadbutton: RscButton
{
	idc = 1601;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class requestvehiclebutton: RscButton
{
	idc = 1602;
	text = "REQUEST"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class supportunlockbutton: RscButton
{
	idc = 1603;
	text = "UNLOCK"; //--- ToDo: Localize;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
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
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "CP: XXX"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "ZUC:XXX"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscFrame_1805: RscFrame
{
	idc = 1805;
	text = "Command points"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class RscFrame_1806: RscFrame
{
	idc = 1806;
	text = "Zones under control"; //--- ToDo: Localize;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "REQUEST SIDE MISSION"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Generate a random side mission.\nAccomplishing a side mission gives you CP."; //--- ToDo: Localize;
};
class ap_mainframe: RscFrame
{
	idc = 1807;
	text = "Army Power"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	tooltip = "Actual strenght of BLUFOR presence"; //--- ToDo: Localize;
};
class ap_text: RscText
{
	idc = 1002;
	text = "000"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Actual strenght of BLUFOR presence"; //--- ToDo: Localize;
};
class unitlistbox: RscCombo
{
	idc = 2100;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class squadlist: RscCombo
{
	idc = 2101;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class emptyvehiclelist: RscCombo
{
	idc = 2102;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class supportunlocklist: RscCombo
{
	idc = 2103;
	x = 27 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
*/
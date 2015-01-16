
class startup_dialog
{
	idd = -1;
	movingenable = false;
	onUnload = "_nul = execVM ""dialog\startup\startup_closed.sqf"""; //UI event handler
//  onLoad = "_this call FRAME_01_Load";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by kibot, v1.062, #Nanyko)
////////////////////////////////////////////////////////
class background_request: RscText
{
	idc = 1469;
	x = -0.6 * GUI_GRID_W + GUI_GRID_X;
	y = -0.48 * GUI_GRID_H + GUI_GRID_Y;
	w = 41 * GUI_GRID_W;
	h = 26 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};
class campaign_definer_mainframe: RscFrame
{
	idc = 1800;
	text = "DEFINE THE PARAMETERS FOR YOUR CAMPAIGN"; //--- ToDo: Localize;
	x = 0.1 * GUI_GRID_W + GUI_GRID_X;
	y = 0.02 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
};
class zone_max_radius_frame: RscFrame
{
	idc = 1801;
	text = "Maximum radius of a zone"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define the maximum possible radius of an enemy zone"; //--- ToDo: Localize;
};
class zone_min_radius_frame: RscFrame
{
	idc = 1802;
	text = "Minimum radius of a zone"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define the minimum possible radius of an enemy zone"; //--- ToDo: Localize;
};
class zone_max_radius_combo: RscCombo
{
	idc = 2100;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Define the maximum possible radius of a zone when the enemy zones will be generated"; //--- ToDo: Localize;
};
class zone_min_radius_combo: RscCombo
{
	idc = 2101;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Define the minimum possible radius of a zone when the enemy zones will be generated"; //--- ToDo: Localize;
};
class zone_number_frame: RscFrame
{
	idc = 1803;
	text = "Number of enemy zones"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define how many enemy zones will be generated"; //--- ToDo: Localize;
};
class zone_number_combo: RscCombo
{
	idc = 2102;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "How many enemy zones will be generated"; //--- ToDo: Localize;
};
class cp_start_frame: RscFrame
{
	idc = 1804;
	text = "Starting available Command Points (CP)"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define how much Command Points you start with"; //--- ToDo: Localize;
};
class cp_start_combo: RscCombo
{
	idc = 2103;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Define how much Command Points you start with"; //--- ToDo: Localize;
};
class bap_start_frame: RscFrame
{
	idc = 1805;
	text = "Starting BLUFOR Army Power"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define the starting resources of your HQ at the beginning of the mission"; //--- ToDo: Localize;
};
class bap_start_combo: RscCombo
{
	idc = 2104;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Define the starting ressources your HQ has at the beginning"; //--- ToDo: Localize;
};
class oap_start_frame: RscFrame
{
	idc = 1806;
	text = "Starting OPFOR Army Power"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Define the starting ressources the OPFOR has at the beginning"; //--- ToDo: Localize;
};
class oap_start_combo: RscCombo
{
	idc = 2105;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Define the starting ressources the OPFOR has at the beginning"; //--- ToDo: Localize;
};
class text_information: RscText
{
	idc = 1000;
	text = "Before generating the campaign with non-default parameters, make sure that the island you are playing on is capable to host all the zones. Otherwise the DUWS may not be able to generate the zones."; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	style = ST_MULTI;
};
class start_button: RscButton
{
	idc = 1600;
	text = "START"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = 0.05;
	colorBackground[] = {1, 0, 0,0.5};
	tooltip = "Generate the zones and the campaign"; //--- ToDo: Localize;
	action = "_nul = [] execvm ""dialog\startup\startup_start.sqf""";
};
class weather_type_frame: RscFrame
{
	idc = 1807;
	text = "Weather type"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "The weather will be dinamically generated according to the type of weather you have chosen"; //--- ToDo: Localize;
};
class weather_type_combo: RscCombo
{
	idc = 2106;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "The weather will be dinamically generated according to the type of weather you have chosen"; //--- ToDo: Localize;
};
class frame_opf_skill: RscFrame
{
	idc = 1808;
	text = "Enemy AI skill"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Set the desired AI skill range for the enemy units"; //--- ToDo: Localize;
};
class combo_opf_skill: RscCombo
{
	idc = 2107;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Set the desired AI skill range for the enemy units"; //--- ToDo: Localize;  
};
class frame_blufor_ai_skill: RscFrame
{
	idc = 1809;
	text = "Base friendly AI skill"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Set the desired base AI skill range for friendly units. Affects every created BLUFOR units."; //--- ToDo: Localize;
};
class combo_blufor_ai_skill: RscCombo
{
	idc = 2108;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Set the desired base AI skill range for friendly units. Affects every created BLUFOR units."; //--- ToDo: Localize;
};
class helo_fast_travel_frame: RscFrame
{
	idc = 1810;
	text = "Fast travel with Helo taxi ?"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "When using the support ""Helo taxi"", determines if the helicopter will directly teleport near the LZ"; //--- ToDo: Localize;
};
class helo_taxi_fasttravel_list: RscCombo
{
	idc = 2109;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "When using the support ""Helo taxi"", determines if the helicopter will directly teleport near the LZ"; //--- ToDo: Localize;
};
class fast_travel_frame: RscFrame
{
	idc = 1810;
	text = "Allow fast travel"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Allow fast travel between FOBs"; //--- ToDo: Localize;
};
class fast_travel_list: RscCombo
{
	idc = 2714;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Allow fast travel between FOBs"; //--- ToDo: Localize;
};
class max_dist_from_hq_frame: RscFrame
{
	idc = 1888;
	text = "Maximum distance from the HQ"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	tooltip = "Set the max. distance between the created zones and the HQ"; //--- ToDo: Localize;
};
class max_dist_from_hq_list: RscCombo
{
	idc = 2188;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Set the max. distance between the created zones and the HQ"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};


/*
	ArmA 3 Wasteland
	Code extracted and adapted by Sa-Matra
	Using this code without Sa-Matra's direct permission is forbidden
*/

class VAS_RscControlsGroup {
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = safeZoneW;
	h = safeZoneH;
	shadow = 0;
	style = 16;
	
	class VScrollbar 
	{
		color[] = {1, 1, 1, 0.6};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow = 0;
	};
	
	class HScrollbar 
	{
		color[] = {1, 1, 1, 0.6};
		height = 0.028;
		shadow = 0;
	};
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	
	class Controls {};
};

class VAS_RscControlsGroupNoScrollbars : VAS_RscControlsGroup {
	class VScrollbar : VScrollbar {
		width = 0;
	};
	
	class HScrollbar : HScrollbar {
		height = 0;
	};
};

class VAS_RscListNBox {
	style = 16;
	type=102;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95, 0.95, 0.95, 1};
	colorText[] = {1, 1, 1, 1.0};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	period = 1.2;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class VAS_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaMedium";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};

class VAS_RscLine : VAS_RscText {
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};

class VAS_RscTree {
	style = 2;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	expandedTexture = "A3\ui_f\data\gui\Rsccommon\Rsctree\expandedTexture_ca.paa";
	hiddenTexture = "A3\ui_f\data\gui\Rsccommon\Rsctree\hiddenTexture_ca.paa";
	rowHeight = 0.0439091;
	color[] = {1, 1, 1, 1};
	colorSelect[] = {0.7, 0.7, 0.7, 1};
	colorBackground[] = {0, 0, 0, 0};
	colorSelectBackground[] = {0, 0, 0, 0.5};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0;
};

class VAS_RscTitle : VAS_RscText {
	style = 0;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class VAS_RscPicture {
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = 0.023;
	font = "PuristaMedium";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class VAS_RscPictureKeepAspect : VAS_RscPicture {
	style = 0x30 + 0x800;
};

class VAS_RscStructuredText {
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	shadow = 1;
	
	class Attributes {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class VAS_RscActiveText {
	idc = -1;
	type = 11;
	style = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	sizeEx = 0.040;
	font = "PuristaLight";
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0.2, 0.2, 1};
	soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
	action = "";
	text = "";
};

class VAS_RscButton {
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	colorBackgroundDisabled[] = {0.95, 0.95, 0.95, 1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	colorShadow[] = {0, 0, 0, 1};
	colorBorder[] = {0, 0, 0, 1};
	borderSize = 0.0;
	soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
};

class VAS_RscButtonTextOnly : VAS_RscButton {
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	colorBackground[] = {1, 1, 1, 0};
	colorBackgroundActive[] = {1, 1, 1, 0};
	colorBackgroundDisabled[] = {1, 1, 1, 0};
	colorFocused[] = {1, 1, 1, 0};
	colorShadow[] = {1, 1, 1, 0};
	borderSize = 0.0;
};

class VAS_RscShortcutButton 
{
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "PuristaMedium";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	action = "";
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};

class VAS_ScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class VAS_RscButtonMenu : VAS_RscShortcutButton 
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	textureNoShortcut = "";
};

class VAS_RscShortcutButtonMain : VAS_RscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = {1, 1, 1, 1.0};
	colorDisabled[] = {1, 1, 1, 0.25};
	
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	
	class ShortcutPos {
		left = 0.0145;
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		w = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
		h = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	};
	
	class TextPos {
		left = "(		((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	period = 0.5;
	font = "PuristaMedium";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	text = "";
	soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
	action = "";
	
	class Attributes {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	
	class AttributesImage {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};

class VAS_RscCheckbox {
	idc = -1;
	type = 7;
	style = 0;
	x = "LINE_X(XVAL)";
	y = LINE_Y;
	w = "LINE_W(WVAL)";
	h = 0.029412;
	colorText[] = {1, 0, 0, 1};
	color[] = {0, 0, 0, 0};
	colorBackground[] = {0, 0, 1, 1};
	colorTextSelect[] = {0, 0.8, 0, 1};
	colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = {UNCHECKED};
	checked_strings[] = {CHECKED};
};

class VAS_RscProgress 
{
	type = 8;
	style = 0;
	x = 0.344;
	y = 0.619;
	w = 0.313726;
	h = 0.0261438;
	shadow = 2;
	texture = "\A3\ui_f\data\GUI\RscCommon\RscProgress\progressbar_ca.paa";
	colorFrame[] = {0,0,0,0};
	colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
};

class VAS_RscListBox 
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "PuristaMedium";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = 0.023;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ListScrollBar: VAS_ScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class VAS_RscEdit {
	type = 2;
	style = 0x00 + 0x40;
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = false;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
};

class VAS_RscSlider {
	h = 0.025;
	color[] = {1, 1, 1, 0.8};
	colorActive[] = {1, 1, 1, 1};
};

class VAS_RscFrame {
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
};

class VAS_RscBackground : VAS_RscText {
	type = 0;
	IDC = -1;
	style = 512;
	shadow = 0;
	x = 0.0;
	y = 0.0;
	w = 1.0;
	h = 1.0;
	text = "";
	ColorBackground[] = {0.48, 0.5, 0.35, 1};
	ColorText[] = {0.1, 0.1, 0.1, 1};
	font = "PuristaMedium";
	SizeEx = 1;
};

class VAS_RscHTML {
	colorText[] = {1, 1, 1, 1.0};
	colorBold[] = {1, 1, 1, 1.0};
	colorLink[] = {1, 1, 1, 0.75};
	colorLinkActive[] = {1, 1, 1, 1.0};
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	prevPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_left_ca.paa";
	nextPage = "\A3\ui_f\data\gui\Rsccommon\Rschtml\arrow_right_ca.paa";
	shadow = 2;
	
	class H1 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		align = "left";
	};
	
	class H2 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "right";
	};
	
	class H3 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	
	class H4 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	
	class H5 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	
	class H6 {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	
	class P {
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
};

class VAS_RscHitZones {
	x = 0;
	y = 0;
	w = 0.1;
	h = 0.1;
	xCount = 1;
	yCount = 1;
	xSpace = 0;
	ySpace = 0;
};

class VAS_RscMapControl {
	moveOnEdges = 1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1.0;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 0.35;
	alphaFadeEndScale = 0.4;
	colorBackground[] = {0.969, 0.957, 0.949, 1.0};
	colorSea[] = {0.467, 0.631, 0.851, 0.5};
	colorForest[] = {0.624, 0.78, 0.388, 0.5};
	colorForestBorder[] = {0.0, 0.0, 0.0, 0.0};
	colorRocks[] = {0.0, 0.0, 0.0, 0.3};
	colorRocksBorder[] = {0.0, 0.0, 0.0, 0.0};
	colorLevels[] = {0.286, 0.177, 0.094, 0.5};
	colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
	colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
	colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
	colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
	colorPowerLines[] = {0.1, 0.1, 0.1, 1.0};
	colorRailWay[] = {0.8, 0.2, 0.0, 1.0};
	colorNames[] = {0.1, 0.1, 0.1, 0.9};
	colorInactive[] = {1.0, 1.0, 1.0, 0.5};
	colorOutside[] = {0.0, 0.0, 0.0, 1.0};
	colorTracks[] = {0.84, 0.76, 0.65, 0.15};
	colorTracksFill[] = {0.84, 0.76, 0.65, 1.0};
	colorRoads[] = {0.7, 0.7, 0.7, 1.0};
	colorRoadsFill[] = {1.0, 1.0, 1.0, 1.0};
	colorMainRoads[] = {0.9, 0.5, 0.3, 1.0};
	colorMainRoadsFill[] = {1.0, 0.6, 0.4, 1.0};
	colorGrid[] = {0.1, 0.1, 0.1, 0.6};
	colorGridMap[] = {0.1, 0.1, 0.1, 0.6};
	fontLabel = "PuristaMedium";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "PuristaMedium";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	
	class Legend {
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[] = {1, 1, 1, 0.5};
		color[] = {0, 0, 0, 1};
	};
	
	class ActiveMarker
	{
		color[] =
		{
			0.3,
			0.1,
			0.9,
			1
		};
		size = 50;
	};
	
	class Task {
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCreated[] = {1, 1, 1, 1};
		colorCanceled[] = {0.7, 0.7, 0.7, 1};
		colorDone[] = {0.7, 1, 0.3, 1};
		colorFailed[] = {1, 0.3, 0.2, 1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	
	class Waypoint {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[] = {0, 0, 0, 1};
	};
	
	class WaypointCompleted {
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[] = {0, 0, 0, 1};
	};
	
	class CustomMark {
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {0, 0, 0, 1};
	};
	
	class Command {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {1, 1, 1, 1};
	};
	
	class Bush {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45, 0.64, 0.33, 0.4};
		size = 14/2;
		importance = 0.2 * 14 * 0.05 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Rock {
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[] = {0.1, 0.1, 0.1, 0.8};
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class SmallTree {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45, 0.64, 0.33, 0.4};
		size = 12;
		importance = 0.6 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Tree {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45, 0.64, 0.33, 0.4};
		size = 12;
		importance = 0.9 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class busstop {
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class fuelstation {
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class hospital {
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class church {
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class lighthouse {
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class power {
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class powersolar {
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class powerwave {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class powerwind {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class quay {
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class shipwreck {
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class transmitter {
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class watertower {
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1, 1, 1, 1};
	};
	
	class Cross {
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {0, 0, 0, 1};
	};
	
	class Chapel {
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {0, 0, 0, 1};
	};
	
	class Bunker {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = 1.5 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class Fortress {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class Fountain {
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = 1 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class Ruin {
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class Stack {
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class Tourism {
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.7;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
	
	class ViewTower {
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
		color[] = {0, 0, 0, 1};
	};
};

class VAS_RscCombo {
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {0.4,0.4,0.4,0.4};
	colorSelectBackground[] = {1, 1, 1, 0.7};
	colorScrollbar[] = {1, 0, 0, 1};
	soundSelect[] = {
			"", 0.000000, 1
	};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\Rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\Rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class VAS_RscToolbox {
	colorText[] = {0.95, 0.95, 0.95, 1};
	color[] = {0.95, 0.95, 0.95, 1};
	colorTextSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};

class VAS_ActiveTextPicture
{
    idc = -1;
	type = 11;
	style = 0x30 + 0x800;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.035;
	font = "PuristaMedium";
	shadow = 2;
	text = "";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};
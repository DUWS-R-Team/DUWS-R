class AIS_Core_Progress_BarDlg {
    idd = -1;
    movingEnable = false;
    onLoad = "uiNamespace setVariable ['AIS_Core_Progress_ProgressBar', (_this select 0) displayCtrl 1]; uiNamespace setVariable ['AIS_Core_Progress_ProgressTitle', (_this select 0) displayCtrl 2];";
    objects[] = {};

    class controlsBackground {
		class Background {
            idc = -1;
            moving = 0;
            font = "PuristaMedium";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 0;
            size = 1;
            colorBackground[] = {0, 0, 0, 0.7};
            colorText[] = {0, 0, 0, 0};
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.082 * safezoneH + safezoneY";
			w = "0.407344 * safezoneW";
			h = "0.011 * safezoneH";
        };
        class ProgressBar {
            idc = 1;
            moving = 0;
            text = "";
            font = "PuristaMedium";
            sizeEx = "1 / 40 / (getResolution select 5)";
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 2;
            size = 1;
            colorBackground[] = {0.6784, 0.7490, 0.5137, 0.7};
            colorText[] = {1,1,1,1};
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.082 * safezoneH + safezoneY";
			w = "0.001 * safezoneW";
			h = "0.011 * safezoneH";
        };
        class TitleBar : ProgressBar {
            idc = 2;
			style = 0x00;
            colorBackground[] = {0, 0, 0, 0};
			x = "0.298906 * safezoneW + safezoneX";
			y = "0.093 * safezoneH + safezoneY";
			w = "0.407344 * safezoneW";
			h = "0.022 * safezoneH";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			sizeEx = "0.02 / (getResolution select 5)";
			font = "EtelkaMonospaceProBold";
			color = "#FFFFFF";
			align = "left";
			valign = "left";
			shadow = 1;
			shadowColor = "#000000";
        };
    };
};
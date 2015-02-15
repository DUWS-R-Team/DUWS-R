/*
	Author: Bryan "Tonic" Boardwine
	Website: www.iamtonic.co
	Use of the VAS system is permitted although modification and distribution must be approved by Tonic.
*/

#include "common.hpp"

class VAS_Diag {
	idd = 2500;
	name= "Virtual_Ammobox_Sys";
	movingEnable = 1;
	enableSimulation = true;
	onLoad = "";
	onUnload = "VAS_box_weapons = nil; VAS_box_magazines = nil; VAS_box_items = nil; VAS_box_backpacks = nil; VAS_box_goggles = nil;"; //When the dialog is gone set these back to nil.
	
	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class vasText : VAS_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VAS_Main_VirtGear";
			sizeEx = 0.04;
			x = 0.12; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class vasgText : VAS_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VAS_Main_YCG";
			sizeEx = 0.04;
			
			x = 0.60; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class VAS_ContainerBG : VAS_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 2950;
			x = 0.905;
			y = 0.2 + (11 / 250);
			w = 0.09;
			h = 0.235 - (22 / 250);
		};
		
		class VAS_VestBG : VAS_ContainerBG
		{
			idc = 2951;
			y = 0.35 + (11 / 250);
		};
		
		class VAS_BackpackBG : VAS_ContainerBG
		{
			idc = 2952;
			y = 0.5 + (11 / 250);
		};
		
		class VAS_UniformPicSlot : VAS_ActiveTextPicture
		{
			idc = 2960;
			text = "";
			onLBDrop = "_this call VAS_fnc_quickAddDrag;";
			x = 0.905;
			y = 0.25;
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VAS_VestPicSlot : VAS_UniformPicSlot
		{
			idc = 2961;
			text = "";
			onLBDrop = "_this call VAS_fnc_quickAddDrag;";
			y = 0.395;
		};
		
		class VAS_BackpackPicSlot : VAS_UniformPicSlot
		{
			idc = 2962;
			text = "";
			onLBDrop = " _this call VAS_fnc_quickAddDrag; ";
			y = 0.55;
		};
		
		class VAS_loadBarP : VAS_RscProgress
		{
			idc = 2970;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			x = 0.9075;
			y = 0.371;
			w = 0.086;
			h = 0.015;
		};
		
		class VAS_VestLoad : VAS_loadBarP
		{
			idc = 2971;
			y = 0.52;
		};
		
		class VAS_BackpackLoad : VAS_loadBarP
		{
			idc = 2972;
			y = 0.67;
		};
	};
	
	class controls {
	
		class gundetailsbg : VAS_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2507;
			text = "";
			
			x = -0.205;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.35 - (22 / 250);
		};
		
		class AttachmentsBG : VAS_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 2850;
			text = "";
			x = -0.205;
			y = 0.47 + (11 / 250);
			w = 0.3;
			h = 0.32 - (22 / 250);
		};
		
		class AttachmentsList : VAS_RscListBox
		{
			colorBackground[] = {0,0,0,0};
			idc = 2851;
			text = "";
			onLBDblClick = "_this call VAS_fnc_quickAttachment";
			canDrag = 1;
			sizeEx = 0.035;
			x = -0.2; y = 0.47 + (11 / 250);
			w = 0.29; h = 0.32 - (22 / 250);
		};
		
		class gundetails : VAS_RscStructuredText
		{
			idc = 2508;
			text = "";
			//text = "<t align='center'>EBR 21 7.62 mm Uses:</t>";
			x = -0.265;
			y = 0.21 + (11 / 250);
			w = 0.4; h = 0.15;
		};
		
		class gundetailslist : VAS_RscListBox
		{
			colorBackground[] = {0,0,0,0};
			idc = 2509;
			text = "";
			canDrag = 1;
			onLBDblClick = "_this spawn VAS_fnc_quickMag;";
			sizeEx = 0.030;
			
			x = -0.2; y = 0.3;
			w = 0.29; h = 0.16;
		};

		class vasGear : VAS_RscListBox 
		{
			idc = 2501;
			text = "";
			sizeEx = 0.032;
			canDrag = 1;
			onLBSelChanged = "_this spawn VAS_fnc_details";
			onLBDblClick = "_this spawn VAS_fnc_quickItem;";
			
			x = 0.12; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class vasPGear : VAS_RscListBox 
		{
			idc = 2502;
			text = "";
			sizeEx = 0.032;
			onLBDblClick = "_this spawn VAS_fnc_qRemoveItem;";
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";
			
			x = 0.60; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class WeaponsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Weapons";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['guns',false] spawn VAS_fnc_mainDisplay";
			x = 0.42; y = 0.30;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class MagazinesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Magazines";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['mags',false] spawn VAS_fnc_mainDisplay";
			x = 0.42; y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ItemsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['items',false] spawn VAS_fnc_mainDisplay";
			x = 0.42; y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BackpacksBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Backpacks";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['packs',false] spawn VAS_fnc_mainDisplay";
			x = 0.42; y = 0.45;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GogglesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Goggles";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['glass',false] spawn VAS_fnc_mainDisplay";
			x = 0.42; y = 0.50;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		//Filter Buttons
		class Filter1 : VAS_RscActiveText
		{
			idc = 2580;
			text = "$STR_VAS_Main_Uniforms";
			action = "[0] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			
			x = 0.43; y = 0.55;
			w = 0.275; h = 0.04;
		};
		
		class Filter2 : VAS_RscActiveText
		{
			idc = 2581;
			text = "$STR_VAS_Main_Vests";
			action = "[1] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			
			x = 0.43; y = 0.58;
			w = 0.275; h = 0.04;
		};
		
		class Filter3 : VAS_RscActiveText
		{
			idc = 2582;
			text = "$STR_VAS_Main_Headgear";
			action = "[2] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			
			x = 0.43; y = 0.61;
			w = 0.275; h = 0.04;
		};
		
		class Filter4 : VAS_RscActiveText
		{
			idc = 2583;
			text = "$STR_VAS_Main_Attachments";
			action = "[3] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			
			x = 0.43; y = 0.64;
			w = 0.275; h = 0.04;
		};
		
		class Filter5 : VAS_RscActiveText
		{
			idc = 2584;
			text = "$STR_VAS_Main_Misc";
			action = "[4] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			
			x = 0.43; y = 0.67;
			w = 0.275; h = 0.04;
		};
			
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Virtual Ammobox System";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VersionNumber : Title {
			idc = 2404;
			style = 1;
			text = "v2.6";
		};

		class ButtonAddG : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_btnAdd";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_addGear";
			
			x = 0.13;
			y = 0.67;
			w = (10 / 40);
			h = (1 / 25);
		};
		class ButtonRemoveG : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_btnRemove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[false] spawn VAS_fnc_removeGear;";
			
			x = 0.61;
			y = 0.67;
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : VAS_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_VAS_Main_btnClose";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonSaveGear : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Main_btnSave";
			onButtonClick = "createDialog ""VAS_Save_Diag"";";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonLoadGear : VAS_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_VAS_Main_btnLoad";
			onButtonClick = "createDialog ""VAS_Load_Diag"";";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonRemoveAll : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Main_btnRemoveAll";
			onButtonClick = "[true] spawn VAS_fnc_removeGear;";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class VAS_Load_Diag {
	idd = 2520;
	name= "Virtual_Ammobox_Sys Load";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[1] spawn VAS_fnc_SaveLoad";
	
	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_VAS_Load_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class LoadLoadoutList : VAS_RscListBox 
		{
			idc = 2521;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[1] spawn VAS_fnc_loadoutInfo";
			
			x = 0.12; y = 0.26;
			w = 0.230; h = 0.360;
		};
		
		class LoadFetchList : VAS_RscListBox 
		{
			idc = 2522;
			colorBackground[] = {0,0,0,0};
			text = "";
			sizeEx = 0.030;
			
			x = 0.35; y = 0.26;
			w = 0.330; h = 0.360;
		};

		
		class CloseLoadMenu : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Main_btnClose";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class LoadOnRespawnMenu : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Load_LOR";
			onButtonClick = "if(vas_onRespawn) then {[] call VAS_fnc_onRespawn;} else {hint ""Disabled""};";
			x = 0.10 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (9 / 40);
			h = (1 / 25);
		};
		
		class TransBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Load_TransferBtn";
			onButtonClick = "[] call VAS_fnc_transferMenu";
			x = 0.33 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GearLoadMenu : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Load_btnLoad";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_loadGear";
			x = 0.05 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.73 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GearDeleteMenu : VAS_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_VAS_Load_btnDelete";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_deleteGear";
			x = 0.25 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.73 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class VAS_TransferMenu
{
	idd = 2560;
	name = "Virtual_Ammobox_sys_transfermenu";
	movingEnabled = false;
	enableSimulation = true;
	
	class Controls
	{
		class MainMenu : VAS_RscControlsGroup
		{
			idc = 2600;
			
			class Controls
			{
				class VAS_RscTitleBackground : VAS_RscText
				{
					idc = -1;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.25;
					y = 0.2;
					w = 0.5;
					h = (1 / 25);
				};
				
				class MainBackground : VAS_RscText
				{
					colorBackground[] = {0,0,0,0.7};
					idc = -1;
					x = 0.25;
					y = 0.2 + (11 / 250);
					w = 0.5;
					h = 0.6 - (22 / 250);
				};
				
				class Title : VAS_RscTitle
				{
					idc = -1;
					text = "$STR_VAS_Transfer_MainMenu";
					x = 0.25;
					y = 0.2;
					w = 0.5;
					h = (1 / 25);
				};
				
				class UnitsList : VAS_RscListBox 
				{
					idc = 2601;
					text = "";
					sizeEx = 0.045;
					canDrag = 1;
					x = 0.26; y = 0.26;
					w = 0.47; h = 0.45;
				};
				
				class TransBtn : VAS_RscButtonMenu
				{
					idc = -1;
					text = "$STR_VAS_Load_TransferBtn";
					onButtonClick = "[] call VAS_fnc_transferAction";
					x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.8 - (1 / 25);
					w = (6.25 / 40);
					h = (1 / 25);
				};
			};
		};
		
		class TransferSaveMenu : VAS_RscControlsGroup
		{
			idc = 2700;
			
			class Controls
			{
				class VAS_RscTitleBackground:VAS_RscText 
				{
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					idc = -1;
					x = 0.1;
					y = 0.2;
					w = 0.6;
					h = (1 / 25);
				};
				
				class MainBackground:VAS_RscText {
					colorBackground[] = {0, 0, 0, 0.7};
					idc = -1;
					x = 0.1;
					y = 0.2 + (11 / 250);
					w = 0.6;
					h = 0.6 - (22 / 250);
				};
			
				class Title : VAS_RscTitle {
					colorBackground[] = {0, 0, 0, 0};
					idc = -1;
					text = "$STR_VAS_Save_Title";
					x = 0.1;
					y = 0.2;
					w = 0.6;
					h = (1 / 25);
				};
				
				class SaveLoadoutList : VAS_RscListBox 
				{
					idc = 2711;
					text = "";
					sizeEx = 0.035;
					
					x = 0.12; y = 0.26;
					w = 0.230; h = 0.360;
				};
				
				class SaveFetchList : VAS_RscListBox 
				{
					idc = 2513;
					colorBackground[] = {0,0,0,0};
					text = "";
					sizeEx = 0.030;
					
					x = 0.35; y = 0.26;
					w = 0.330; h = 0.360;
				};
				
				class SaveLoadEdit : VAS_RscEdit
				{
					idc = 2712;
					text = "$STR_VAS_Save_CLN";
					
					x = -0.05 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.73 - (1 / 25);
					w = (13 / 40);
					h = (1 / 25);
				};
				
				class GearSaveMenu : VAS_RscButtonMenu 
				{
					idc = -1;
					text = "$STR_VAS_Save_btnSave";
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					onButtonClick = "[] call VAS_fnc_transferSaveGear";
					x = 0.35 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.73 - (1 / 25);
					w = (6.25 / 40);
					h = (1 / 25);
				};
			};
		};
	};
};

class VAS_Save_Diag {
	idd = 2510;
	name= "Virtual_Ammobox_Sys Save";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn VAS_fnc_SaveLoad";
	
	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls 
	{
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_VAS_Save_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class SaveLoadoutList : VAS_RscListBox 
		{
			idc = 2511;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[0] spawn VAS_fnc_loadoutInfo";
			
			x = 0.12; y = 0.26;
			w = 0.230; h = 0.360;
		};
		
		class SaveFetchList : VAS_RscListBox 
		{
			idc = 2513;
			colorBackground[] = {0,0,0,0};
			text = "";
			sizeEx = 0.030;
			
			x = 0.35; y = 0.26;
			w = 0.330; h = 0.360;
		};
		
		class SaveLoadEdit : VAS_RscEdit
		{
			idc = 2512;
			text = "$STR_VAS_Save_CLN";
			
			x = -0.05 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.73 - (1 / 25);
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class CloseSaveMenu : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Main_btnClose";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GearSaveMenu : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Save_btnSave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call VAS_fnc_saveGear";
			x = 0.35 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.73 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class VAS_prompt 
{
	idd = 2550;
	name = "Virtual_Ammobox_sys_prompt";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.22 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : VAS_RscStructuredText
		{
			idc = 2551;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class addtogun : VAS_RscButtonMenu {
			idc = 2552;
			text = "$STR_VAS_Prompt_addToWeapon";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "vas_prompt_choice = true; closeDialog 0;";
			x = 0.145 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class addtogear : VAS_RscButtonMenu {
			idc = 2553;
			text = "$STR_VAS_Prompt_addToInv";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "vas_prompt_choice = false; closeDialog 0;";
			x = 0.455 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class blankPHVAS : VAS_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.304 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (5.9 / 40);
			h = (1 / 25);
		};
	};
};
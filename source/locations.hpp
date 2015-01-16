class CfgNotifications
{
	class Default
	{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
 
	// Examples

	class ScoreAdded
	{
		title = "Score bonus";
		iconText = "+%2";
		description = "%1";
		color[] = {0.5,1,1,1};
		priority = 0;
		difficulty[] = {"netStats"};
	};
	class Location_enter
	{
		title = "Location: %1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "You are entering a zone: %1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	class Location_leave
	{
		title = "Location: %1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "You are leaving a zone: %1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	class US_takencontrol
	{
		title = "Captured: %1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\markers\military\flag_CA.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Friendly forces have seized control of %1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0,1,0,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	class US_lostcontrol
	{
		title = "Lost: %1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "The US forces have lost control of %1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,0,0,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	class task_echec
	{
		title = "Mission failed"; // Tile displayed as text on black background. Filled by arguments.
    iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
    color[] = {1,0.3,0.2,1};
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
	class CPadded
	{
		title = "CP Bonus: Zone captured";
		iconText = "+%1";
		description = "Received additional CP for capturing a zone";
		color[] = {0.5,1,1,1};
		priority = 0;
		difficulty[] = {};
	};
	class CPadded_retaken
	{
		title = "CP Bonus: Zone recaptured";
		iconText = "+%1";
		description = "Received CP for recapturing a zone";
		color[] = {0.5,1,1,1};
		priority = 0;
		difficulty[] = {};
	};
	class CPaddedmission
	{
		title = "CP Bonus: side mission completed";
		iconText = "+%1";
		description = "Bonus CP for accomplishing a mission";
		color[] = {0.5,1,1,1};
		priority = 0;
		difficulty[] = {};
	};
		class CPzonehold
	{
		title = "CP Bonus: Zones under control";
		iconText = "+%1";
		description = "Received additional CP for controlling %2 zones";
		color[] = {0.5,1,1,1};
		priority = 0;
		difficulty[] = {};
	};
		class info
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0,0.7,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
			class artyicon
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
				class sitrepinfo
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
					class armory
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\Sniper_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
					class pflir
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\Thermal_imaging_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
					class veh_refit_hint
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\VehicleAmmo_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
					class new_ability
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\Commanding_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0.67,0.87,0,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
					class inf_training
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};	
					class operator_healed
	{
		title = "Operator ready"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\gui\cfg\hints\BasicStances_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Operative %1 is healed and ready for deployment"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0.39,0.82,0.96,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};	

};
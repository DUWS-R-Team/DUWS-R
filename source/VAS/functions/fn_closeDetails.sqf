/*
	File: fn_closeDetails.sqf
	Author: TAW_Tonic
	
	Description:
	Quick like Macro for closing the details menu, doesn't work within macros.sqf
*/
#include "macro.sqf"
ctrlShow [VAS_detail_mags_list,false];
ctrlShow[VAS_detail_mags,false];
ctrlShow [VAS_detail_magsbg,false];
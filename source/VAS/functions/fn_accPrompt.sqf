#include "macro.sqf"
/*
	@version: 2.0
	@file_name: fn_accPrompt.sqf
	@file_author: TAW_Tonic
	@file_edit: 9/25/2013
	@file_description: Work-around for displaying attachment choice prompt and localizing it.
*/
createDialog "VAS_prompt";
disableSerialization;

waitUntil {!isNull (findDisplay VAS_prompt_Display)};
(VAS_getControl(VAS_prompt_Display,VAS_prompt_text)) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1</t></t><br/><t align='center'><t size='0.6'>%2</t></t>",localize "STR_VAS_Prompt_acc1", localize "STR_VAS_Prompt_acc2"];
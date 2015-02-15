/*
	File: fn_quickAttachment.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Quickly adds an attachment from the attachment list dialog.
*/
private["_data"];
_data = (_this select 0) lbData (_this select 1);
[_data,true,false,true,false] call VAS_fnc_handleItem;
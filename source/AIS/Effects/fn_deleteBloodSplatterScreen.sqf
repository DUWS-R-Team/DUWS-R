/*
 * Author: Psycho
 
 * Remove post process blood effects.
 
 * Arguments:
	-
 
 * Return value:
	-
*/
disableSerialization;
params ["_texLower", "_texMiddle", "_texUpper"];

_texLower ctrlsetfade 1;
_texMiddle ctrlsetfade 1;
_texUpper ctrlsetfade 1;

_texUpper ctrlcommit 1.5;
sleep 1;
_texMiddle ctrlcommit 1;
sleep 0.5;
_texLower ctrlcommit 0.8;


true
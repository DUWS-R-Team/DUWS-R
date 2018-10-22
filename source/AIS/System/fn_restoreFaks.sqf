/*
 * Author: Alwarren
   Changed: Psycho
 
 * Re-Add first aid and Medikits.
 
 * Arguments:
	0: Unit (Object)
	
 * Example:
	[player] call AIS_System_fnc_restoreFaks;
 
 * Return value:
	-
*/

params ["_unit"];
private _items = _unit getVariable ["AIS_MedicalStore", [0,0,0,0]];


for "_i" from 1 to (_items select 0) do {_unit addItemToUniform "FirstAidKit"};

for "_i" from 1 to (_items select 1) do {_unit addItemToVest "FirstAidKit"};	

for "_i" from 1 to (_items select 2) do {_unit addItemTobackpack "FirstAidKit"};

for "_i" from 1 to (_items select 3) do {_unit addItem "Medikit"};


_unit setVariable ["AIS_MedicalStore", [0,0,0,0], true];


true
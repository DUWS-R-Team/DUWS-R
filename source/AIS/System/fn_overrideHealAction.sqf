/*
 * Author: Psycho
 
 * Override the heal action if the unit is unconscious.
 * This is called by a inGameUISetEventHandler. This isnt a stackable EH. This mean it will maybe be overriden by a mod or some 3rd party scripts!
 
 * Arguments:
	0: Unit (Object)
	1: Unit (Object)
	2: Index (Number)
	3: Action (String)
 
 * Return value:
	Bool - true to block the engine handling, false to do the engine action
*/


params ["_injured", "_caller", "_index", "_action"];

private _back = false;
if (_action isEqualTo "HealSoldier") then {
	if (_injured getVariable ["ais_unconscious", false]) then {
		_txt = if (_injured getVariable ["ais_stabilized", false]) then {
			"First you have to Revive the injured."
		} else {
			"First you have to Stabilize the injured."
		};
		_txt call AIS_Core_fnc_dynamicText;
		_back = true;
	};

};


_back
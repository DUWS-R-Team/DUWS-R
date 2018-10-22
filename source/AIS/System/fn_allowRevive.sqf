/*
 * Author: Psycho
 
 * Check Unit if Revive is possible. If yes, Revive-Action is shown up.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Bool
 */

private _target = _this;

_isUnc = _target getVariable ["ais_unconscious",false];
_isStabil = _target getVariable ["ais_stabilized",false];
_isUncHealer = player getVariable ["ais_unconscious",false];
_noHealer = isNull (_target getVariable ['ais_hasHelper', objNull]);
_noDrag = isNull (_target getVariable ['ais_DragDrop_Player', objNull]);
_noDraging = isNull (player getVariable ['ais_DragDrop_Torso', objNull]);

private _station = true;
if (count AIS_MEDEVAC_STATIONS > 0) then {
	_station = [player, _target] call AIS_System_fnc_medEvacArea;
};


_is_able_to_do = switch (AIS_MEDICAL_EDUCATION) do {
	case (0) : {true};
	case (1) : {(items player) find "FirstAidKit" > -1 || {(items player) find "Medikit" > -1}};
	case (2) : {player call AIS_System_fnc_isMedic};
	default {true};
};


_return = if (

	_isUnc &&
	{_isStabil} &&
	{!_isUncHealer} &&
	{alive _target} &&
	{_noHealer} &&
	{_noDrag} &&
	{_noDraging} &&
	{_is_able_to_do} &&
	{_station}
	
) then {true} else {false};




_return
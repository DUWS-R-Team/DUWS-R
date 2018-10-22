/*
	["Mein Text"] call AIS_Core_fnc_dynamicText;
*/

_text = _this param [0,"",["",{}]];

_text = "<t size='0.8' shadow='1'>" + _text + "</t>";
[_text, (safeZoneX - 0.15), (safeZoneY + 0.3), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;

true
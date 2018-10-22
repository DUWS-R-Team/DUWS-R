// by psycho
private _title = _this select 0;
_value = _this select 1;

disableSerialization;
private _progressTitle = uiNamespace getVariable "AIS_Core_Progress_ProgressTitle";

_sitrepArray = toArray format [" ....%1", str (round (_value * 100)) + "%"];
{_sitrepArray set [_foreachindex, toString [_x]]} foreach _sitrepArray;
_sitrep = "";
_sitrepFormat = "<t align='left' shadow='1'>" + _title + ":%1</t>";

for "_i" from 0 to (count _sitrepArray - 1) do {
	_letter = _sitrepArray select _i;
	_delay = if (_letter == "|") then {_letter = "<br />"; 1} else {0.02};
	_sitrep = _sitrep + _letter;
	_text = parseText format [_sitrepFormat, _sitrep + "_"];

	_progressTitle ctrlSetText str(_text);
	sleep _delay;
};
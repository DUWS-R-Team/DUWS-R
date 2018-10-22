/*
 * Author: Joris-Jan van 't Land (based on work in fn_timeToString)
 * Changed: Psycho (snip out only the needed lines...)
 
 * Convert seconds to formatted string.
 
 * Arguments:
	_this select 0: <scalar> time in seconds
 
 * Return value:
	String
*/

_sec = _this param [0, 0, [0]];

_sec = _sec % 60;
_sec = floor (_sec);
_sec = (if (_sec <= 9) then {"0"} else {""}) + (str _sec);

_time = format ["%1", _sec];


_time
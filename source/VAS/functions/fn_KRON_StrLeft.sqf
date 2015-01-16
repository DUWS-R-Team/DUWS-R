/*
	Kronzky StrLeft Function
*/
private["_in","_len","_arr","_out"];
_in=_this select 0;
_len=(_this select 1)-1;
_arr=[_in] call VAS_fnc_KRON_StrToArray;
_out="";
if (_len>=(count _arr)) then {
	_out=_in;
} else {
	for "_i" from 0 to _len do {
	_out=_out + (_arr select _i);
	};
};
_out
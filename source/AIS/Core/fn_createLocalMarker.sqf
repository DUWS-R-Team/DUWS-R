// ["my marker",  position player, "ICON", "ColorRed", [0.5,0.5]] call AIS_Core_fnc_createLocalMarker;

params [
	["_name","",[""]],
	["_pos",[0,0],[[]]],
	["_shape","ICON",[""]],
	["_color","Default",[""]],
	["_size",[1,1],[[]]],
	["_text","",[""]],
	["_dir",0,[0]],
	["_type","mil_dot",[""]],
	["_brush","",[""]]
];

private _marker = createMarkerLocal [_name, _pos];

_marker setMarkerShapeLocal _shape;
_marker setMarkerColorLocal _color;
_marker setMarkerSizeLocal _size;
_marker setMarkerTextLocal _text;
_marker setMarkerDirLocal _dir;
_marker setMarkerTypeLocal _type;
if (_brush != "") then {_marker setMarkerBrushLocal _brush};


_marker
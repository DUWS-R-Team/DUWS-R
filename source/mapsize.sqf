_unit = _this select 0;
_debug = _this select 1;

private ["_grid_size"];
disableserialization;

openMap [true, false];
WaitUntil {visibleMap};

x_mapsize = 0;
y_mapsize = 0;

_Map_display = findDisplay 12;
_map_cntrl = _Map_display displayCtrl 51;
// Temporarily zoom out as much as possible and measure the screen.
_map_cntrl ctrlMapAnimAdd [0, 1000, [9999999999, 9999999999]];
ctrlMapAnimCommit _map_cntrl;
waitUntil {ctrlMapAnimDone _map_cntrl};
_zoom_max = ctrlMapScale _map_cntrl;
_limit = _map_cntrl ctrlMapScreenToWorld [0.5, 0.5];
x_mapsize = _limit select 0;
y_mapsize = _limit select 1;


_Map_display = findDisplay 12;
_map_cntrl = _Map_display displayCtrl 51;
_map_cntrl ctrlmapAnimAdd [0, 1000, [x_mapsize/2, y_mapsize/2]];
ctrlMapAnimCommit _map_cntrl;
waitUntil {ctrlMapAnimDone _map_cntrl};

openMap [false, false]; 

// by Kempco

// get center of map:
_x_center = x_mapsize/2;
_y_center = y_mapsize/2;
center_of_map = [_x_center,_y_center];

if (_x_center > _y_center) then {
half_of_map = _x_center
}
else
{
half_of_map = _y_center
};

publicVariable "center_of_map";
publicVariable "half_of_map";
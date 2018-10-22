
while {alive hq_blu1} do {
    waitUntil {sleep 2; player distance hq_blu1 < 15};
    _addStackedEHfnc = ["draw_hq_icon", "onEachFrame", "duws_fnc_drawIconFnc"] call BIS_fnc_addStackedEventHandler;
    sleep 0.1;
	
    waitUntil {sleep 0.2; player distance hq_blu1 > 15};
    _removeStackedEHfnc = [_addStackedEHfnc, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    onEachFrame {};
};
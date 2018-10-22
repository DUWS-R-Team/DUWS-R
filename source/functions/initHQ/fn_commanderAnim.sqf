params ["_unit"];
private _animations = ["HubBriefing_lookAround1","HubBriefing_lookAround2","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_talkAround","HubBriefing_think"];
while {alive _unit} do {
	_unit switchMove selectRandom _animations;
	sleep 15;
};
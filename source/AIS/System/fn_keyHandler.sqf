/*
 * Author: Psycho
 
 * unbind some key functions while the player is unconcious.
	--> Block the following actions: reload, inventory, weapon change, diary and map, chat, get in/out of a vehicle, throw grenades, open curator interface, eject a vehicle
* Also it handle some special key functions.
	--> press "H" for calling help while unconscious
 
 * Arguments:
	1: Key (Number)
 
 * Return value:
	Bool
*/


private _keyDown = _this select 1;
private _return = false;

if !(player getVariable ['ais_unconscious', false]) exitWith {false};

if (_keyDown isEqualTo 1) then {[] spawn AIS_System_fnc_disableRespawnButton};	// key "Esc" --> disable Respawn Button

if (_keyDown isEqualTo 35) then {[player] call AIS_System_fnc_callHelp};	// key "H" --> call for Help


// vehicle actions
if (!(isNull objectParent player)) then {
	//hint format ["%1", _keyDown];
	{
		if (_keyDown in (actionKeys _x)) exitWith {
			_return = true;
		};
		Nil
	} count ['CarForward','CarBack','HeliCyclicForward','HeliLeft','HeliRudderLeft','HeliRight','HeliRudderRight','AutoHover','CarFastForward','CarSlowForward','submarineForward','submarineBack','SwitchWeapon'];
};

{
	if (_keyDown in (actionKeys _x)) exitWith {
		if (AIS_NO_CHAT && {_keyDown in (actionKeys 'Chat')}) then {
			["Chat disabled."] call AIS_Core_fnc_dynamicText;
		};
		_return = true;
	};
	Nil
} count ['ReloadMagazine','Gear','SwitchWeapon','Diary','DeployWeaponAuto','Chat','Throw','ShowMap','turnIn','turnOut','curatorInterface','Eject'];


_return
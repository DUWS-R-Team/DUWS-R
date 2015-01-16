_object = _this select 0; 
_music_list = ["RadioAmbient1",
"RadioAmbient2",
"RadioAmbient3",
"RadioAmbient4",
"RadioAmbient5",
"RadioAmbient6",
"RadioAmbient7",
"RadioAmbient8",
"RadioAmbient9",
"RadioAmbient10",
"RadioAmbient11",
"RadioAmbient12",
"RadioAmbient13",
"RadioAmbient14",
"RadioAmbient15",
"RadioAmbient16",
"RadioAmbient17",
"RadioAmbient18",
"RadioAmbient19",
"RadioAmbient20",
"RadioAmbient21",
"RadioAmbient22",
"RadioAmbient23",
"RadioAmbient24",
"RadioAmbient25",
"RadioAmbient26",
"RadioAmbient27",
"RadioAmbient28",
"RadioAmbient29",
"RadioAmbient30"];
              
_tracksAmountIndexed = (count _music_list) - 1;


sleep 2;
while {true} do {
if (!alive _object OR isNull _object) exitWith {};
player sidechat "lol";

_dice = round random _tracksAmountIndexed;

_pickedTrack = _music_list select _dice;

_object say3D "RadioAmbient30";
sleep 7;

};
_length = _this select 0;


_operation = "Operation ";
_first = "--blank--";

if (_length==0) then {
_first_found = false;
_first_dice = round (random 52);
if (_first_dice<=1 AND !_first_found) then {_first_found=true;_first="Homing "};      // 1
if (_first_dice==2 AND !_first_found) then {_first_found=true;_first="Flaming "};     // 2
if (_first_dice==3 AND !_first_found) then {_first_found=true;_first="Screaming "};   // 3
if (_first_dice==4 AND !_first_found) then {_first_found=true;_first="Final "};       // 4
if (_first_dice==5 AND !_first_found) then {_first_found=true;_first="Fiery "};      // 5
if (_first_dice==6 AND !_first_found) then {_first_found=true;_first="Brave "};     // 6
if (_first_dice==7 AND !_first_found) then {_first_found=true;_first="Hardened "};   // 7
if (_first_dice==8 AND !_first_found) then {_first_found=true;_first="Crazy "};       // 8
if (_first_dice==9 AND !_first_found) then {_first_found=true;_first="Last "};      // 9
if (_first_dice==10 AND !_first_found) then {_first_found=true;_first="Raging "};     // 10
if (_first_dice==11 AND !_first_found) then {_first_found=true;_first="Blazing "};   // 11
if (_first_dice==12 AND !_first_found) then {_first_found=true;_first="Covered "};       // 12
if (_first_dice==13 AND !_first_found) then {_first_found=true;_first="Smoking "};      // 13
if (_first_dice==14 AND !_first_found) then {_first_found=true;_first="Firing "};     // 14
if (_first_dice==15 AND !_first_found) then {_first_found=true;_first="Mobile "};   // 15
if (_first_dice==16 AND !_first_found) then {_first_found=true;_first="Crimson "};       // 16
if (_first_dice==17 AND !_first_found) then {_first_found=true;_first="Broken "};       // 17
if (_first_dice==18 AND !_first_found) then {_first_found=true;_first="Lightning "};       // 18
if (_first_dice==19 AND !_first_found) then {_first_found=true;_first="Surviving "};       // 19
if (_first_dice==20 AND !_first_found) then {_first_found=true;_first="Enduring "};       // 20
if (_first_dice==21 AND !_first_found) then {_first_found=true;_first="Hunting "};       // 21
if (_first_dice==22 AND !_first_found) then {_first_found=true;_first="Killing "};       // 22
if (_first_dice==23 AND !_first_found) then {_first_found=true;_first="Fragging "};       // 23
if (_first_dice==24 AND !_first_found) then {_first_found=true;_first="Overwhelming "};       // 24
if (_first_dice==25 AND !_first_found) then {_first_found=true;_first="Thrusting "};       // 25
if (_first_dice==26 AND !_first_found) then {_first_found=true;_first="Lone "};       // 26
if (_first_dice==27 AND !_first_found) then {_first_found=true;_first="Armed "};       // 27
if (_first_dice==28 AND !_first_found) then {_first_found=true;_first="Banned "};       // 28
if (_first_dice==29 AND !_first_found) then {_first_found=true;_first="Sleeping "};       // 29
if (_first_dice==30 AND !_first_found) then {_first_found=true;_first="Retired "};       // 30
if (_first_dice==31 AND !_first_found) then {_first_found=true;_first="Retaliating "};       // 31
if (_first_dice==32 AND !_first_found) then {_first_found=true;_first="Rushing "};       // 32
if (_first_dice==33 AND !_first_found) then {_first_found=true;_first="Burning "};       // 33
if (_first_dice==34 AND !_first_found) then {_first_found=true;_first="Striking "};       // 34
if (_first_dice==35 AND !_first_found) then {_first_found=true;_first="Sweeping "};       // 35
if (_first_dice==36 AND !_first_found) then {_first_found=true;_first="Masterful "};       // 36
if (_first_dice==37 AND !_first_found) then {_first_found=true;_first="Mourning "};       // 37
if (_first_dice==38 AND !_first_found) then {_first_found=true;_first="Black "};       // 38
if (_first_dice==39 AND !_first_found) then {_first_found=true;_first="Yellow "};       // 39
if (_first_dice==40 AND !_first_found) then {_first_found=true;_first="Purple "};       // 40
if (_first_dice==41 AND !_first_found) then {_first_found=true;_first="Turquoise "};       // 41
if (_first_dice==42 AND !_first_found) then {_first_found=true;_first="Red "};       // 42
if (_first_dice==43 AND !_first_found) then {_first_found=true;_first="Green "};       // 43
if (_first_dice==44 AND !_first_found) then {_first_found=true;_first="Blue "};       // 44
if (_first_dice==45 AND !_first_found) then {_first_found=true;_first="Smashing "};       // 45
if (_first_dice==46 AND !_first_found) then {_first_found=true;_first="Drowned "};       // 46
if (_first_dice==47 AND !_first_found) then {_first_found=true;_first="Swift "};       // 47
if (_first_dice==48 AND !_first_found) then {_first_found=true;_first="Courageous "};       // 48
if (_first_dice==49 AND !_first_found) then {_first_found=true;_first="Fearful "};       // 49
if (_first_dice==50 AND !_first_found) then {_first_found=true;_first="Barking "};       // 50
if (_first_dice==51 AND !_first_found) then {_first_found=true;_first="Ruthless "};       // 51
if (_first_dice==52 AND !_first_found) then {_first_found=true;_first="Rightful "};       // 52
};





_second = "--blank--";
_second_found = false;
_second_dice = round (random 67);
if (_second_dice<=1 AND !_second_found) then {_second_found=true;_second="Switchblade"};      // 1
if (_second_dice==2 AND !_second_found) then {_second_found=true;_second="Knight"};          // 2
if (_second_dice==3 AND !_second_found) then {_second_found=true;_second="Guardian"};      // 3
if (_second_dice==4 AND !_second_found) then {_second_found=true;_second="Trident"};       // 4
if (_second_dice==5 AND !_second_found) then {_second_found=true;_second="Wraith"};      // 5
if (_second_dice==6 AND !_second_found) then {_second_found=true;_second="Rage"};          // 6
if (_second_dice==7 AND !_second_found) then {_second_found=true;_second="Hawk"};      // 7
if (_second_dice==8 AND !_second_found) then {_second_found=true;_second="Thunder"};       // 8
if (_second_dice==9 AND !_second_found) then {_second_found=true;_second="Poltergeist"};       // 9
if (_second_dice==10 AND !_second_found) then {_second_found=true;_second="Steel"};       // 10
if (_second_dice==11 AND !_second_found) then {_second_found=true;_second="Grave"};       // 11
if (_second_dice==12 AND !_second_found) then {_second_found=true;_second="Shield"};       // 12
if (_second_dice==13 AND !_second_found) then {_second_found=true;_second="Iron"};       // 13
if (_second_dice==14 AND !_second_found) then {_second_found=true;_second="Assault"};       // 14
if (_second_dice==15 AND !_second_found) then {_second_found=true;_second="Arrow"};       // 15
if (_second_dice==16 AND !_second_found) then {_second_found=true;_second="Bolt"};       // 16
if (_second_dice==17 AND !_second_found) then {_second_found=true;_second="Freedom"};       // 17
if (_second_dice==18 AND !_second_found) then {_second_found=true;_second="Sword"};       // 18
if (_second_dice==19 AND !_second_found) then {_second_found=true;_second="Lance"};       // 19
if (_second_dice==20 AND !_second_found) then {_second_found=true;_second="Witch"};       // 20
if (_second_dice==21 AND !_second_found) then {_second_found=true;_second="Nightmare"};       // 21
if (_second_dice==22 AND !_second_found) then {_second_found=true;_second="Force"};       // 22
if (_second_dice==23 AND !_second_found) then {_second_found=true;_second="Lion"};       // 23
if (_second_dice==24 AND !_second_found) then {_second_found=true;_second="Claw"};       // 24
if (_second_dice==25 AND !_second_found) then {_second_found=true;_second="Wolf"};       // 25
if (_second_dice==26 AND !_second_found) then {_second_found=true;_second="Blade"};       // 26
if (_second_dice==27 AND !_second_found) then {_second_found=true;_second="Sabre"};       // 27
if (_second_dice==28 AND !_second_found) then {_second_found=true;_second="Warrior"};       // 28
if (_second_dice==29 AND !_second_found) then {_second_found=true;_second="God"};       // 29
if (_second_dice==30 AND !_second_found) then {_second_found=true;_second="Cannon"};       // 30
if (_second_dice==31 AND !_second_found) then {_second_found=true;_second="Vengeance"};       // 31
if (_second_dice==32 AND !_second_found) then {_second_found=true;_second="Dagger"};       // 32
if (_second_dice==33 AND !_second_found) then {_second_found=true;_second="Fist"};       // 33
if (_second_dice==34 AND !_second_found) then {_second_found=true;_second="Warlock"};       // 34
if (_second_dice==35 AND !_second_found) then {_second_found=true;_second="Copper"};       // 35
if (_second_dice==36 AND !_second_found) then {_second_found=true;_second="Bronze"};       // 36
if (_second_dice==37 AND !_second_found) then {_second_found=true;_second="Talon"};       // 37
if (_second_dice==38 AND !_second_found) then {_second_found=true;_second="Viper"};       // 38
if (_second_dice==39 AND !_second_found) then {_second_found=true;_second="Cobra"};       // 39
if (_second_dice==40 AND !_second_found) then {_second_found=true;_second="Falcon"};       // 40
if (_second_dice==41 AND !_second_found) then {_second_found=true;_second="Eagle"};       // 41
if (_second_dice==42 AND !_second_found) then {_second_found=true;_second="Onslaught"};       // 42
if (_second_dice==43 AND !_second_found) then {_second_found=true;_second="Phoenix"};       // 43
if (_second_dice==44 AND !_second_found) then {_second_found=true;_second="Raven"};       // 44
if (_second_dice==45 AND !_second_found) then {_second_found=true;_second="Dragon"};       // 45
if (_second_dice==46 AND !_second_found) then {_second_found=true;_second="Crusader"};       // 46
if (_second_dice==47 AND !_second_found) then {_second_found=true;_second="Devil"};       // 47
if (_second_dice==48 AND !_second_found) then {_second_found=true;_second="Angel"};       // 48
if (_second_dice==49 AND !_second_found) then {_second_found=true;_second="Hammer"};       // 49
if (_second_dice==50 AND !_second_found) then {_second_found=true;_second="Cleaver"};       // 50
if (_second_dice==51 AND !_second_found) then {_second_found=true;_second="Nova"};       // 51
if (_second_dice==52 AND !_second_found) then {_second_found=true;_second="Marauder"};       // 52
if (_second_dice==53 AND !_second_found) then {_second_found=true;_second="Dart"};       // 53
if (_second_dice==54 AND !_second_found) then {_second_found=true;_second="Rodent"};       // 54
if (_second_dice==55 AND !_second_found) then {_second_found=true;_second="Swordfish"};       // 55
if (_second_dice==56 AND !_second_found) then {_second_found=true;_second="Boar"};       // 56
if (_second_dice==57 AND !_second_found) then {_second_found=true;_second="Rhino"};       // 57
if (_second_dice==58 AND !_second_found) then {_second_found=true;_second="Shark"};       // 58
if (_second_dice==59 AND !_second_found) then {_second_found=true;_second="Goul"};       // 59
if (_second_dice==60 AND !_second_found) then {_second_found=true;_second="Anvil"};       // 60
if (_second_dice==61 AND !_second_found) then {_second_found=true;_second="Star"};       // 61
if (_second_dice==62 AND !_second_found) then {_second_found=true;_second="Sun"};       // 62
if (_second_dice==63 AND !_second_found) then {_second_found=true;_second="Morgenstern"};       // 63
if (_second_dice==64 AND !_second_found) then {_second_found=true;_second="Gladius"};       // 64
if (_second_dice==65 AND !_second_found) then {_second_found=true;_second="Chieftain"};       // 65
if (_second_dice==66 AND !_second_found) then {_second_found=true;_second="Spirit"};       // 66
if (_second_dice==67 AND !_second_found) then {_second_found=true;_second="Paladin"};       // 67


if (_length==1) exitWith {
_second
};

if (_length==0) then {
_gen_operation_fullname = _operation+_first+_second;
_gen_operation_fullname
};




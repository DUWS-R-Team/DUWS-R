/*
 * Author: psycho
 
 * Diary entry.
 
 * Arguments:
	-
 
 * Return value:
	Bool
 */

private _who_can_revive = switch (AIS_MEDICAL_EDUCATION) do {
	case (0) : {"Everyone can revive"};
	case (1) : {"Everybody with a First Aid Kit or Medkit"};
	case (2) : {"Only medics can revive"};
};
private _revive_guaranty = if (AIS_REVIVE_GUARANTY) then {"You are protected from insta-death"} else {"Heavy damage can end in insta-death"};
private _revive_heal = if (AIS_REVIVE_HEAL) then {"completely healed"} else {"separately healing action needed"};

_subject = player createDiarySubject ["ais_settings", "AIS Settings"];
_log_briefing = player createDiaryRecord ["ais_settings", ["Medical Education", "
<font face='PuristaMedium' size=15 color='#8E8E8E'>Who can revive: </font>" + _who_can_revive]];
_log_briefing = player createDiaryRecord ["ais_settings", ["Heavy Damage Handling", "
<font face='PuristaMedium' size=15 color='#8E8E8E'>Revive Chance: </font>" + _revive_guaranty]];
_log_briefing = player createDiaryRecord ["ais_settings", ["Bleedout Time",
format ["<font face='PuristaMedium' size=15 color='#8E8E8E'>Average Bleedout Time: </font>%1", AIS_BLEEDOUT_TIME]]];
_log_briefing = player createDiaryRecord ["ais_settings", ["Healing Status", "
<font face='PuristaMedium' size=15 color='#8E8E8E'>Damage status after revive: </font>" + _revive_heal]];

_subject = player createDiarySubject ["ais", "First Aid System"];
_log_briefing = player createDiaryRecord ["ais", ["About and Credits", "
<font face='PuristaMedium' size=18 color='#ffffff'>Made by: </font><font face='PuristaMedium' size=25 color='#8E8E8E'>Psychobastard</font><br/>
<font face='PuristaMedium' size=18 color='#ffffff'>Version: </font><font face='PuristaMedium' size=20 color='#ffffff'>3072018</font><br/><br/>

<font face='PuristaMedium' size=30 color='#014EE3'>Credits</font><br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>BonInf*</font> for the first multiplayer compatible version (Arma 2)<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>BI</font> for the design idea (Wounding module Arma 2)<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>Alwarren</font> for his feedback and fixes<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>Lukio</font> for his text revisions and better translations<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>NetFusion</font> for the way of handling interactions<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>ACE3 Team</font> for damage handling of droping units<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>CBA Team</font> for some functions
"]];

_log_briefing = player createDiaryRecord ["ais", ["Instructions", "
<font face='PuristaMedium' size=22 color='#014EE3'>If you are unconscious:</font><br/>
- <font face='PuristaMedium' size=15 color='#8E8E8E'>Press 'FORWARD'</font> to go prone and fire your current weapon.<br/><br/>
- You can <font face='PuristaMedium' size=15 color='#8E8E8E'>CRAWL</font> to a safe position.<br/><br/>
- <font face='PuristaMedium' size=15 color='#8E8E8E'>Press 'H'</font> key to call friendly AI for help.<br/><br/><br/><br/>

<font face='PuristaMedium' size=22 color='#014EE3'>How to give first aid:</font><br/>
- Move close to an unconscious unit and select <font face='PuristaMedium' size=15 color='#8E8E8E'>'Stabilize'</font> to stop heavy bleeding. This will prevent the injured unit from bleedout. (death)<br/><br/>
- Move close to an unconscious unit and select <font face='PuristaMedium' size=15 color='#8E8E8E'>'First Aid'</font> to revive the unit.<br/><br/>
- If it is needed and you want to <font face='PuristaMedium' size=15 color='#8E8E8E'>'Abbort'</font> a revive process, simply press 'ESC' Button.<br/><br/>
- Move close to an unconscious unit and select <font face='PuristaMedium' size=15 color='#8E8E8E'>'Drag'</font> to drag the body out of the line of fire (Mousewheel menu).<br/><br/>
- While you are dragging a unit, you can select <font face='PuristaMedium' size=15 color='#8E8E8E'>'Carry'</font> to carry the unit on your shoulders (better to cover long distances).<br/><br/>
- In some cases you need medical equipment (First Aid Kit or Medkit) or must be a medic to start the 'First aid' action.
"]];

_log_briefing = player createDiaryRecord ["ais", ["About wounding / death:", "
If a unit receives too much damage, the unit goes unconscious. This means that the unit starts to bleed out and needs help from other units.<br/><br/>
If someone comes to help, he can stop the bleeding to prevent the injured from bleeding out and die. After the unit is stabilized you can start the first aid process to revive the unit. After a unit is revived maybe they need a regular healing process too.<br/><br/>
If nobody comes to help the unit eventually bleeds out. The time depends on the amount of damage the unit received. Everyone can stabilize unconscious units. The ability to start the first aid process can depend on the medical education. (medic or not, medical equipment)<br/><br/>
It is possible to load/unload wounded units in vehicles to bring them out of a dangerous area or evacuate them to a field hospital.
"]];

_log_briefing = player createDiaryRecord ["ais", ["Description", "
<font face='PuristaMedium' size=30 color='#014EE3'>Psycho's Wounding System</font><br/><br/>
This First Aid System (AIS = Alternative Injury System) is an alternative system to all the current normal revive scripts.<br/><br/>
The main difference to a standard revive system is that the unit does not die before going into a state of agony. If critical damage level is reached, the unit goes unconscious and does not immediately die like in most other systems. The advantage: You can use it in missions without a revive option as well!<br/><br/>
Another advantage of the system is that if a unit is gravely wounded and waiting for others to help, the wounded unit is not completely defenseless. A wounded unit can go prone, crawl and use a weapon as last stand (until the magazine is empty).
AIS also supports AI. AI soldiers can be unconscious or give first aid as well.
"]];


true
	//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var c = GameManager.cutsceneDebug;
var player = instance_find(objPlayer,0);

//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emote,false,sprPlayerEmote_________,1.0,noone,noone,noone);					//emote (NOT IN YET) over 1 sec
scr_cutsceneCommand_add(cutsceneCommand.waitTime,1.6,noone,noone,noone,noone,noone,noone,noone);															//wait till 1.6 sec have passed
if c message_feed_add("Player performs some emote (needs asset); 1.6s",noone);

scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,player,noone,noone,noone,noone,noone,noone,noone);														//wait till player finished and idle
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emote,true,sprPlayerEmoteLyingFaceDownStand,1.0,noone,noone,noone);				//command player override: stand up over 1 sec
scr_cutsceneCommand_add(cutsceneCommand.waitTime,4.0,noone,noone,noone,noone,noone,noone,noone);															//wait till 4.0 sec have passed
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emoteCyclic,false,sprPlayerEmoteLyingFaceDown,999,noone,noone,noone);			//command player: laying down for 999s
scr_cutsceneCommand_add(cutsceneCommand.fadeIn,c_black,0.7,noone,noone,noone,noone,noone,noone);															//fade in over 0.7 sec
if c message_feed_add("Fade in; 0.7s. Player laying face down; 4s. Then stands; 1s",noone);
	//world code
WorldCache.events[? 0] = false;
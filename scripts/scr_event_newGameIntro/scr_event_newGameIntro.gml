	//description
//intro cutscene, may later invovle dialog with brother. for now  its just some emotes
	//script
//Player performs some emote (needs asset); 1.6s
//Fade in; 0.7s. Player laying face down; 4s. Then stands; 1s
	
	//Cutscene Code
//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
	
var player = instance_find(objPlayer,0);

//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emote,false,sprPlayerEmote_________,1.0,noone,noone,noone);					//emote (NOT IN YET) over 1 sec
scr_cutsceneCommand_add(cutsceneCommand.waitTime,1.6,noone,noone,noone,noone,noone,noone,noone,"wait 1.6s; CUTSCENE INCOMPLETE");
scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,player,noone,noone,noone,noone,noone,noone,noone,"wait till player idle");
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emote,true,sprPlayerEmoteLyingFaceDownStand,1.0,noone,noone,noone,"emote player: stand up over 1 sec");
scr_cutsceneCommand_add(cutsceneCommand.waitTime,4.0,noone,noone,noone,noone,noone,noone,noone,"wait 4.0s");
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.emoteCyclic,false,sprPlayerEmoteLyingFaceDown,999,noone,noone,noone,"emote player cyclic: laying down for 999s");
scr_cutsceneCommand_add(cutsceneCommand.fadeIn,c_black,0.7,noone,noone,noone,noone,noone,noone,"fade in from black over 0.7s");

	//world code
WorldCache.events[? 0] = false;
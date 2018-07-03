	//description
//initializer for boss fight
	//script
//Command player to move into position and wait for completion
//wait 2.5s
//boss turn emote
//boss scream emote
//add world event kill condition and script to run
//resume

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantBound,0);

scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.runScriptRepeat,scr_event_townFirstEncounter_3_checker,noone,noone,noone,noone,noone,noone,"initialize world checker scr_event_townFirstEncounter_3_checker");
scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.enemyKilled,boss,noone,noone,noone,noone,noone,noone,"initialize world condition of wait till boss killed");
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//activate TEMPTEMPTEMP

//scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//wait till anims done
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,puppetCommand.emote,true,SPRITE,DURATION,noone,noone,noone,noone);// roar/scream animation
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,puppetCommand.emote,true,SPRITE,DURATION,noone,noone,noone,noone);// turn animation

scr_cutsceneCommand_add(cutsceneCommand.waitTime,2.5,noone,noone,noone,noone,noone,noone,noone,"wait 2.5s; BOSS EMOTES INCOMPLETE");
scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,player,noone,noone,noone,noone,noone,noone,noone,"wait till player idle");
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.moveTo,true,true,673,1,noone,noone,"command player to move into a position");
var c = GameManager.cutsceneDebug;
if c message_feed_add("Command player to move into position and wait for completion",noone);
if c message_feed_add("wait 2.5s",noone);
if c message_feed_add("boss turn emote",noone);
if c message_feed_add("boss scream emote",noone);
if c message_feed_add("add world event kill condition and script to run",noone);
if c message_feed_add("resume",noone);

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantBound,0);

scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.runScriptRepeat,scr_event_townFirstEncounter_3_checker,noone,noone,noone,noone,noone,noone);	//World script
scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.enemyKilled,boss,noone,noone,noone,noone,noone,noone);	//World condition 
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//activate TEMPTEMPTEMP

//scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//wait till anims done
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,puppetCommand.emote,true,SPRITE,DURATION,noone,noone,noone,noone);// roar/scream animation
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,puppetCommand.emote,true,SPRITE,DURATION,noone,noone,noone,noone);// turn animation

scr_cutsceneCommand_add(cutsceneCommand.waitTime,2.5,noone,noone,noone,noone,noone,noone,noone);
scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,player,noone,noone,noone,noone,noone,noone,noone);
scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,player,puppetCommand.moveTo,true,true,673,1,noone,noone);
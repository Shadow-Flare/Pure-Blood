var c = GameManager.cutsceneDebug;
if c message_feed_add("Transform enemy 3s; wait 0.5s",noone);
if c message_feed_add("repeat condition check (1: is player dead. 2: is boss dead.)",noone);
if c message_feed_add("## maybe add some form of player knockback and stun during transform?",noone);

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantBound,0);

//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//activate boss

scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.runScript,scr_event_townFirstEncounter_4_transformedCreate,noone,noone,noone,noone,noone,noone);
scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.runScriptRepeat,scr_event_townFirstEncounter_4_checker,noone,noone,noone,noone,noone,noone);	//World condition 
scr_cutsceneCommand_add(cutsceneCommand.waitTime,2.5,noone,noone,noone,noone,noone,noone,noone); //(WHILST CUTSCENE INCOMPLETE)
scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,boss,noone,noone,noone,noone,noone,noone,noone);
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,puppetCommand.emote,SPRITE,DURATION,noone,noone,noone,noone);	//transform animation
//scr_cutsceneCommand_add(cutsceneCommand.commandPuppet,boss,noone,noone,noone,noone,noone,noone,noone);	//deactivate boss
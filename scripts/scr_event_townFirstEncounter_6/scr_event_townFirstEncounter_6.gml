	//description
//Ghoul Defeated, player short cutscene where player loses anyway then go to inn (+reward when speaking to inquis)
	//script
//Player gets smacked back (detail needed)
//Inquisitors enter from left, fire holy magic into ghoul to keep it back
//ghoul is visibly weaker than the alternate route, inquisitor takes it out with relative ease
//some dialog
//Player is hit unconscious by an inquisitor and screen fades out

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objBloodHound,0);

with player
{
	phase = state.hitReaction;
	phaseTimer = 0;
	subPhase = subState.stunned;
	subPhaseTimer = 0;
	stunnedDuration = 999;
	
	facing = sign(boss.x-player.x);
	xSpd = -facing*10;
	ySpd = -1.9;
}

	//Create and command inquisitors
var inquisBoss = instance_create_layer(max(player.x-320,0)+48,656,"lay_entities",objInquisitorBoss);
var inquis1 = instance_create_layer(max(player.x-320,0)+32,656,"lay_entities",objInquisitorFootman);
var inquis2 = instance_create_layer(max(player.x-320,0),656,"lay_entities",objInquisitorFootman);

scr_puppetCommand_add(inquisBoss,puppetCommand.emote,false,false,sprInquisitorBossBodyAction,0.9,noone,noone,noone);
scr_puppetCommand_add(inquisBoss,puppetCommand.moveTo,false,false,true,player.x-12,1,noone,noone);

scr_puppetCommand_add(inquis1,puppetCommand.moveTo,false,true,true,player.x-40,1,noone,noone);

scr_puppetCommand_add(inquis2,puppetCommand.moveTo,false,true,true,player.x-52,1,noone,noone);

	//VVV BASIC STUFF, DOESNT MESH WITH ABOVE DESCRIPTION
scr_cutsceneCommand_add(cutsceneCommand.waitTime,4.0,noone,noone,noone,noone,noone,noone,noone,"wait 4s; CUTSCENE INCOMPLETE");
scr_cutsceneCommand_add(cutsceneCommand.holdFaded,c_black,4.0,noone,noone,noone,noone,noone,noone,"hold black for 4s");
scr_cutsceneCommand_add(cutsceneCommand.waitTime,0.7,noone,noone,noone,noone,noone,noone,noone,"wait 0.7s");
scr_cutsceneCommand_add(cutsceneCommand.fadeOut,c_black,0.7,noone,noone,noone,noone,noone,noone,"fade to black over 0.7s");
scr_cutsceneCommand_add(cutsceneCommand.waitTime,0.8,noone,noone,noone,noone,noone,noone,noone,"wait 0.8s");
scr_cutsceneCommand_add(cutsceneCommand.dialogWait,noone,noone,noone,noone,noone,noone,noone,noone,"wait till dialog finished");
scr_cutsceneCommand_add(cutsceneCommand.dialogInitiate,1,1,dialogType.speech,noone,noone,noone,noone,noone,"initiate success dialog");//
scr_cutsceneCommand_add(cutsceneCommand.waitTime,0.8,noone,noone,noone,noone,noone,noone,noone,"wait 0.8s");
scr_cutsceneCommand_add(cutsceneCommand.waitPuppet,inquisBoss,noone,noone,noone,noone,noone,noone,noone,"wait till boss inquis idle");
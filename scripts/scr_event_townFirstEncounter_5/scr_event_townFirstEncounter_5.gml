//description: Player defeated, cutscene then go to inn.

var c = GameManager.cutsceneDebug;
if c message_feed_add("Altered Player 'death' animation for now (possible just stunned)",noone);
if c message_feed_add("Inquisitors enter from left, fire bolts into ghoul to keep it back",noone);
if c message_feed_add("'notable' inquisitor runs to near the ghoul then kills it (detail needed)",noone);
if c message_feed_add("Player collapses and screen fades out",noone);

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantBound,0);

	//VVV BASIC STUFF, DOESNT MESH WITH ABOVE DESCRIPTION
if c message_feed_add("CUTSCENE INCOMPLETE.",noone);
scr_cutsceneCommand_add(cutsceneCommand.waitTime,2.4,noone,noone,noone,noone,noone,noone,noone);	//Wait 1.4 sec
scr_cutsceneCommand_add(cutsceneCommand.fadeOut,c_black,1.4,noone,noone,noone,noone,noone,noone);	//fadeout over 1.4s
//scr_cutsceneCommand_add(cutsceneCommand.commandWorldEvent,worldEventCommand.,noone,noone,noone,noone,noone,noone);	//disable enemy

	//Create and command inquisitors
var inquisBoss = instance_create_layer(max(player.x-320,0)+48,656,"lay_entities",objInquisitorBoss);
var inquis1 = instance_create_layer(max(player.x-320,0)+32,656,"lay_entities",objInquisitorFootman);
var inquis2 = instance_create_layer(max(player.x-320,0),656,"lay_entities",objInquisitorFootman);

scr_puppetCommand_add(inquisBoss,puppetCommand.moveTo,false,true,true,XPOSITION,1,noone,noone);
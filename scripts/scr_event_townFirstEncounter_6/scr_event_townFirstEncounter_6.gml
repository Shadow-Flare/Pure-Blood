//description: Ghoul Defeated, player short cutscene where player loses anyway then go to inn (+reward when speaking to inquis)

var c = GameManager.cutsceneDebug;
if c message_feed_add("Player gets smacked back (detail needed)",noone);
if c message_feed_add("Inquisitors enter from left, fire bolts into ghoul to keep it back",noone);
if c message_feed_add("ghoul is visibly weaker than the alternate route, inquisitor takes it out with relative ease",noone);
if c message_feed_add("Player is hit unconscious by an inquisitor and screen fades out",noone);

//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantBound,0);

	//VVV BASIC STUFF, DOESNT MESH WITH ABOVE DESCRIPTION
if c message_feed_add("CUTSCENE INCOMPLETE.",noone);
scr_cutsceneCommand_add(cutsceneCommand.fadeOut,c_black,1.4,noone,noone,noone,noone,noone,noone);	//fadeout over 1.4s
scr_cutsceneCommand_add(cutsceneCommand.waitTime,2.4,noone,noone,noone,noone,noone,noone,noone);	//Wait 2.4 sec
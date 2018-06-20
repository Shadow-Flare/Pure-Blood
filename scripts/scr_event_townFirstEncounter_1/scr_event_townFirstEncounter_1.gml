var c = GameManager.cutsceneDebug;

if c message_feed_add("Spawn zombies and miniboss",noone);
if c message_feed_add("Short dialog with brother (later)",noone);
//Cutscene Code
	//IN PRACTICE THE SEQUENCE OF EVENTS CAUSED BY THIS SCRIPT IS READ BOTTOM-TO-TOP
var player = instance_find(objPlayer,0);
var amb = ambushObject;
var bos = bossObject;

instance_create_layer(192,656,"lay_entities",objZombie);
instance_create_layer(511,656,"lay_entities",objZombie);
with instance_create_layer(289,517,"lay_entities",objZombie)
{
	amb.zombie1 = id; 
	//make ambush
}
with instance_create_layer(495,485,"lay_entities",objZombie)
{
	facing = -1;
	amb.zombie2 = id; 
	//make ambush
}
with instance_create_layer(816,656,"lay_entities",objServantGuard) 
{
	facing = -1;
	bos.miniBoss = id;
	//make ghoul, with animation in wait
}
	//Checks to see if player is near boss' corpse, then execute next event
var player = instance_find(objPlayer,0);
var boss = instance_find(objBloodHound,0);

boss.image_alpha = 1.0;

if point_distance(player.x,player.y,boss.x,boss.y) < 24
{
	scr_event_townFirstEncounter_6();
	return true;
}
return false;
	//Checks to see if boss or player dies, then runs the appropriate cutscene initializer script.
var player = instance_find(objPlayer,0);
var boss = instance_find(objServantGuard,0);

if instance_exists(boss)
{
	if boss.isDead
	{
		var stats = boss.statCache;
		boss.isDead = false;
		stats.hp = 1;
		//scr_worldEventCommand_add(worldEventCommand.runScript,scr_event_townFirstEncounter_4,noone,noone,noone,noone)
		scr_event_townFirstEncounter_4();
		return true;
	}
}
else
{
	show_debug_message("Event error: Player or boss nor correctly defined in 'scr_event_townFirstEncounter_3_checker'")
	return true;
}

return false;
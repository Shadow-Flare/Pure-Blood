	//Checks to see if boss or player dies, then runs the appropriate cutscene initializer script.
var player = instance_find(objPlayer,0);
var boss = instance_find(objBloodHound,0);

if instance_exists(player) && instance_exists(boss)
{
	if player.isDead
	{
		var stats = player.statCache;
		player.isDead = false;
		stats.hp = 1;
		player.phase = state.hitReaction;
		player.subPhase = subState.stunned;
		player.phaseTimer = 0;
		player.subPhaseTimer = 0;
		scr_event_townFirstEncounter_5();
		return true;
	}
	if boss.isDead
	{
		var stats = boss.statCache;
		boss.isDead = false;
		stats.hp = 1;
		scr_worldEventCommand_queue(worldEventCommand.runScriptRepeat,scr_event_townFirstEncounter_4_checker_2,noone,noone,noone,noone);
		return true;
	}
}
else
{
	show_debug_message("Event error: Player or boss not correctly defined in 'scr_event_townFirstEncounter_4_checker'")
	return true;
}

return false;
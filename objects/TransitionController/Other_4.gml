surface_free(GameManager.pauseSplash);
GameManager.pauseState = PauseState.normal;

var hasSpawned = false;
with objRoomSpawner
{
	if spawnFrom == other.roomFrom
	{
		objPlayer.phase = state.base
		scr_player_base_subPhaseDeterminer();
		objPlayer.x = x;
		objPlayer.y = y;
		objPlayer.ySpd = 0;
		objPlayer.xSpd = 0;
		GameManager.lastSpawner = id;
		hasSpawned = true;
		break;
	}
}
if !hasSpawned
{
	with objPlayer
	{
		var spawner = instance_find(objRoomSpawner,0);
		phase = state.base;
		scr_player_base_subPhaseDeterminer();
		x = spawner.x;
		y = spawner.y;
		ySpd = 0;
		xSpd = 0;
		GameManager.lastSpawner = id;
		hasSpawned = true; 
	}
}
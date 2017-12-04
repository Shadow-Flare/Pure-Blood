surface_free(GameManager.pauseSplash);
GameManager.pauseState = PauseState.normal;

var hasSpawned = false;
with objRoomSpawner
{
	if (other.roomFrom == noone || spawnFrom == other.roomFrom) && (other.ID == noone || other.ID = ID)
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
if !hasSpawned			//if no spawner with right details spawn on first spawner (idealy this should not get used)
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
		break;
	}
}
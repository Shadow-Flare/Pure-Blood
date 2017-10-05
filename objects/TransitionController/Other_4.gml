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
	with instance_find(objRoomSpawner,0)
	{
		objPlayer.phase = state.base;
		scr_player_base_subPhaseDeterminer();
		objPlayer.x = x;
		objPlayer.y = y;
		objPlayer.ySpd = 0;
		objPlayer.xSpd = 0;
		GameManager.lastSpawner = id;
		hasSpawned = true; 
	}
}
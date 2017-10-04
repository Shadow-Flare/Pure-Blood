instance_activate_all();
surface_free(global.pauseSplash);
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
		GameManager.lastSpawner = spawner;
		hasSpawned = true;
		break;
	}
}
if !hasSpawned
{
	with instance_find(obj_room_player_spawn,0)
	{
		objPlayer.phase = state.base;
		scr_player_base_subPhaseDeterminer();
		objPlayer.x = x;
		objPlayer.y = y;
		objPlayer.ySpd = 0;
		objPlayer.xSpd = 0;
		GameManager.lastSpawner = spawner;
		hasSpawned = true; 
	}
}
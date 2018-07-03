surface_free(GameManager.pauseSplash);
GameManager.pauseState = PauseState.normal;

var hasSpawned = false;

if spawnerID != noone
{
	with objRoomSpawner
	{
		if spawnerID == id
		{
			objPlayer.phase = state.base
			scr_player_base_subPhaseDeterminer();
			objPlayer.x = x;
			objPlayer.y = y;
			objPlayer.ySpd = 0;
			objPlayer.xSpd = 0;
			objPlayer.hasntBeenSpiked = true;
			GameManager.lastSpawner = id;
			hasSpawned = true;
			break;
		}
	}
}

if !hasSpawned			//if hasnt spawned yet, look ofr spawner based on "roomFrom"
{
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
			objPlayer.hasntBeenSpiked = true;
			GameManager.lastSpawner = id;
			hasSpawned = true;
			break;
		}
	}
}

if !hasSpawned			//if no spawner with right details spawn on first spawner (idealy this should not get used)
{
	with objPlayer
	{
		var spawner = instance_find(objRoomSpawner,0);
		GameManager.lastSpawner = spawner;
		phase = state.base;
		scr_player_base_subPhaseDeterminer();
		x = spawner.x;
		y = spawner.y;
		ySpd = 0;
		xSpd = 0;
		hasntBeenSpiked = true;
		GameManager.lastSpawner = id;
		hasSpawned = true;
		break;
	}
}
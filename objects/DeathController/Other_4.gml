if GameManager.currentCheckpointID != noone
{
	with objCheckpoint		//should only be one each room, will use the "first" one
	{
		objPlayer.x = x;
		objPlayer.y = y;
		with objPlayer
		{
			while place_free(x,y+1) y++;
		}
		break;
	}
}
else
{
	with objRoomSpawner		//picks the first one, this is okay for horde/arena/non-standard modes
	{
		objPlayer.x = x;
		objPlayer.y = y;
		break;
	}

}

with objPlayer
{
	statCache.hp = statCache.hpMax;
	phase = state.base;
	phaseTimer = 0;
	scr_player_base_subPhaseDeterminer();
	isDead = false;
	actorType = actorTypes.player;
	phased = false;
	image_alpha = 1;
}
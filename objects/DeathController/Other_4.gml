if GameManager.lastSpawner != noone
{
	var spawner = GameManager.lastSpawner;
	objPlayer.x = spawner.x;
	objPlayer.y = spawner.y;
}
else
{
	var spawner = instance_find(objRoomSpawner,0);
	objPlayer.x = spawner.x;
	objPlayer.y = spawner.y;
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
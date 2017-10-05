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

PlayerStats.hp = PlayerStats.hpMax;
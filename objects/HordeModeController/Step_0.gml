//state machine
switch phase
{
	case hordeModeState.waiting:
		phaseTimer++;
		if phaseTimer >= round(waitDuration*room_speed)
		{
			phase = hordeModeState.wave;
			phaseTimer = spawnInterval*room_speed;
			currentWave++;
			hasSpawnedAll = false;
			enemyNum = 0;
			cache = waveCache[| currentWave];
			enemy = ds_map_find_first(cache);
			message_feed_add("Wave " + string(currentWave));
		}
		break;
	case hordeModeState.wave:
		phaseTimer++;
		if phaseTimer >= round(spawnInterval*room_speed) && !hasSpawnedAll
		{
			phaseTimer = 0;
			if enemyNum < cache[? enemy]
			{	
				with instance_create_layer(spawner.x,spawner.y,"lay_entities",enemy) aggroRange = 16*999;
				enemyNum++;
			}
			else if enemy != ds_map_find_last(cache)
			{
				enemy = ds_map_find_next(cache,enemy);
				with instance_create_layer(spawner.x,spawner.y,"lay_entities",enemy) aggroRange = 16*999;
				enemyNum = 1;
			}
			else hasSpawnedAll = true;
			spawnerNum++;
			if spawnerNum = instance_number(objEnemySpawner) spawnerNum = 0;
			spawner = instance_find(objEnemySpawner,spawnerNum);
		}
		if hasSpawnedAll && instance_number(objEnemyParent) == 0
		{
			phase = hordeModeState.waiting;
			phaseTimer = 0;
		}
		break;
}
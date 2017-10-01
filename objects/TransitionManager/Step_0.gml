if global.spawning == 1
{
	instance_activate_all();
	if !objPlayer.falling
	{
		if roomFrom != rm_main_menu
		{
			for (var i=0; i < instance_number(obj_room_player_spawn); i++)
			{
				var spawner = instance_find(obj_room_player_spawn,i);
				if spawner.spawnFrom==roomFrom
				{
					objPlayer.x = spawner.x;
					objPlayer.y = spawner.y;
					global.spawning = 0;
					objPlayer.ySpd = 0;
					objPlayer.lastSpawner = spawner;
					break;
				}
			}
			if global.spawning
			{
				spawner = instance_find(obj_room_player_spawn,0);
				objPlayer.x = spawner.x;
				objPlayer.y = spawner.y;
				global.spawning = 0;
				objPlayer.ySpd = 0;
				objPlayer.lastSpawner = spawner;
			}
		}
		else
		{
			if roomTo == rm_room1
			{
				var spawner = instance_find(obj_room_player_spawn,0);
				objPlayer.x = spawner.x;
				objPlayer.y = spawner.y;
				global.spawning = 0;
				objPlayer.ySpd = 0;
			}
			else if roomTo == rm_arena1
			{
				var spawner = instance_find(obj_room_player_spawn,0);
				objPlayer.x = spawner.x;
				objPlayer.y = spawner.y;
				global.spawning = 0;
				objPlayer.ySpd = 0;
			}
		}
		if roomTo == rm_main_menu
		{
			instance_destroy(all);
		}
	}
	else if objPlayer.falling
	{
		if objPlayer.lastSpawner != 0
		{
			var spawner = objPlayer.lastSpawner;
			objPlayer.x = spawner.x;
			objPlayer.y = spawner.y;
		}
		else
		{
			var spawner = instance_find(obj_room_player_spawn,0);
			objPlayer.x = spawner.x;
			objPlayer.y = spawner.y;
		}
		objPlayer.falling = 0;
		global.spawning = 0;
		objPlayer.hp = objPlayer.maxHp; //CHANGE!
	}
	instance_destroy(Camera);
	with instance_create_layer(0,0,"lay_player",Camera)
	{
		follow = objPlayer;
		x = objPlayer.x;
		y = objPlayer.y;
	}
	objPlayer.phase = state.base
}

if timer == room_speed
{
	instance_activate_all();
	global.paused = 0;
	room_goto(roomTo);
	surface_free(global.pauseSplash);
	global.spawning = 1;
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}

timer++
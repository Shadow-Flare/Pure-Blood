if global.spawning == 1
{
	instance_activate_all();
	if !obj_player.falling
	{
		if roomFrom != rm_main_menu
		{
			for (var i=0; i < instance_number(obj_room_player_spawn); i++)
			{
				var spawner = instance_find(obj_room_player_spawn,i);
				if spawner.spawnFrom==roomFrom
				{
					obj_player.x = spawner.x;
					obj_player.y = spawner.y;
					global.spawning = 0;
					obj_player.ySpd = 0;
					obj_player.lastSpawner = spawner;
					break;
				}
			}
			if global.spawning
			{
				spawner = instance_find(obj_room_player_spawn,0);
				obj_player.x = spawner.x;
				obj_player.y = spawner.y;
				global.spawning = 0;
				obj_player.ySpd = 0;
				obj_player.lastSpawner = spawner;
			}
		}
		else
		{
			if roomTo == rm_room1
			{
				var spawner = instance_find(obj_room_player_spawn,0);
				obj_player.x = spawner.x;
				obj_player.y = spawner.y;
				global.spawning = 0;
				obj_player.ySpd = 0;
			}
			else if roomTo == rm_arena1
			{
				var spawner = instance_find(obj_room_player_spawn,0);
				obj_player.x = spawner.x;
				obj_player.y = spawner.y;
				global.spawning = 0;
				obj_player.ySpd = 0;
			}
		}
		if roomTo == rm_main_menu
		{
			instance_destroy(all);
		}
	}
	else if obj_player.falling
	{
		if obj_player.lastSpawner != 0
		{
			var spawner = obj_player.lastSpawner;
			obj_player.x = spawner.x;
			obj_player.y = spawner.y;
		}
		else
		{
			var spawner = instance_find(obj_room_player_spawn,0);
			obj_player.x = spawner.x;
			obj_player.y = spawner.y;
		}
		obj_player.falling = 0;
		global.spawning = 0;
		obj_player.hp = obj_player.maxHp; //CHANGE!
	}
	instance_destroy(obj_camera);
	with instance_create_layer(0,0,"lay_player",obj_camera)
	{
		follow = obj_player;
		x = obj_player.x;
		y = obj_player.y;
	}
	obj_player.phase = state.base
}

if timer == room_speed
{
	instance_activate_all();
	surface_free(obj_controller.blood);
	surface_free(obj_controller.tiles);
	surface_free(obj_controller.bloodyTiles);
	surface_free(obj_controller.temp);
	surface_free(obj_controller.light);
	for (var i = 0; i < array_length_1d(obj_controller.fogSpriteNumbers); i++)
	{
		surface_free(obj_controller.fogSurfaces[i]);
		if ds_exists(obj_controller.fogSpriteData,ds_type_list)
		{
			if ds_exists(ds_list_find_value(obj_controller.fogSpriteData,i),ds_type_grid) 
			{
				ds_grid_destroy(ds_list_find_value(obj_controller.fogSpriteData,i));
			}
		}
	}
	if ds_exists(obj_controller.fogSpriteData,ds_type_list) ds_list_destroy(obj_controller.fogSpriteData);
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
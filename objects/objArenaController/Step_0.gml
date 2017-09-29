//delete if no longer in arena
if room != rm_arena1 && room != rm_arena2 && room != rm_arena3 && room != rm_arena4
{
	instance_destroy();
	instance_destroy(obj_arena_settings_controller);
}

//Enemy Name & object list
for (var i = 0; i < numberOfEnemies; i++)
{
	if arenaStats[0] = enemyValues[i,0]
	{
		enemy = enemyValues[i,4];
		break;
	}
	else enemy = noone;
}

//Enemy Number
if !instance_exists(obj_arena_settings_controller) && !instance_exists(obj_pause_controller)
{
	var count = 0;
	if enemy != noone
	{
		with enemy if phase != "dying" count++;
		if count < arenaStats[1] && spawnTimer == -1
		{
			if room == rm_arena1 || room == rm_arena4 {var spawnX = 1472+random_range(-225,225); var spawnY = -160;}
	   else if room == rm_arena2 || room == rm_arena3 {var spawnX = 2176+random_range(-225,225); var spawnY = -160;}
	   else {var spawnX = 0; var spawnY = 0;}
			instance_create_layer(spawnX,spawnY,layer_get_id("lay_entities"),enemy);
			spawnTimer = 0;
		}
		if spawnTimer != -1 spawnTimer++;
		if spawnTimer == room_speed*0.5 spawnTimer = -1;
	}
	while count > arenaStats[1] 
	{
		with enemy
		{
			if phase != "dying"
			{
				instance_destroy();
			}
		}
		var count = 0;
		with enemy if phase != "dying" count++;
	}
}

//Enemy Maximum Hp
with enemy maxHp = other.arenaStats[2];

//Enemy Physical Strength
with enemy physicalPower = other.arenaStats[3];

//Enemy Invulnerability
with enemy isInvulnerable = other.arenaStats[4];

//Player Maximum Hp
global.hpMax = other.arenaStats[5];

//Player Physical Strength
with player physicalPower = other.arenaStats[6];

//Player Invulnerability
with player isInvulnerable = other.arenaStats[7];

//Arena Number
switch arenaStats[8]
{
	case "Manor: Small":
		dest = rm_arena1;
		break;
	case "Dungeon: Large":
		dest = rm_arena2;
		break;
	case "Forest: Large with pitfalls":
		dest = rm_arena3;
		break;
	case "Town: Small, Flat and borderless":
		dest = rm_arena4;
		break;
}
if room != dest
{
		global.roomTrans = instance_create_depth(player.x,player.y,0,obj_room_transition)
		with global.roomTrans
		{
			roomFrom = room;
			roomTo = other.dest;
		}
}

//Arena platforms
switch arenaStats[9]
{
	case "off":
		instance_deactivate_object(obj_platform_parent);
		layer_set_visible("Tiles_arena_platforms",0)
		break;
	case "on":
		instance_activate_object(obj_platform_parent);
		layer_set_visible("Tiles_arena_platforms",1)
		break;
}

//Arena hook points
switch arenaStats[10]
{
	case "off":
		instance_deactivate_object(obj_grapple_parent);
		layer_set_visible("Tiles_arena_hookPoints",0)
		break;
	case "on":
		instance_activate_object(obj_grapple_parent);
		layer_set_visible("Tiles_arena_hookPoints",1)
		break;
}
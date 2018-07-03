if place_meeting(x,y,objZoneHazard) && hasntBeenSpiked
{
	hasntBeenSpiked = false;
	var cache = ds_map_create();
	
	if object_index != objPlayer var damage = 99999;
	else 
	{
		var damage = statCache.hpMax/6;
		if statCache.hp-damage > 0
		{
			with GameManager
			{
				pauseState = PauseState.transitioning;
				transitionRoomTo = room;
				transitionSpawnerID = lastSpawner;
			}
		}
	}
	
	scr_create_damageCache(cache,0,0,0,0,0,0,0,0,0,0,0,damage);
	scr_hit(noone,noone,cache,noone,noone,noone);
	ds_map_destroy(cache);
}
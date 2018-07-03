with ItemCache
{
	var cache = item;
	for (var i = 0; i < ds_map_size(cache); i++)
	{
		var typeCache = cache[? i];
		for (var j = 0; j < ds_map_size(typeCache); j++)
		{
			scr_player_inventory_manage(i,j,999);
		}
	}
}
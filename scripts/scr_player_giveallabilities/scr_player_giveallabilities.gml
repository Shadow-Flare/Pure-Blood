with AbilityCache
{
	var cache = ability;
	for (var i = 0; i < ds_map_size(cache); i++)
	{
		var typeCache = cache[? i];
		for (var j = 0; j < ds_map_size(typeCache); j++)
		{
			scr_player_ability_manage(i,j, playerAbilityStats.numberOwned,20);
		}
	}
}
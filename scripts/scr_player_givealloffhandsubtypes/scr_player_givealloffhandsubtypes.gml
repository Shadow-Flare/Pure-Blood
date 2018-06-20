with ComboCache
{
	var cache = subtype;
	for (var i = 0; i < ds_map_size(cache); i++)
	{
		scr_player_subtype_manage(i,ownedSubtypeStats.owned,true);
	}
}
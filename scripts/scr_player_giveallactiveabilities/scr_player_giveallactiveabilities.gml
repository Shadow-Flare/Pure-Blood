with ComboCache
{
	var cache = activeAbility;
	for (var i = 0; i < ds_map_size(cache); i++)
	{
		scr_player_active_manage(i,true);
	}
}
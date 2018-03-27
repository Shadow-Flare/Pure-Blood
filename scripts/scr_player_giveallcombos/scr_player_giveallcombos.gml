with ComboCache
{
	var cache = combo;
	for (var i = 0; i < ds_map_size(cache); i++)
	{
		scr_player_combo_manage(i,true);
	}
}
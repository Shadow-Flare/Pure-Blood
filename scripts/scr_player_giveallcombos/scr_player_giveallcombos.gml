with ComboCache
{
	for (var index = ds_map_find_first(combo); index != undefined; index = ds_map_find_next(combo,index))
	{
		scr_player_combo_manage(index,true);
	}
}
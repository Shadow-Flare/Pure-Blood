event_inherited();

if ds_list_size(itemList) == 0
{
	show_debug_message("Basic item pickup "+string(id)+" was not created properly, itemID or itemCat was not declared in create code")
	used = false;
	instance_destroy();
}

if used
{
	used = false;
	usable = false;
	for(var i = 0; i < ds_list_size(itemList); i++)
	{
		var subCache = itemList[| i];
		var cat = subCache[| 0];
		var index = subCache[| 1];
		var modifier = subCache[| 2];
		var plural = modifier != 1;
		var icon = item_get_data(cat,index,itemStats.icon);
		
		scr_player_inventory_manage(cat,index,modifier);
		if !plural message_feed_add("Obtainted "+item_get_data(cat,index,itemStats.name),icon);
		else
		{
			var pluralName = item_get_data(cat,index,itemStats.pluralName);
			if pluralName = undefined pluralName = item_get_data(cat,index,itemStats.name);
			message_feed_add("Obtainted "+string(modifier)+" "+pluralName,icon);
		}
	}
	image_index = 1;
	//instance_destroy();
}
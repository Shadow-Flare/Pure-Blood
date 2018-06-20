event_inherited();

if itemHeldID == noone || itemHeldCat = noone
{
	show_debug_message("Basic item pickup "+string(id)+" was not created properly, itemID or itemCat was not declared in create code")
	used = false;
	instance_destroy();
}

if used
{
	used = false;
	usable = false;

	var cat = itemHeldCat;
	var index = itemHeldID;
	var modifier = 1;
		
	scr_player_inventory_manage(cat,index,modifier);
	scr_pauseMessage_add(pauseMessageState.pedestalItem,cat,index);
	//instance_destroy();
}
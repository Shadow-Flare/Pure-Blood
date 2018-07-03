///@arg itemType.ENUM
///@arg index
///@arg mod
var type = argument0;
var itemID = argument1;
var modifier = argument2;

if type == itemType.weapon
{
	var class = weapon_get_stat(itemID,weaponStats.type);
	var cache = ComboCache.playerClass[? class];
	if cache == undefined
	{
		ComboCache.playerClass[? class] = ds_map_create();
		var classCache = ComboCache.playerClass[? class];
		classCache[? playerClassStats.level] = 0;
		classCache[? playerClassStats.xp] = 0;
		classCache[? playerClassStats.xpNeeded] = 30*power(1.5,classCache[? playerClassStats.level]);
		if !class_get_stat(class,weaponClassStats.isMain)
		{
			scr_player_subtype_manage(class_get_stat(class,weaponClassStats.defaultSubtype),ownedSubtypeStats.owned,true);
			scr_player_active_manage(class_get_stat(class,weaponClassStats.defaultActive),ownedActiveStats.owned,true);
			
			var check = false;
			if variable_instance_exists(PlayerStats,"currentOffhandID") check = true;
			if check var prevID = PlayerStats.currentOffhandID;
			PlayerStats.currentOffhandID = itemID;
			scr_player_update_offhand_caches();
			if check PlayerStats.currentOffhandID = prevID;
			else PlayerStats.currentOffhandID = undefined;
		}
		with ComboCache
		{
			for (var index = ds_map_find_first(combo); index != undefined; index = ds_map_find_next(combo,index))
			{
				var classCheck = class == combo_get_stat(index, comboStats.class);
				var typeCheck = (combo_get_stat(index, comboStats.type) != weaponComboTypes.technical && combo_get_stat(index, comboStats.type) != weaponComboTypes.unique)
				var profCheck = combo_get_stat(index, comboStats.proficiencyTier) == classCache[? playerClassStats.level];
				var autoGrantCheck = combo_get_stat(index, comboStats.autoGrant);
				if classCheck && typeCheck && profCheck && autoGrantCheck
				{
					scr_player_combo_manage(index,true);
					var comboName = combo_get_stat(index, comboStats.name);
					var className = class_get_stat(class, weaponClassStats.name);
					//message_feed_add(className+" combo "+comboName+" learnt!",noone);	//add symbols to this eventually?? probably will change this into some message that appears when pausing after aquirement
				}
			}
		}
	}
	//else do nothing
}

with ItemCache
{
	var itemTypeCache = inventory[? type];
	var maxNum = item_get_data(type,itemID,itemStats.maxOwned);
	if (itemTypeCache[? itemID] == undefined)
	{
		itemTypeCache[? itemID] = 0;
	}
	itemTypeCache[? itemID] += modifier;
	if (maxNum != noone && maxNum != undefined) itemTypeCache[? itemID] = clamp(itemTypeCache[? itemID],0,maxNum);
	if (itemTypeCache[? itemID] <= 0)
	{
		ds_map_delete(itemTypeCache,itemID);
	}
}
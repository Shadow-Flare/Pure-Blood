///@arg itemType.ENUM
///@arg SECONDENUM
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
		classCache[? playerClassStats.xpNeeded] = 10*power(1.5,classCache[? playerClassStats.level]);
	}
	//else do nothing
}

with ItemCache
{
	var itemTypeCache = inventory[? type];
	if (itemTypeCache[? itemID] == undefined)
	{
		itemTypeCache[? itemID] = 0;
	}
	itemTypeCache[? itemID] += modifier; 	
	if (itemTypeCache[? itemID] <= 0)
	{
		ds_map_delete(itemTypeCache,itemID);
	}
}
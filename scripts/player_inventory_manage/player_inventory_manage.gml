///@arg itemType.ENUM
///@arg SECONDENUM
///@arg mod
var type = argument0;
var itemID = argument1;
var modifier = argument2;

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
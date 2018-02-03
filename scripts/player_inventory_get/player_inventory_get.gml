///@arg itemType.ENUM
///@arg itemID
var type = argument0;
var itemID = argument1;

with ItemCache
{
	var itemTypeCache = inventory[? type];
	var itemNum = itemTypeCache[? itemID];
	if (itemNum == undefined)
	{
		itemNum = 0;
	}
	return itemNum;
}
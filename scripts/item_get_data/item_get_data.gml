///@arg itemType.ENUM
///@arg itemID
///@arg itemStats.ENUM
var type = argument0;
var itemID = argument1;
var itemStat = argument2;

with ItemCache
{
// go into item tab
	var itemTypeCache = item[? type];
// go into item
	var specificItemCache = itemTypeCache[?itemID];
//find required stat
	if (specificItemCache == undefined)
	{
		return undefined;
	}
	var stat = specificItemCache[?itemStat];

//undefined sprite clause
if itemStat == itemStats.icon && stat == undefined
{
	stat = spr_icon_item_undefined;
}

//finalise stat (return)
	return stat;
}
///@arg weaponItem.ENUM
///@arg weaponStats.ENUM
var wep = argument0;
var statType = argument1;

var itemWeaponsCache = ItemCache.item[? itemType.weapon];
var itemCache = itemWeaponsCache[? wep];
var weaponStatCache = itemCache[? itemStats.weaponData];

var stat = weaponStatCache[? statType];

return stat;
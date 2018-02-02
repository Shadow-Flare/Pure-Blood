///@arg weaponItem.ENUM
///@arg weaponStats.ENUM
var wep = argument0;
var statType = argument1;

var itemWeaponsCache = ItemCache.item[? itemType.weapon];
var weaponStatCache = itemWeaponsCache[? wep];

var stat = weaponStatCache[? statType];

return stat;
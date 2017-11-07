///@arg weaponClass(ENUM)
///@arg weaponClassStats(ENUM)
var class = argument0;
var statType = argument1;
var classDataCache = ItemCache.weaponClassData[? class];

var stat = classDataCache[? statType];

return stat;
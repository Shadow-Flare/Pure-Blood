///@arg weaponClass(ENUM)
///@arg weaponClassStats(ENUM)
var class = argument0;
var statType = argument1;
var classDataCache = ComboCache.offhandClass[? class];

var stat = classDataCache[? statType];

return stat;
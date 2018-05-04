///@arg weaponClass.ENUM
///@arg playerClassStats.ENUM
var class = argument0;
var statType = argument1;
var playerClassDataCache = ComboCache.playerClass[? class];

var stat = playerClassDataCache[? statType];

return stat;
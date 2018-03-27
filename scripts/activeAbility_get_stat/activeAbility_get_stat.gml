///@arg activeAbilityID(ENUM)
///@arg activeAbilityStats(ENUM)
var activeID = argument0;
var statType = argument1;
var activeDataCache = ComboCache.activeAbility[? activeID];

var stat = activeDataCache[? statType];

return stat;
///@arg offhandSubtype(ENUM)
///@arg offhandSubtypeStats(ENUM)
var sub = argument0;
var statType = argument1;
var subDataCache = ComboCache.subtype[? sub];

var stat = subDataCache[? statType];

return stat;
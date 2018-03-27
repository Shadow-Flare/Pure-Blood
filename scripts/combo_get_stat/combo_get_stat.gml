///@arg comboID.ENUM
///@arg comboStats.ENUM
var ID = argument0;
var statType = argument1;

var cache = ComboCache.combo[? ID];

var stat = cache[? statType];

return stat;
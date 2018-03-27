///@arg weaponClass.ENUM
///@arg weaponComboTypes.ENUM
///@arg index
var class = argument0;
var type = argument1

with PlayerStats
{
	var classCache = classComboCache[? class]
	var typeCache = classCache[? type]
	
	var len = ds_list_size(typeCache);
	
	return len;
}
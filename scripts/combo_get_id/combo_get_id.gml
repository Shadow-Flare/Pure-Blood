///@arg weaponClass.ENUM
///@arg weaponComboTypes.ENUM
///@arg index
var class = argument0;
var type = argument1
var index = argument2;

with PlayerStats
{
	var classCache = classComboCache[? class]
	var typeCache = classCache[? type]
	
	var comID = typeCache[| index];
	
	return comID;
}
///@arg weaponClass.ENUM
///@arg weaponComboTypes.ENUM
///@arg index
///@arg comboID.ENUM
var class = argument0;
var type = argument1
var index = argument2;
var comID = argument3;

with PlayerStats
{
	var classCache = classComboCache[? class]
	var typeCache = classCache[? type]
	
	typeCache[| index] = comID;
}
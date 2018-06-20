///@arg variant
///@arg id0
///@arg id1
///@arg id2
///@arg id3
var variant = argument0;
var value0 = WorldCache.environment[? argument1];
var value1 = WorldCache.environment[? argument2];
var value2 = WorldCache.environment[? argument3];
var value3 = WorldCache.environment[? argument4];

switch variant
{
	case interactableVariant.none:
		//do nothing
		break;
	case interactableVariant.worldID:
		enabled = value0;
		if enabled == undefined
		{
			enabled = true;
			show_debug_message("WorldID not defined in " + string(id));
		}
		break;
	case interactableVariant.worldIDand:
		enabled = true;
		if value0 != undefined enabled = enabled&&value0;
		if value1 != undefined enabled = enabled&&value1;
		if value2 != undefined enabled = enabled&&value2;
		if value3 != undefined enabled = enabled&&value3;
		break;
}
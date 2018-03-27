///@arg activeAbility.ENUM
///@arg mod
var actID = argument0;
var modifier = argument1;

with ComboCache
{
	playerActiveAbility[? actID] = modifier; 	
	if (playerActiveAbility[? actID] == false)
	{
		ds_map_delete(playerActiveAbility,actID);
	}
}
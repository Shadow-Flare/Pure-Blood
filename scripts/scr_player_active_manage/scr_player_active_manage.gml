///@arg activeAbility.ENUM
///@arg ownedActiveStats.ENUM
///@arg mod
var actID = argument0;
var stat = argument1;
var modifier = argument2;

with ComboCache
{
	if playerActiveAbility[? actID] == undefined || !ds_exists(playerActiveAbility[? actID],ds_type_map) 
	{
		playerActiveAbility[? actID] = ds_map_create();
		var ownedCache = playerActiveAbility[? actID];
		ownedCache[? ownedActiveStats.owned] = false;
		ownedCache[? ownedActiveStats.enabled] = false;
		ownedCache[? ownedActiveStats.enabledIndex] = -1;
		
	}
	else var ownedCache = playerActiveAbility[? actID];
	
	ownedCache[? stat] = modifier; 	

	if (ownedCache[? ownedActiveStats.enabled] == false)
	{
		ownedCache[? ownedActiveStats.enabledIndex] = -1;
	}
	if (ownedCache[? ownedActiveStats.owned] == false)
	{
		ds_map_destroy(ownedCache);
	}
}
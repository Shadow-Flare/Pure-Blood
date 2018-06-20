///@arg offhandSubtype.ENUM
///@arg ownedSubtypeStats.ENUM
///@arg mod
var subID = argument0;
var stat = argument1;
var modifier = argument2;

with ComboCache
{
	if playerOffhandSubtype[? subID] == undefined || !ds_exists(playerOffhandSubtype[? subID],ds_type_map) 
	{
		playerOffhandSubtype[? subID] = ds_map_create();
		var ownedCache = playerOffhandSubtype[? subID];
		ownedCache[? ownedSubtypeStats.owned] = false;
		ownedCache[? ownedSubtypeStats.enabled] = false;
		ownedCache[? ownedSubtypeStats.enabledIndex] = -1;
		
	}
	else var ownedCache = playerOffhandSubtype[? subID];
	
	ownedCache[? stat] = modifier; 	
	
	if (ownedCache[? ownedSubtypeStats.enabled] == false)
	{
		ownedCache[? ownedSubtypeStats.enabledIndex] = -1;
	}
	if (ownedCache[? ownedSubtypeStats.owned] == false)
	{
		ds_map_destroy(ownedCache);
	}
}
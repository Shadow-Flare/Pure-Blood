///@arg offhandSubtype.ENUM
///@arg mod
var subID = argument0;
var modifier = argument1;

with ComboCache
{
	playerOffhandSubtype[? subID] = modifier; 	
	if (playerOffhandSubtype[? subID] == false)
	{
		ds_map_delete(playerOffhandSubtype,subID);
	}
}
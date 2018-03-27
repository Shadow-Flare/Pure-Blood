///@arg comboID.ENUM
///@arg mod
var comID = argument0;
var modifier = argument1;

with ComboCache
{
	playerCombo[? comID] = modifier; 	
	if (playerCombo[? comID] == false)
	{
		ds_map_delete(playerCombo,comID);
	}
}
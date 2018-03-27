///@arg comboID.ENUM
var comID = argument0;

with ComboCache
{
	var comboOwned = playerCombo[? comID];
	if (comboOwned == undefined)
	{
		comboOwned = false;
	}
	return comboOwned;
}
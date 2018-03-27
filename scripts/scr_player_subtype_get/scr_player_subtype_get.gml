///@arg offhandSubtype.ENUM
var subID = argument0;

with ComboCache
{
	var comboOwned = playerOffhandSubtype[? subID];
	if (comboOwned == undefined)
	{
		comboOwned = false;
	}
	return comboOwned;
}
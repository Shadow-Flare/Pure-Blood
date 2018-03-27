///@arg activeAbility.ENUM
var actID = argument0;

with ComboCache
{
	var comboOwned = playerActiveAbility[? actID];
	if (comboOwned == undefined)
	{
		comboOwned = false;
	}
	return comboOwned;
}
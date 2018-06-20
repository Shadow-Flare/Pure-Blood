///@arg activeAbility.ENUM
///@arg ownedActiveStats.ENUM
var actID = argument0;
var stat = argument1;

with ComboCache
{
	var ownedCache = playerActiveAbility[? actID];
	if ownedCache == undefined return undefined;
	else
	{
		return ownedCache[? stat];
	}
}
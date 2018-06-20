///@arg offhandSubtype.ENUM
///@arg ownedSubtypeStats.ENUM
var subID = argument0;
var stat = argument1;

with ComboCache
{
	var ownedCache = playerOffhandSubtype[? subID];
	if ownedCache == undefined return undefined;
	else
	{
		return ownedCache[? stat];
	}
}
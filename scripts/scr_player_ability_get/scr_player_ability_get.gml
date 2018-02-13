///@arg abilityType.ENUM
///@arg abilityID
///@arg playerAbilityStats.ENUM
var type = argument0;
var abilityID = argument1;
var stat = argument2;

with AbilityCache
{
	var abilityTypeCache = playerAbilities[? type];
	var abilitySpecificCache = abilityTypeCache[? abilityID];
	var abilityNum = abilitySpecificCache[? stat];
	if (abilityNum == undefined)
	{
		abilityNum = 0;
	}
	return abilityNum;
}
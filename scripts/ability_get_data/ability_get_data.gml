///@arg abilityType.ENUM
///@arg abilityID
///@arg abilityStats.ENUM
var type = argument0;
var abilityID = argument1;
var abilityStat = argument2;

with AbilityCache
{
// go into item tab
	var abilityTypeCache = ability[? type];
// go into item
	var specificAbilityCache = abilityTypeCache[? abilityID];
//find required stat
	if (specificAbilityCache == undefined)
	{
		return undefined;
	}
	var stat = specificAbilityCache[? abilityStat];
//finalise stat (return)
	return stat;
}
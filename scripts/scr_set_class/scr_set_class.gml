switch argument0
{
case "Sword":
	ComboCache.activeCounterId = ComboCache.swordCounterId;
	ComboCache.activeUpwardsId = ComboCache.swordUpwardsId;
	ComboCache.activeDownwardsId = ComboCache.swordDownwardsId;
	ComboCache.activeForwardsId = ComboCache.swordForwardsId;
	ComboCache.activeBackwardsId = ComboCache.swordBackwardsId;
	ComboCache.activeClassIDs = ComboCache.classSwordAttackIDs;
	ComboCache.activeClassNum = ComboCache.swordClassId;
	ComboCache.activeAerialID = ComboCache.aerialSwordId;
	ComboCache.activeComboSlotNumbers = [[1,2],[1,3],[1,3],[1,4]]; // GOTTA CHANGE
	break;
}
switch argument0
{
case "Sword":
	PlayerStats.activeCounterID = ComboCache.swordCounterID;
	PlayerStats.activeUpwardsID = ComboCache.swordUpwardsID;
	PlayerStats.activeDownwardsID = ComboCache.swordDownwardsID;
	PlayerStats.activeForwardsID = ComboCache.swordForwardsID;
	PlayerStats.activeBackwardsID = ComboCache.swordBackwardsID;
	PlayerStats.activeClassIDs = ComboCache.classSwordAttackIDs;
	PlayerStats.activeClassNum = ComboCache.swordClassID;
	PlayerStats.activeComboSlotNumbers = [[1,2],[1,3],[1,3],[1,4]]; // GOTTA CHANGE
	break;
}
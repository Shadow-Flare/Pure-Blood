switch argument0
{
	case "Sword":
		PlayerStats.counterID = ComboCache.swordCounterID;
		PlayerStats.upwardsID = ComboCache.swordUpwardsID;
		PlayerStats.downwardsID = ComboCache.swordDownwardsID;
		PlayerStats.forwardsID = ComboCache.swordForwardsID;
		PlayerStats.backwardsID = ComboCache.swordBackwardsID;
		PlayerStats.classIDs = ComboCache.classSwordAttackIDs;
		PlayerStats.classNum = ComboCache.swordClassID;
		PlayerStats.comboSlotNumbers = [[1,2],[1,3],[1,3],[1,4]]; // GOTTA CHANGE
		break;
}
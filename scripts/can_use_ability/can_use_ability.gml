//fill this with conditions for every activatable, these factor in mainly targets and mana
switch PlayerStats.currentOffhandActivatableID
{
	#region Crossbow
			//Rope Shot
	case activeAbilityID.crossbow_rope_shot:
		if ropeShotTarget != noone return true;
		break;
			//Shrapnel Burst
	case activeAbilityID.crossbow_shrapnel_burst:
		if statCache.mp >= activeAbility_get_stat(activeAbilityID.crossbow_shrapnel_burst,activeAbilityStats.manaCost) || GameManager.thereisnospoon return true;
		break;
	#endregion
	#region Grimoire
			//Reflect
	case activeAbilityID.grimoire_reflect:
		if statCache.mp >= activeAbility_get_stat(activeAbilityID.grimoire_reflect,activeAbilityStats.manaCost) || GameManager.thereisnospoon return true;
		break;		
			//Heal
	case activeAbilityID.grimoire_heal:
		if statCache.mp >= activeAbility_get_stat(activeAbilityID.grimoire_heal,activeAbilityStats.manaCost) || GameManager.thereisnospoon return true;
		break;
	#endregion
}
return false;
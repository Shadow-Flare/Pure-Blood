phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch PlayerStats.currentOffhandActivatableID
{
	case activeAbilityID.crossbow_rope_shot:
		scr_player_ability_crossbow_ropeShot();
		break;
	case activeAbilityID.crossbow_shrapnel_burst:
		scr_player_ability_crossbow_shrapnelBurst();
		break;
	case activeAbilityID.grimoire_reflect:
		scr_player_ability_grimoire_reflect();
		break;
	case activeAbilityID.grimoire_heal:
		scr_player_ability_grimoire_heal();
		break;
}
		
#endregion

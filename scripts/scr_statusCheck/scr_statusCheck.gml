//begin dying
if phase != state.dying && statCache.hp <= 0
{
	scr_enemy_drops();
	phased = 1;
	actorType = actorTypes.corpse;
	phase = state.dying;
	phaseTimer = 0;
	if subPhase != subState.aerialStagger subPhase = subState.none
	subPhaseTimer = 0;
}

//break
with statCache
{
	if physicalBreakHp != 0 || magicalBreakHp != 0
	{
		if other.hasFlung var spdMod = 6;
		else if other.hasStaggered var spdMod = 3;
		else var spdMod = 1;
		
		var physSpd = (physicalToughness/(breakCooldownDuration*room_speed))*spdMod;
		var magiSpd = (magicalToughness/(breakCooldownDuration*room_speed))*spdMod;
		
		physicalBreakHp -= physSpd;
		magicalBreakHp -= magiSpd;

		if physicalBreakHp < 0 physicalBreakHp = 0;
		if magicalBreakHp < 0 magicalBreakHp = 0;
	}
	else
	{
		other.hasStaggered = false;
		other.hasFlung = false;
	}
}
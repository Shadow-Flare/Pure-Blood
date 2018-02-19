//begin dying
if phase != state.dying && statCache.hp <= 0
{
	//scr_enemy_drops();
	phased = 1;
	actorType = actorTypes.corpse;
	phase = state.dying;
	phaseTimer = 0;
	if subPhase != subState.aerialStagger subPhase = subState.none
	subPhaseTimer = 0;
}

//guaged hp management
with statCache
{	
		//break
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
		//special status
	for(var i = 0; i < array_length_1d(specialResistances); i++)
	{
			//activations
		if specialDamages[i] >= specialResistances[i]
		{
			switch i
			{
				case specialType.bleed:
					scr_hit(noone,noone,damageType.pure,hpMax*0.3,specialType.none,0,noone);
					break;
			}
		}
			//break hp management
		if specialDamages[i] != 0
		{			
			if other.specialHasActivated[i] var spdMod = 6;
			else var spdMod = 1;
		
			var specialSpd = (specialResistances[i]/(specialCooldowns[i]*room_speed))*spdMod;
		
			specialDamages[i] -= physSpd;
			if specialDamages[i] < 0 specialDamages[i] = 0;
		}
	}
}
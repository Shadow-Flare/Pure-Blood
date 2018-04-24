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
			specialDamages[i] = 0;
			switch i
			{
				case specialType.bleed:
					var dam = hpMax*0.3;
					with other
					{
						scr_hit(noone,noone,damageType.pure,dam,specialType.none,0,noone,noone);
						scr_hit_effect_blood(id,statCache.hitEffectType,statCache.hitEffectColour,75,2.22);
					}
					break;
			}
		}
			//special hp management
		if specialDamages[i] != 0
		{			
			if specialHasActivated[i] var spdMod = 6;
			else var spdMod = 1;
		
			var specialSpd = (specialResistances[i]/(specialCooldowns[i]*room_speed))*spdMod;
		
			specialDamages[i] -= specialSpd;
			if specialDamages[i] < 0 specialDamages[i] = 0;
		}
	}
}

//colour reset
var oldCol = image_blend;
image_blend = merge_colour(oldCol,c_white,0.05);
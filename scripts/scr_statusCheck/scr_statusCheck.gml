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
	if !hasGrantedExp && object_index != objPlayer
	{
		hasGrantedExp = true;
		var xpToGrant = statCache.killExp;
		if xpToGrant > 0
		{
			scr_player_grantExp_normal(xpToGrant);
		}
	}
}

//execute death fade then deletion
if isDead
{
	image_speed = 0;
	image_alpha -= 1/(60*deathFadeDuration);
	if image_alpha <= 0
	{		
		instance_destroy();
	}
}

//guaged hp management
with statCache
{	
		//break
	if breakHp != 0
	{
		if other.hasFlung var spdMod = 32;
		else if other.hasStaggered var spdMod = 6;
		else var spdMod = 1;
		
		var breakSpd = (toughness/(breakCooldownDuration*room_speed))*spdMod;
		
		breakHp -= breakSpd;

		if breakHp < 0 breakHp = 0;
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
						var hitData = ds_map_create();
						scr_create_damageCache(hitData,0,0,0,0,0,0,0,0,0,0,0,dam);
						scr_hit(noone,noone,hitData,noone,noone,noone);
						scr_hit_effect_blood(id,statCache.hitEffectType,statCache.hitEffectColour,75,noone,2.22);
						ds_map_destroy(hitData);
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
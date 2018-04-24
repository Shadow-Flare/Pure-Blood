if subPhaseTimer == 0 baseSpriteIndex = -4;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*staggeredDuration)
				{
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_ground_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/8;
				break;
			case vState.jumping:
			case vState.midAir:
				subPhase = subState.aerialStagger;
				subPhaseTimer = 0;
				break;
		}
			//Sprite
		if image_index = sprite_get_number(sprite_index)-1 image_speed = 0;
		update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
		break;
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				hasBeenUppercut = false;
				subPhase = subState.stunned;
				subPhaseTimer = 0;
				break;
			case vState.jumping:
			case vState.midAir:
					//ySpd
				if subPhaseTimer <= round(room_speed*0.7)
				{
					ySpd -= GameManager.grav*(0.98) //2% grav
					ySpd -= ySpd/20;
				}
					//xSpd
				if hasBeenUppercut xSpd -= xSpd/12;
				else xSpd -= xSpd/30;
				break;
		}
		if isHooked != noone
		{
			var c = isHooked.caster;
			var stats = c.statCache;
			var desiredX = c.x-sign(c.x-x)*24;
			var dir = point_direction(x,y,desiredX,c.y);
			var distToDesired = point_distance(x,y,desiredX,c.y);
			var spd = clamp(stats.moveSpeed*2.6,0,distToDesired);
			if spd <= 1 spd = 0;
			xSpd = spd*dcos(dir);
			ySpd = -spd*dsin(dir);
		}
			//Sprite
		if subPhaseTimer >= round(aerialStaggeredDuration*room_speed) update_sprite_enemy(sprBASEBodyAerialStagger,1);
		else update_sprite_enemy(sprBASEBodyAerialStaggerInitial,-aerialStaggeredDuration);
		break;
	case subState.deflected:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer == round(deflectDuration*room_speed)
				{
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_ground_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/6;
					//Sprite
				update_sprite_enemy(sprBASEBodyDeflect,-deflectDuration)
				break;
			case vState.jumping:
			case vState.midAir:
				canChangeVState = false;
				if subPhaseTimer == round(deflectDuration*room_speed)
				{
					canChangeVState = true;
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_ground_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/6;
					//Sprite
				update_sprite_enemy(sprBASEBodyAerialDeflect,-deflectDuration)
				break;
		}
		break;
	case subState.stunned:
		switch vPhase
		{
			case vState.grounded:
					//transition
				if subPhaseTimer >= round(room_speed*stunnedDuration)
				{
					subPhase = subState.recovery;
					subPhaseTimer = 0;
				}
					//xSpd
				xSpd -= xSpd/4;
				break;
			case vState.jumping:
			case vState.midAir:
				subPhase = subState.aerialStagger;
				subPhaseTimer = 0;
				break;
		}
			//sprite
		update_sprite_enemy(sprBASEBodyStunned,1);
		break;
	case subState.recovery:
		switch vPhase
		{
			case vState.grounded:
					//transition
				if subPhaseTimer >= round(room_speed*stunnedRecoveryDuration)
				{
					phased = false;
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_ground_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/4;
				break;
			case vState.jumping:
			case vState.midAir:
				subPhase = subState.aerialStagger;
				subPhaseTimer = 0;
				break;
		}
			//sprite
		update_sprite_enemy(sprBASEBodyRecovery,-stunnedRecoveryDuration);
		break;
}
		
#endregion

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
		if subPhaseTimer >= round(room_speed*staggeredDuration)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		var newImage = sprZombieBodyStagger;
		var newImageSpeed = sprite_get_number(newImage)/(staggeredDuration);
		update_sprite_enemy(newImage,newImageSpeed);
		break;
		
	case subState.flung:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*proneDuration)
				{
					phased = false;
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/4;
					//Sprite
				var newImage = sprZombieBodyProne;
				var newImageSpeed = sprite_get_number(newImage)/(proneDuration);
				update_sprite_enemy(newImage,newImageSpeed);
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite_enemy(sprZombieBodyFlung,1)
				break
		}
		break;
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				subPhase = subState.flung;
				subPhaseTimer = 0;
				break;
			case vState.jumping:
			case vState.midAir:
					//ySpd
				if abs(ySpd) <= 1 ySpd -= GameManager.grav*(3/4) // 1/4 * effect of gravity
					//xSPd
				xSpd -= xSpd/12;
					//Sprite
				update_sprite_enemy(sprZombieBodyAerialStagger,1)
				break;
		}
		break;
	case subState.deflected:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer == round(deflectDuration*room_speed)
				{
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/6;
					//Sprite
				var newImage = sprZombieBodyDeflect;
				var newImageSpeed = sprite_get_number(newImage)/(deflectDuration);
				update_sprite_enemy(newImage,newImageSpeed)
				break;
			case vState.jumping:
			case vState.midAir:
				canChangeVState = false;
				if subPhaseTimer == round(deflectDuration*room_speed)
				{
					canChangeVState = true;
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/6;
					//Sprite
				var newImage = sprZombieBodyDeflectAerial;
				var newImageSpeed = sprite_get_number(newImage)/(deflectDuration);
				update_sprite_enemy(newImage,newImageSpeed)
				break;
		}
		break;
}
		
#endregion

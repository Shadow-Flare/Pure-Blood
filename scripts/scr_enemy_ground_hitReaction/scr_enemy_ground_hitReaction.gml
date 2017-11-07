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
			scr_enemy_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
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
					scr_enemy_ground_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/4;
					//Sprite
				update_sprite_enemy(sprBASEBodyProne,-proneDuration);
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite_enemy(sprBASEBodyFlung,1)
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
				if subPhaseTimer <= round(room_speed*0.7) && ySpd >= -1 && ySpd <= 1
				{
					ySpd -= GameManager.grav*(1) //0 grav
					ySpd -= ySpd/20;
				}
					//xSPd
				xSpd -= xSpd/12;
					//Sprite
				update_sprite_enemy(sprBASEBodyAerialStagger,1)
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
				update_sprite_enemy(sprBASEBodyDeflectAerial,-deflectDuration)
				break;
		}
		break;
}
		
#endregion

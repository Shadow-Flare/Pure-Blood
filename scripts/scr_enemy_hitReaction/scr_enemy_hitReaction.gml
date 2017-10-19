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
				xSpd -= xSpd/8;
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
}
		
#endregion

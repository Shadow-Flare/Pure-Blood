phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deathDuration)
				{
					isDead = true;
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite_enemy(sprBASEBodyDying,-deathDuration);
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//remove flying
				flying = false;
					//Sprite
				update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
				if image_index == sprite_get_number(image_index)-1 image_speed = 0;
				break;
		}
		break;
}
		
#endregion
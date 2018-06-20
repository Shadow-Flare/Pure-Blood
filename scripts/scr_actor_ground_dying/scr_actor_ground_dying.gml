phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
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
				subPhase = subState.aerialStagger;
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
				break;
		}
		break;
		
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				subPhase = subState.none;
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/8;
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite_enemy(sprBASEBodyAerialStagger,1)
				break
		}
		break;
}
		
#endregion
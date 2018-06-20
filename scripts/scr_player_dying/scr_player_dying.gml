if phaseTimer == 0 image_index = 0;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
		if subPhaseTimer >= round(room_speed*deathDuration)
		{
			isDead = true;
			actorType = actorTypes.corpse;
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite(sprPlayerBodyDefaultDying,-deathDuration)
		break;
		
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				subPhase = subState.none;
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite(sprPlayerBodyDefaultAerialStagger,1)
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite(sprPlayerBodyDefaultAerialStagger,1)
				break
		}
		break;
}
		
#endregion
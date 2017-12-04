if subPhaseTimer == 0 baseSpriteIndex = -4;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				subPhase = subState.stunned;
				subPhaseTimer = 0;
				break;
			case vState.jumping:
			case vState.midAir:
				if subPhaseTimer >= round(staggeredDuration*room_speed)
				{
					phase = state.base;
					phaseTimer = 0;
					scr_enemy_flying_base_subPhaseDeterminer();
				}
				break;
		}
			//gravity canceller
		ySpd -= GameManager.grav;
			//speed alterance
		var absSpeed = sqrt(power(xSpd,2)+power(ySpd,2));
		var dir = point_direction(0,0,xSpd,ySpd);
		absSpeed -= absSpeed/4;
		xSpd = absSpeed*dcos(dir);
		ySpd = -absSpeed*dsin(dir);
			//Sprite
		update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
		break;
}
		
#endregion

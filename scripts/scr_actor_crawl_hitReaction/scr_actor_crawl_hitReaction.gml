if subPhaseTimer == 0 baseSpriteIndex = -4;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
	case subState.aerialStagger:
		if subPhaseTimer >= round(room_speed*staggeredDuration)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_actor_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//Sprite
		update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
		if image_index = sprite_get_number(sprite_index)-1 image_speed = 0;
		break;
}
		
#endregion

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
	case subState.flung:
	case subState.aerialStagger:
		if subPhaseTimer >= round(room_speed*staggeredDuration)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//Sprite
		update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
		break;
}
		
#endregion

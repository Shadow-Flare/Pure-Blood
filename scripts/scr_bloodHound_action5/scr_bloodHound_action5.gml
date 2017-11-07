phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//reset
		if subPhaseTimer == round(action5Duration*room_speed)
		{
			driveAction = 2;
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
			if action5SoundID != noone audio_play_sound(action5SoundID,10,0);
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action5Animation,-action5Duration)
		break;
}
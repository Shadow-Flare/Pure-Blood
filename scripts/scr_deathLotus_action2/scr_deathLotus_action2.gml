phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//reset
		if subPhaseTimer == round(action2Duration*room_speed)
		{
			phase = state.base;
			scr_enemy_crawl_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
			changeFacing = true;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Animation,-action2Duration)
		break;
}
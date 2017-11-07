phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.idle:
			//transition
		scr_enemy_crawl_base_subPhaseDeterminer();
			//xSpd
		xSpd = 0
			//sprite
		update_sprite_enemy(sprBASEBodyIdle,1)
		break;
	case subState.running:
			//transition
		scr_enemy_crawl_base_subPhaseDeterminer();
		if driveMove != 0 facing = driveMove;
			//xSpd
		xSpd = facing*statCache.moveSpeed;
			//sprite
		update_sprite_enemy(sprBASEBodyRunning,1)
		break
}

//transitions
	//to action
	if driveAction != 0
	{
		if actionHardCooldownTimer == -1
		{
			//initial data & tranistion
			switch driveAction
			{
				case 1:
					phase = state.action1;
					break;
				case 2:
					phase = state.action2;
					break;
				case 3:
					phase = state.action3;
					break;
				case 4:
					phase = state.action4;
					break;
				case 5:
					phase = state.action5;
					break;
			}
			driveAction = 0;
			actionHardCooldownTimer = 0;
			subPhase = subState.actionSub1;
			phaseTimer = 0;
			subPhaseTimer = 0;
			reset_drives();
		}
	}
phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//blocking
		hitPhase = hitState.blocking;
			//transtitions
				//transition to sub2 before attacking
		if hasBlocked
		{
			lastAttackHasHit = false;
			hasBlocked = false;
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
				//attack if close
		else if instance_exists(target) && abs(target.x-x) < action2AttackRangeSub1
		{
			lastAttackHasHit = false;
			phase = state.base;
			scr_actor_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
			actionHardCooldownTimer = -1;
			if abs(target.y-y) < 32	driveAction = 1;
		}
				//reset to base
		else if subPhaseTimer >= round(action2DurationSub1*room_speed) || sign(target.x-x) != facing
		{
			lastAttackHasHit = false;
			hasBlocked = false;
			hitPhase = hitState.normal;
			phase = state.base;
			scr_actor_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
		}
			//xSpd
		if driveMove != 0 xSpd = driveMove*statCache.moveSpeed*(3/4);
		else xSpd -= xSpd/4;
			//sprite
		if driveMove == facing var newImage = action2AnimationSub1Forward;
		else if driveMove == -facing var newImage = action2AnimationSub1Back;
		else var newImage = action2AnimationSub1Idle;
		update_sprite_enemy(newImage,1);
		break;
	case subState.actionSub2:
			//blocking
		hitPhase = hitState.blocking;
			//transtitions
				//reset to base & set driveAction
		if subPhaseTimer >= round(action2DurationSub2*room_speed)
		{
			lastAttackHasHit = false;
			phase = state.base;
			scr_actor_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
			actionHardCooldownTimer = -1;
			driveAction = 3;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2AnimationSub2,-action2DurationSub2)
		break;
}
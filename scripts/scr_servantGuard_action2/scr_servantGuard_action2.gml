phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//blocking
		hitPhase = hitState.blocking;
		bboxRight = bboxDefaultRight + action2HitBoxShiftSub1;
			//damage zone
		if action2ZoneID == noone
		{
			action2ZoneID = scr_enemy_attack(action2ZoneFrameData,action2ZoneFollow,action2ZoneDuration,action2ZoneDamageType,action2ZoneDamage,action2ZoneStagger,action2ZoneKnockback,action2ZoneStatusType,action2ZoneStatusValue,action2ZonePierce,action2ZoneAnimation,action2ZoneHitSoundID);
			if action2ZoneAttackSoundID != noone audio_play_sound(action2ZoneAttackSoundID,10,0);
		}
			//transtitions
				//transition to sub2 before attacking
		if hasBlocked
		{
			bboxRight = bboxDefaultRight
			hasBlocked = false;
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
				//reset to base
		else if subPhaseTimer >= round(action2DurationSub1*room_speed) || sign(target.x-x) != facing
		{
			hasBlocked = false;
			bboxRight = bboxDefaultRight
			hitPhase = hitState.normal;
			subPhase = subState.actionSub3;
			subPhaseTimer = 0;
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
			hitPhase = hitState.normal;
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
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
	case subState.actionSub3:
		if subPhaseTimer == round(action2DurationSub3*room_speed)
		{
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2AnimationSub3,-action2DurationSub3)
		break;
		break;
}
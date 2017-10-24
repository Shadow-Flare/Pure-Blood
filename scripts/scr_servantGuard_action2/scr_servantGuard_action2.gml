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
			action2ZoneID = scr_enemy_attack(true,-1,action2ZoneXOffset,action2ZoneYOffset,action2ZoneWidth,action2ZoneHeight,action2ZoneDamageType,action2ZoneDamage,action2ZoneStagger,action2ZoneKnockback,action2ZoneStatusType,action2ZoneStatusValue,action2ZonePierce);
		}
			//transtitions
				//transition to sub2 before attacking
		if hasDeflected
		{
			bboxRight = bboxDefaultRight
			hasDeflected = false;
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
				//reset to base
		else if subPhaseTimer >= round(action2DurationSub1*room_speed) || sign(target.x-x) != facing
		{
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
			scr_enemy_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
			actionHardCooldownTimer = -1;
			driveAction = 3;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		var newImage = action2AnimationSub2;
		var newImageSpeed = sprite_get_number(newImage)/(action2DurationSub2)
		update_sprite_enemy(newImage,newImageSpeed)
		break;
	case subState.actionSub3:
		if subPhaseTimer == round(action2DurationSub3*room_speed)
		{
			phase = state.base;
			scr_enemy_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		var newImage = action2AnimationSub3;
		var newImageSpeed = sprite_get_number(newImage)/(action2DurationSub3)
		update_sprite_enemy(newImage,newImageSpeed)
		break;
		break;
}
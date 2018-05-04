phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//blocking
		hitPhase = hitState.blocking;
			//damage zone
		if action2ZoneID == noone
		{
			action2ZoneID = scr_enemy_attack(action2ZoneFrameData,action2ZoneFollow,action2ZoneDuration,action2ZoneDamageData,statCache.damagePower,statCache.staggerPower,action2ZonePierce,action2ZoneAnimation,action2ZoneHitSoundID,noone);
			if action2ZoneAttackSoundID != noone audio_play_sound(action2ZoneAttackSoundID,10,0);
		}
			//transtitions
				//transition to sub2 before attacking
		if hasBlocked
		{
			lastAttackHasHit = false;
			hasBlocked = false;
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
				//reset to base
		else if subPhaseTimer >= round(action2DurationSub1*room_speed) || sign(target.x-x) != facing
		{
			lastAttackHasHit = false;
			hasBlocked = false;
			hitPhase = hitState.normal;
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
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
}
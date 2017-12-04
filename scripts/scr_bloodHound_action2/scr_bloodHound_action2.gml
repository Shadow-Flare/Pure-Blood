phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//transition
		if subPhaseTimer >= round(action2Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2
			subPhaseTimer = 0;
			lastAttackHasHit = false;
			canChangeVState = true;
			vChangeBreak = false;
				//movement burst
			if action2Sub2TargetEnemy action2Sub2Distance = abs(target.x-x);
			var spd = sqrt((GameManager.grav*action2Sub2Distance)/(2*dcos(action2Sub2Angle)*dsin(action2Sub2Angle)))
			xSpd = facing*dcos(action2Sub2Angle)*spd;
			ySpd = -dsin(action2Sub2Angle)*spd;
			phased = true;
			if action2Sub1SoundID != noone audio_play_sound(action2Sub1SoundID,10,0);
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub1Animation,-action2Sub1Duration);
		break;
	case subState.actionSub2:
			//damage Zone
		if action2Sub2ZoneID == noone
		{
			action2Sub2ZoneID = scr_enemy_attack(action2Sub2ZoneFrameData,action2Sub2ZoneFollow,action2Sub2ZoneDuration,action2Sub2ZoneDamageType,action2Sub2ZoneDamage*statCache.damagePower,action2Sub2ZoneStagger*statCache.staggerPower,action2Sub2ZoneKnockback,action2Sub2ZoneStatusType,action2Sub2ZoneStatusValue,action2Sub2ZonePierce,action2Sub2Animation,action2Sub2ZoneHitSoundID);
			if action2Sub2AttackSoundID != noone audio_play_sound(action2Sub2AttackSoundID,10,0);
		}
			//transitions
		if vPhase = vState.grounded
		{
			lastAttackHasHit = false;
			canChangeVState = true;
			vChangeBreak = false;
			if action2Sub2ZoneID != noone
			{
				instance_destroy(action2Sub2ZoneID);
				action2Sub2ZoneID = noone;
			}
			phased = false;
			subPhase = subState.actionSub3;
			subPhaseTimer = 0;
		}
			//xSpd
		//do nothing
			//sprite
		update_sprite_enemy(action2Sub2Animation,1)
		break;
	case subState.actionSub3:
			//damage Zone
		if action2Sub3ZoneID == noone
		{
			action2Sub3ZoneID = scr_enemy_attack(action2Sub3ZoneFrameData,action2Sub3ZoneFollow,action2Sub3ZoneDuration,action2Sub3ZoneDamageType,action2Sub3ZoneDamage*statCache.damagePower,action2Sub3ZoneStagger*statCache.staggerPower,action2Sub3ZoneKnockback,action2Sub3ZoneStatusType,action2Sub3ZoneStatusValue,action2Sub3ZonePierce,action2Sub3Animation,action2Sub3ZoneHitSoundID);
			if action2Sub3ZoneAttackSoundID != noone audio_play_sound(action2Sub3ZoneAttackSoundID,10,0);
		}
		if subPhaseTimer == round(action2Sub3Duration*room_speed)
		{
			lastAttackHasHit = false;
			if action2Sub3ZoneID != noone
			{
				instance_destroy(action2Sub3ZoneID);
				action2Sub3ZoneID = noone;
			}
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub3Animation,-action2Sub3Duration)
		break;
}
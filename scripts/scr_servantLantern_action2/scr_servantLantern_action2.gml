phaseTimer++;
subPhaseTimer++;

	//sprite
update_sprite_enemy(action2Animation,-action2Duration)

switch subPhase
{
	case subState.actionSub1:
			//initialize
		if subPhaseTimer == 1
		{
			lastAttackHasHit = false;
			canChangeVState = true;
			vChangeBreak = false;
		}
			//timing and attack
		if subPhaseTimer == round(action2HitStart*room_speed)
		{
			scr_enemy_attack(action2FrameData,action2Follow,action2HitDuration,action2DamageData,statCache.damagePower,statCache.staggerPower,action2Pierce,action2Animation,action2HitSoundID,noone)
			if action2AttackSoundID != noone audio_play_sound(action2AttackSoundID,10,0);
		}
		else if subPhaseTimer == round(action2Duration*room_speed)
		{
			lastAttackHasHit = false;
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if action2MoveBurst != 0 && phaseTimer == round(action2MoveStart*room_speed)
		{
			xSpd = facing*action2MoveBurst;
		}
				//consistent
		else if action2Move != 0 && phaseTimer >= round(action2MoveStart*room_speed) && phaseTimer <= round((action2MoveStart+action2MoveDuration)*room_speed)
		{
			xSpd = facing*action2Move;
		}
		else xSpd -= xSpd/4;
		break;
}
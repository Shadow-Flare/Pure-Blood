phaseTimer++;
subPhaseTimer++;

	//sprite
update_sprite_enemy(action1Animation,-action1Duration)

		//get deflected
if hasDeflected
{
	lastAttackHasHit = false;
	hasDeflected = false;
	phase = state.hitReaction;
	phaseTimer = 0;
	subPhase = subState.deflected;
	subPhaseTimer = 0;
}
else switch subPhase
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
		if subPhaseTimer == round(action1HitStart*room_speed)
		{
			scr_enemy_attack(action1FrameData,action1Follow,action1HitDuration,action1DamageData,statCache.damagePower,statCache.staggerPower,action1Pierce,action1Animation,action1HitSoundID,noone)
			if action1AttackSoundID != noone audio_play_sound(action1AttackSoundID,10,0);
		}
		if subPhaseTimer == round(action1Duration*room_speed)
		{
			lastAttackHasHit = false;
			hasDeflected = false;
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if action1MoveBurst != 0 && phaseTimer == round(action1MoveStart*room_speed)
		{
			xSpd = facing*action1MoveBurst;
		}
				//consistent
		else if action1Move != 0 && phaseTimer >= round(action1MoveStart*room_speed) && phaseTimer <= round((action1MoveStart+action1MoveDuration)*room_speed)
		{
			xSpd = facing*action1Move;
		}
		else xSpd -= xSpd/4;
		break;
}
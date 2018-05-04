phaseTimer++;
subPhaseTimer++;

	//sprite
update_sprite_enemy(action3Animation,-action3Duration)

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
		if subPhaseTimer == round(action3HitStart*room_speed)
		{
			scr_enemy_attack(action3FrameData,action3Follow,action3HitDuration,action3DamageData,statCache.damagePower,statCache.staggerPower,action3Pierce,action3Animation,action3HitSoundID,noone)
			if action3AttackSoundID != noone audio_play_sound(action3AttackSoundID,10,0);
		}
		if subPhaseTimer == round(action3Duration*room_speed)
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
		if action3MoveBurst != 0 && phaseTimer == round(action3MoveStart*room_speed)
		{
			xSpd = facing*action3MoveBurst;
		}
				//consistent
		else if action3Move != 0 && phaseTimer >= round(action3MoveStart*room_speed) && phaseTimer <= round((action3MoveStart+action3MoveDuration)*room_speed)
		{
			xSpd = facing*action3Move;
		}
		else xSpd -= xSpd/4;
		break;
}
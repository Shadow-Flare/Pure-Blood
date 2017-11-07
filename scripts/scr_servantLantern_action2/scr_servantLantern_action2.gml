phaseTimer++;
subPhaseTimer++;

	//sprite
update_sprite_enemy(action2Animation,-action2Duration)

switch subPhase
{
	case subState.actionSub1:
			//timing and attack
		if subPhaseTimer == round(action2HitStart*room_speed)
		{
			scr_enemy_attack(action2FrameData,action2Follow,action2HitDuration,action2DamageType,action2Damage*statCache.damagePower,action2Stagger*statCache.staggerPower,action2Knockback,action2StatusType,action2StatusValue,action2Pierce,action2Animation,action2HitSoundID)
			if action2AttackSoundID != noone audio_play_sound(action2AttackSoundID,10,0);
		}
		else if subPhaseTimer == round(action2Duration*room_speed)
		{
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
phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//transition
		if subPhaseTimer >= round(action1Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
			phased = true;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Sub1Animation,-action1Sub1Duration);
		break;
	case subState.actionSub2:
			//transition
				//xSpd
		xSpd = facing*statCache.moveSpeed;
		if (subPhaseTimer >= round(action1Sub2Duration*room_speed) || (place_meeting(x+xSpd,y,objActorParent) && !instance_place(x+xSpd,y,objActorParent).phased) || !place_free(x+xSpd,y)) && statCache.hp != 0
		{
			scr_enemy_attack(action1FrameData,action1Follow, action1Duration, action1DamageType, action1Damage*statCache.damagePower, action1Stagger*statCache.staggerPower, action1Knockback, action1StatusType, action1StatusValue, action1Pierce, action1Sub3Animation, action1HitSoundID,noone);
			if action1AttackSoundID != noone audio_play_sound(action1AttackSoundID,10,0);
			statCache.hp = 0;
			xSpd = 0;
		}
			//sprite
		update_sprite_enemy(action1Sub2Animation,1);
		break;
}
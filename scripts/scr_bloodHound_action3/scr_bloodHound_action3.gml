phaseTimer++;
subPhaseTimer++;

	//sprite
update_sprite_enemy(action3Animation,-action3Duration)

		//get deflected
switch subPhase
{
	case subState.actionSub1:
			//Make Corpses
		if subPhaseTimer == round(action3CorpseTime*room_speed)
		{
			var spawnNum = irandom_range(action3CorpseMin,action3CorpseMax)
			repeat(spawnNum)
			{
				with instance_create_depth(x+facing*action3CorpseXOffset,y+action3CorpseYOffset,depth,objBloodHoundCorpse)
				{
					var spd = random_range(3,7.5);
					var ang = random_range(30,60);
					if other.facing == -1 ang = 180-ang;
					facing = irandom(1);
					if facing == 0 facing = -1;
					xSpd = dcos(ang)*spd;
					ySpd = -dsin(ang)*spd;
				}
			}
		}
			//timing and attack
		if subPhaseTimer == round(action3HitStart*room_speed)
		{
			scr_enemy_attack(action3FrameData,action3Follow,action3HitDuration,action3DamageType,action3Damage*statCache.damagePower,action3Stagger*statCache.staggerPower,action3Knockback,action3StatusType,action3StatusValue,action3Pierce,action3Animation,action3HitSoundID)
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
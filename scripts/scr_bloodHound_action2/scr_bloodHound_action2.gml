phaseTimer++;
subPhaseTimer++;

var data1Map = action2Sub2Data;
var data1PerformSoundId = data1Map[? enemyActionData.performSoundID];
var data2Map = action2Sub3Data;
var data2PerformSoundId = data2Map[? enemyActionData.performSoundID];

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
			action2Sub2ZoneID = scr_enemy_attack(data1Map,statCache.damagePower,statCache.staggerPower);
			if data1PerformSoundId != noone audio_play_sound(data1PerformSoundId,10,0);
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
			scr_enemy_attack(data2Map,statCache.damagePower,statCache.staggerPower);
			if data2PerformSoundId != noone audio_play_sound(data2PerformSoundId,10,0);
			
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
		if subPhaseTimer == round(action2Sub3Duration*room_speed)
		{
			lastAttackHasHit = false;
			phase = state.base;
			scr_actor_ground_base_subPhaseDeterminer();
			subPhaseTimer = 0;
			phaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub3Animation,-action2Sub3Duration)
		break;
}
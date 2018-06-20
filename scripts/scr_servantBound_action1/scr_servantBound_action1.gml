phaseTimer++;
subPhaseTimer++;

var dataMap = action1Data;
var dataPerformSoundId = dataMap[? enemyActionData.performSoundID];

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
			scr_enemy_attack(dataMap,statCache.damagePower,statCache.staggerPower);
			if dataPerformSoundId != noone audio_play_sound(dataPerformSoundId,10,0);
			statCache.hp = 0;
			xSpd = 0;
		}
			//sprite
		update_sprite_enemy(action1Sub2Animation,1);
		break;
}
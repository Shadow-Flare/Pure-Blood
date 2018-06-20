///@arg actionMap

phaseTimer++;
subPhaseTimer++;

var damagePower = statCache.damagePower;
var staggerPower = statCache.staggerPower;

var dataMap = argument0;
var dataAnimation = dataMap[? enemyActionData.animation];
var dataDuration = dataMap[? enemyActionData.duration];
var dataHitStart = dataMap[? enemyActionData.hitStart];
var dataHitDuration = dataMap[? enemyActionData.hitDuration]; //unused
var dataPerformSoundId = dataMap[? enemyActionData.performSoundID];
var dataMoveStart = dataMap[? enemyActionData.moveStart];
var dataMoveDuration = dataMap[? enemyActionData.moveDuration];
var dataMoveBurstX = dataMap[? enemyActionData.moveBurstX];
var dataMoveBurstY = dataMap[? enemyActionData.moveBurstY];
var dataMoveX = dataMap[? enemyActionData.moveX];
var dataMoveY = dataMap[? enemyActionData.moveY];

	//sprite
update_sprite_enemy(dataAnimation,-dataDuration);

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
		if subPhaseTimer == round(dataHitStart*room_speed)
		{
			with scr_enemy_attack(dataMap,damagePower,staggerPower)
			{
				//particle systems
			}
			if dataPerformSoundId != noone audio_play_sound(dataPerformSoundId,10,0);
		}
		else if subPhaseTimer == round(dataDuration*room_speed)
		{
			lastAttackHasHit = false;
			phase = state.base;
			scr_actor_flying_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if (dataMoveBurstX != 0 || dataMoveBurstY != 0) && phaseTimer == round(dataMoveStart*room_speed)
		{
			xSpd = facing*dataMoveBurstX;
			ySpd = dataMoveBurstY;
		}
				//consistent
		else if (dataMoveX != 0 || dataMoveY != 0) && phaseTimer >= round(dataMoveStart*room_speed) && phaseTimer <= round((dataMoveStart+dataMoveDuration)*room_speed)
		{
			xSpd = facing*dataMoveX;
			ySpd = dataMoveY;
		}
		else xSpd -= xSpd/4;
		break;
}
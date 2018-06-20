phaseTimer++;
subPhaseTimer++;

var dataMap = action3Data;
var dataPerformSoundId = dataMap[? enemyActionData.performSoundID];
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
update_sprite_enemy(dataAnimation,-dataDuration)

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
		if subPhaseTimer == round(dataHitStart*room_speed)
		{
			scr_enemy_attack(dataMap,statCache.damagePower,statCache.staggerPower);
			if dataPerformSoundId != noone audio_play_sound(dataPerformSoundId,10,0);
		}
		if subPhaseTimer == round(dataDuration*room_speed)
		{
			lastAttackHasHit = false;
			hasDeflected = false;
			phase = state.base;
			scr_actor_ground_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
		break;
}
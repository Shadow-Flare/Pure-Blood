phaseTimer++;
subPhaseTimer++;

var dataMap = action1Data;
var dataPerformSoundId = dataMap[? enemyActionData.performSoundID];

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
		facing = sign(target.x-x);
		if facing == 0 facing = 1;
		if subPhaseTimer >= round(action1Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
			//Speeds
				//slowdown
		xSpd -= xSpd/8;
		ySpd -= ySpd/8;
			//sprites
		update_sprite_enemy(action1Sub1Animation,2);
		break;
	case subState.actionSub2:
		if target != noone && instance_exists(target)
		{
				//initialize
			if subPhaseTimer == 1
			{
				facing = sign(target.x-x);
				if facing == 0 facing = 1;
				lastAttackHasHit = false;
				action1SwoopXInitial = x;
				action1SwoopYInitial = y;
				action1SwoopXFinal = x+facing*aiSwoopStartXDist*2;
				action1SwoopYPeak = y+aiSwoopStartYDist;
			
				var dur = round(action1SwoopDuration*room_speed);
				var height = action1SwoopYInitial-action1SwoopYPeak;
				var xSpdI = (action1SwoopXFinal-action1SwoopXInitial)/dur;
				var acc = 4*height/power(dur,2);
				var ySpdI = -sqrt(2*(height)*acc);
				ySpdI *= -1;
			
				xSpd = xSpdI;
				ySpd = ySpdI;
			
				action1SwoopYAcceleration = acc;
			
					//damage zone
				action1ZoneID = scr_enemy_attack(dataMap,statCache.damagePower,statCache.staggerPower);
				if dataPerformSoundId != noone audio_play_sound(dataPerformSoundId,10,0);
			}
		}
		else
		{
			subPhase = subState.actionSub3;
			subPhaseTimer = 0;
		}
		phased = true;
		//only alter Y
			//parabolic motion
		var dur = round(action1SwoopDuration*room_speed);
		ySpd += action1SwoopYAcceleration;
		if subPhaseTimer >= dur || y+ySpd < action1SwoopYInitial || !place_free(x+xSpd,y+ySpd)
		{
			subPhase = subState.actionSub3;
			subPhaseTimer = 0;
		}
					//sprite
		update_sprite_enemy(action1Animation,0);
		break;
	case subState.actionSub3:
		if subPhaseTimer >= round(action1Sub2Duration*room_speed)
		{
			lastAttackHasHit = false;
			hasDeflected = false;
			phase = state.base;
			scr_actor_flying_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//Speeds
				//slowdown
		xSpd -= xSpd/8;
		ySpd -= ySpd/8;
			//sprites
		update_sprite_enemy(action1Sub2Animation,-action1Sub2Duration);
		break;
}
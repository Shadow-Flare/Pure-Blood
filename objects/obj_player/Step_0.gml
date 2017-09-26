//Initialize enums (MOVE TO CONTROLLER CREATE)
enum state {base, attacking, offhand, ability, dying, blocking, dodging};
enum vState {grounded, midAir, jumping};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, blocking, reaction};

//Initials
IE = instance_exists(inputManager)

#region lock-on
//soft lockon
if (softLockOn||hardLockOn) && !instance_exists(lockOnTarget)
{
	softLockOn = 0;
	hardLockOn = 0;
	lockOnTarget = noone;
}

if IE
{
	if inputManager.rsInput && softLockOn {softLockOn = 0 hardLockOn = 1;}
	else if inputManager.rsInput && hardLockOn {hardLockOn = 0;}
}

if !hardLockOn
{
	var minDist = -1;
	lockOnTarget = noone;
	for (var i = 0; i < instance_number(obj_enemy_parent); i++)
	{
		var posTarget = instance_find(obj_enemy_parent,i);
		var tmpDist = distance_to_object(posTarget)
		if (tmpDist < minDist || minDist == -1) && tmpDist < softLockRange && posTarget.phase != "dying"
		{
			minDist = tmpDist;
			lockOnTarget = posTarget;
		}
	}
	if minDist != -1 softLockOn = 1;
	else softLockOn = 0;
}
else
{
	if distance_to_object(lockOnTarget) > hardLockRange || lockOnTarget.phase == "dying"
	{
		lockOnTarget = noone;
		hardLockOn = 0;
	}
}

if hardLockOn || softLockOn
{
	lockOnDir = sign(lockOnTarget.x-x);
	if lockOnDir == 0 lockOnDir = 1;
}

if gamepad_is_connected(0)
{
	//target switch
	if hardLockOn
	{
		if IE
		{
			var h = inputManager.targetInputH;
			var v = inputManager.targetInputV;
		}
		else
		{
			h = 0;
			v = 0;
		}
		if canChangeTarget && !(h==0&&v==0)
		{
			var minDist = -1;
			if h <= 0 && abs(h)>=abs(v) {var maxAngle = 225; var minAngle = 135;}
			else if h > 0 && abs(h)>=abs(v) {var maxAngle = 45; var minAngle = 315;}
			else if v < 0 && abs(v)>=abs(h) {var maxAngle = 135; var minAngle = 45;}
			else if v >= 0 && abs(v)>= abs(h) {var maxAngle = 315; var minAngle = 225;}
			with obj_enemy_parent
			{
				var searchAngle = point_direction(other.lockOnTarget.x,other.lockOnTarget.y,x,y)
				if other.lockOnTarget != id && ((searchAngle > minAngle && searchAngle < maxAngle)||(minAngle == 315 && (searchAngle < 45 || minAngle > 315))) && (distance_to_object(other.lockOnTarget)<minDist||minDist==-1) && distance_to_object(other) < other.hardLockRange
				{
					minDist = distance_to_object(other.lockOnTarget);
					other.potentialId = id;
				}
			}
			if minDist != -1
			{
				lockOnTarget = potentialId;
				canChangeTarget = 0;
			}
		}
	}
	if !canChangeTarget
	{
		if !IE || (inputManager.targetInput==0&&inputManager.targetInputV==0) canChangeTarget = 1;
	}
}
else
{
	if hardLockOn && IE && inputManager.keyboardTargetChangeInput
	{
		var stopIt = 0;
		if !variable_instance_exists(id,"targetList") targetList = [];
		with obj_enemy_parent
		{
			if distance_to_object(other) <= other.hardLockRange
			{
				for (var i = 0; i < array_length_1d(other.targetList); i++)
				{
					if other.targetList[i] == id
					{
						if id == other.lockOnTarget other.lockOnIndex = i
						stopIt = 1;
					}
				}
				if !stopIt
				{
					var newIndex = array_length_1d(other.targetList);
					other.targetList[newIndex] = id;		
					if id == other.lockOnTarget other.lockOnIndex = newIndex;
				}
			}
		}
		lockOnIndex++;
		if lockOnIndex >= array_length_1d(other.targetList)lockOnIndex = 0;
		lockOnTarget = targetList[lockOnIndex]
	}
}
#endregion

#region passives
//this section will change somewhat to reflect the 
//needed code. Though at times multiple passive
//codes may be needed.

	//targets (only ropeshot atm, stuff will probably be added)
ropeShotTarget = noone;
switch obj_comboCache.activeOffhandActivatableID
{
		//rope shot
	case 0:
		var nearestRopeShotTarget = instance_nearest(x,y,obj_grapple_parent);
		if hardLockOn ropeShotTarget = [lockOnTarget.x,lockOnTarget.y]
		else if distance_to_object(nearestRopeShotTarget) <= ropeShotTargetRange ropeShotTarget = [nearestRopeShotTarget.x,nearestRopeShotTarget.y];
		else ropeShotTarget = noone;
		break;

}

	//melee attack cooldown
if attackHardCooldownTimer != -1
{
	attackHardCooldownTimer++;
	if attackHardCooldownTimer >= round(attackHardCooldown*room_speed)
	{
		attackHardCooldownTimer = -1; //switch off
	}
}
	//offhand attack cooldown
if offhandHardCooldownTimer != -1
{
	offhandHardCooldownTimer++;
	if offhandHardCooldownTimer >= round(offhandHardCooldown*room_speed)
	{
		offhandHardCooldownTimer = -1; //switch off
	}
}

#endregion

#region State mechanisms
switch vPhase
{
	case vState.grounded:
		if !(place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) && phase != state.attacking vPhase = vState.midAir;
		break;
	case vState.midAir:
		if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) && phase != state.attacking vPhase = vState.grounded;
		break;
	case vState.jumping:
		if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) vPhase = vState.grounded;
		if ySpd >= 0 vPhase = vState.midAir;
		break;
}
ySpd += global.g;
if ySpd > maxFallSpeed ySpd = maxFallSpeed;

switch phase
{
	case state.base:
		scr_player_base();
		break;
	case state.attacking:
		scr_player_attacking();
		break;
	case state.offhand:
		scr_player_offhand();
		break;
	case state.blocking:
		scr_player_blocking();
		break;
	case state.dodging:
		scr_player_dodging();
		break;
	case state.ability:
		scr_player_ability();
		break;
}
#endregion

scr_move_with_collisions();

#region old stuff
if global.g = "im a nerd" //just so i can utilize the #regions
{

#region Hit Reaction	
//react to hit
if place_meeting(x,y,obj_enemy_attack_effect) && (!(phase == "dying" && subPhase != "flung") && phase != "dodging")
{
	var effNum = instance_number(obj_enemy_attack_effect);
	for (var i = 0; i < effNum; i++)
	{
		effect = instance_find(obj_enemy_attack_effect,i);
		if place_meeting(x,y,effect)
		{
			enemy = effect.caster;
			if effect.hitOn && !effect.hasHit
			{
				effect.hasHit = 1;
				dirNum = sign(x-enemy.x);
				if phase == "blocking" && dirNum == -facing && !effect.pierce
				{
					subPhase = "reaction"
					blockTimer = 0;
					xSpd = 5*dirNum;
					enemy.deflected = 1;
				}
				else
				{
					// audio (make reflective of enemy)
					audio_play_sound(snd_enemy_hit,10,0);
					// stats
					if  isInvulnerable == "Off" scr_hit(effect,effect.hitType,effect.hitDamage,effect.statusType,effect.statusValue,effect.caster);
					//determine phase
					if effect.hitStagger <= toughness reaction = "nothing";
					else if effect.hitStagger <= toughness*2 || effect.hitKnockback == 0 reaction = "stagger";
					else reaction = "fling";
					// effect & phase
					if ((phase == "hooked" || phase == "hookedStop") && (reaction == "stagger" || reaction == "fling")) || subPhase == "flung"
					{
						if reaction == "stagger"
						{
							effect.hitKnockback = max(10,effect.hitKnockback);
							reaction = "fling";
						}
						if phase == "hooked" instance_destroy(obj_hook);
					}
					switch reaction
					{
						case "nothing":
							 //do not change phase
							break;
						case "stagger":
							if subPhase != "flung" && subPhase != "prone"
							{
								phase = "staggered";
								subPhase = "stagger"
								staggerTimer = 0;
								xSpd = 5*dirNum;
							}
							attackTimer = 0;
							timerState = 0;
							attackNum = 0;
							break;
						case "fling":
							phase = "staggered";
							subPhase = "flung"
							attackTimer = 0;
							timerState = 0;
							proneTimer = 0;
							hasLeftGround = 0;
							reactDir = 35;
							hitPow = effect.hitKnockback;
							xSpd = dirNum*hitPow*dcos(reactDir);
							ySpd = -hitPow*dsin(reactDir);
							attackNum = 0;
							break;
					}
				}
			}
		}
	}
}

//staggerTimer
if phase == "staggered" && global.bInput
{
	bInputQueue = 1;
}

if (phase == "staggered" || phase == "dying") && subPhase == "deflected"
{
	staggerTimer++;
	if staggerTimer >= room_speed*deflectedDuration 
	{
		if phase != "dying" phase = "idle";
		subPhase = "";
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "stagger"
{
	staggerTimer++;
	if staggerTimer >= room_speed*staggerDuration 
	{
		if phase != "dying" phase = "idle";
		subPhase = "";
	}
}
else if (phase == "staggered" || phase == "dying") && (subPhase == "flung")
{
	proneTimer++
	if !onGround hasLeftGround = 1;
	if onGround && (proneTimer >= room_speed || hasLeftGround)
	{
		subPhase = "prone";
		deathTimer = 0;
		proneTimer = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "prone"
{
	proneTimer++;
	if proneTimer >= room_speed*proneDuration
	{
		if phase != "dying" subPhase = "recover";
		proneTimer = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "recover"
{
	proneTimer++;
	if proneTimer >= room_speed*proneRecoverDuration
	{
		if phase != "dying" phase = "idle";
		subPhase = ""
		proneTimer = 0;
	}
}

//special effects
if bleedValue == bleedResist
{
	scr_hit_effect_general(hitType,hitColour,60)
	hp -= maxHp*(60/100);
	bleedValue = 0;
}
bleedValue -= 10/room_speed;
bleedValue = clamp(bleedValue,0,100);
	#endregion

#region Dying & Room Transitions
//clamp HP
hp = clamp(hp,0,global.hpMax);

if hp <= 0 && phase != "dying"
{
	phase = "dying";
	if subPhase != "flung" subPhase = "";
	deathTimer = 0;
}
else if phase == "dying" && subPhase != "flung"
{
	deathTimer++;
	if deathTimer == room_speed*deathDuration
	{
		falling = 1;	//later change this all to reflect desired death screen
		transitioning = 1;
	}
}

//Fall
if place_meeting(x,y,obj_fall) && !instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 1;
}

//Room Change
if (place_meeting(x,y,obj_room_transition))&&(!global.spawning)&&!instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 0;
}
#endregion

}
#endregion
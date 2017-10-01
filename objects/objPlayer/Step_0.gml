//Initialize enums (MOVE TO CONTROLLER CREATE)
enum actorTypes {player, ally, enemy}

enum state {base, attacking, offhand, ability, blocking, dodging, hitReaction, dying};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, reaction, staggered, flung};
enum vState {grounded, midAir, jumping};
enum hitState {normal, blocking, dodging}

//Initials
IE = instance_exists(InputManager)

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
	if InputManager.rsInput && softLockOn {softLockOn = 0 hardLockOn = 1;}
	else if InputManager.rsInput && hardLockOn {hardLockOn = 0;}
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
			var h = InputManager.targetInputH;
			var v = InputManager.targetInputV;
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
		if !IE || (InputManager.targetInput==0&&InputManager.targetInputV==0) canChangeTarget = 1;
	}
}
else
{
	if hardLockOn && IE && InputManager.keyboardTargetChangeInput
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
switch ComboCache.activeOffhandActivatableID
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
	case state.ability:
		scr_player_ability();
		break;
	case state.blocking:
		scr_player_blocking();
		break;
	case state.dodging:
		scr_player_dodging();
		break;
	case state.hitReaction:
		scr_player_hitReaction();
		break;
	case state.dying:
		scr_player_dying();
		break;
}
#endregion

scr_player_hitCheck();
scr_player_statusCheck();
scr_player_equipmentChange();
scr_move_with_collisions();
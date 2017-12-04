//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

	//xSpd
xSpd = 0

	//Sub states
#region states

if vPhase != vState.grounded
{
	phase = state.base;
	phaseTimer = 0;
	subPhaseTimer = 0;
	scr_player_base_subPhaseDeterminer();
}

switch subPhase
{
	case subState.pre:
			//Sprite
		update_sprite(sprPlayerBodyDefaultBlocking,-(blockingDurationPre+blockingDurationBlocking+blockingDurationPost));
		if subPhaseTimer >= round(room_speed*blockingDurationPre)
		{
			hitPhase = hitState.blocking;
			subPhase = subState.performing;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.performing:
			//Sprite
		update_sprite(sprPlayerBodyDefaultBlocking,-(blockingDurationPre+blockingDurationBlocking+blockingDurationPost));
		if hasBlocked
		{
			hasBlocked = false;
			subPhase = subState.reaction;
			subPhaseTimer = 0;
		}
		else if subPhaseTimer >= round(room_speed*blockingDurationBlocking)
		{
			hitPhase = hitState.normal;
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.reaction:
			//Sprite
		update_sprite(sprPlayerBodyDefaultBlockingReaction,-blockingDurationReaction);
		if xInputQueue
		{
			attackNum = 0;
			reset_queue();
			//initial data & tranistion
			hitPhase = hitState.normal;
			phase = state.attacking;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
			scr_player_beginAttack(class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.counter))
			reset_queue();
		}
		else if subPhaseTimer >= round(room_speed*blockingDurationReaction)
		{
			hitPhase = hitState.normal;
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.post:
			//Sprite
		update_sprite(sprPlayerBodyDefaultBlocking,-(blockingDurationPre+blockingDurationBlocking+blockingDurationPost));
		if subPhaseTimer >= round(room_speed*blockingDurationPost)
		{
			phase = state.base;
			phaseTimer = 0;
			subPhaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
		
#endregion

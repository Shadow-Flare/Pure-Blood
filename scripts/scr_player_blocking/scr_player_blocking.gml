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
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordBlocking)/(blockingDurationPre+blockingDurationBlocking+blockingDurationPost);
		update_sprite(sprPlayerBodySwordBlocking,newImageSpeed);
		if subPhaseTimer >= round(room_speed*blockingDurationPre)
		{
			hitPhase = hitState.blocking;
			subPhase = subState.performing;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.performing:
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordBlocking)/(blockingDurationPre+blockingDurationBlocking+blockingDurationPost);
		update_sprite(sprPlayerBodySwordBlocking,newImageSpeed);
		if hasDeflected
		{
			hasDeflected = false;
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
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordBlockingReaction)/(blockingDurationReaction);
		update_sprite(sprPlayerBodySwordBlockingReaction,newImageSpeed);
		if xInputQueue
		{
			blocking = 0;
			attackNum = 0;
			reset_queue();
			//initial data & tranistion
			hitPhase = hitState.normal;
			phase = state.attacking;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
			scr_player_combo(PlayerStats.activeCounterID);
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
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordBlocking)/(blockingDurationPre+blockingDurationBlocking+blockingDurationPost);
		update_sprite(sprPlayerBodySwordBlocking,newImageSpeed);
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

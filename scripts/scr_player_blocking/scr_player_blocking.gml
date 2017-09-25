//get needed data
var IE = instance_exists(inputManager)
if IE && inputManager.xInput xInputQueue = 1;
if IE && inputManager.yInput yInputQueue = 1;
if IE && inputManager.aInput aInputQueue = 1;
if IE && inputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

blocking = 0;

	//xSpd
xSpd = 0
	//ySpd
ySpd += global.g;

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
			subPhase = subState.blocking;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.blocking:
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordBlocking)/(blockingDurationPre+blockingDurationBlocking+blockingDurationPost);
		update_sprite(sprPlayerBodySwordBlocking,newImageSpeed);
		blocking = 1;
		if hasBlocked
		{
			subPhase = subState.reaction;
			subPhaseTimer = 0;
		}
		else if subPhaseTimer >= round(room_speed*blockingDurationBlocking)
		{
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
			attackNum = 0;
			reset_queue();
			//initial data & tranistion
			phase = state.attacking;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
			scr_player_combo_ext(obj_comboCache.activeCounterId);
			reset_queue();
		}
		else if subPhaseTimer >= round(room_speed*blockingDurationReaction)
		{
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
	
	//addional properties
image_xscale = facing;
//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

	//Sprite
var newImageSpeed = sprite_get_number(sprPlayerBodySwordDodging)/(dodgeDurationPerforming+dodgeDurationPost);
update_sprite(sprPlayerBodySwordDodging,newImageSpeed);

	//Sub states
#region states

switch subPhase
{
	case subState.performing:
		dodging = 1;
		if subPhaseTimer >= round(room_speed*dodgeDurationPerforming)
		{
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
			//xSpd
		xSpd = facing*dodgeDistance/(room_speed*dodgeDurationPerforming);
		break;
		
	case subState.post:
		if subPhaseTimer >= round(room_speed*dodgeDurationPost)
		{
			phase = state.base;
			phaseTimer = 0;
			phased = 0;
			dodging = 0;
			subPhaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
		break;
}
		
#endregion
	
	//addional properties
image_xscale = facing;
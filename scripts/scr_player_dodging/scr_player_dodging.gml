//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

	//Sprite
update_sprite(sprPlayerBodyDefaultDodging,-(dodgeDurationPerforming+dodgeDurationPost));

	//Sub states
#region states

switch subPhase
{
	case subState.performing:
			//dodging
		hitPhase = hitState.dodging;
			//xSpd
		xSpd = facing*dodgeDistance/(room_speed*dodgeDurationPerforming);
		
		dodging = 1;
		if subPhaseTimer >= round(room_speed*dodgeDurationPerforming)
		{
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.post:
			//stop dodging
		hitPhase = hitState.normal;
			//xSpd
		xSpd -= xSpd/4;
		
		if subPhaseTimer >= round(room_speed*dodgeDurationPost)
		{
			phase = state.base;
			phaseTimer = 0;
			subPhaseTimer = 0;
			phased = 0;
			dodging = 0;
			canMoveDefend = false;
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
		
#endregion

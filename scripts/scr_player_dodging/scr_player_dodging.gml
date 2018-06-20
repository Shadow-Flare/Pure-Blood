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
		phased = true;
			//xSpd
		xSpd = facing*dodgeDistance/(room_speed*dodgeDurationPerforming);
		
		if subPhaseTimer >= round(room_speed*dodgeDurationPerforming)
		{
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
		break;
		
	case subState.post:
			//stop dodging
		hitPhase = hitState.normal;
		phased = false;
			//xSpd
		xSpd -= xSpd/4;
		
		if subPhaseTimer >= round(room_speed*dodgeDurationPost)
		{
			phase = state.base;
			phaseTimer = 0;
			subPhaseTimer = 0;
			canMoveDefend = false;
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
		
#endregion

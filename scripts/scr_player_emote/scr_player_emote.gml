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
	scr_player_base_subPhaseDeterminer();
}

switch subPhase
{
	case subState.performing:
			//Sprite
		update_sprite(emoteSprite,emoteAnimSpeed);
		if phaseTimer >= round(emoteStateDuration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
		
#endregion

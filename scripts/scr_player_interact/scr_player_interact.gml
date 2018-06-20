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
		update_sprite(interactSprite,-interactAnimDuration);
		if phaseTimer == round(interactUseDuration*room_speed)
		{
			if script_exists(interactScript) script_execute(interactScript);
			if instance_exists(currentInteractionInstance) currentInteractionInstance.used = true;
		}
		if phaseTimer >= round(interactAnimDuration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
		
#endregion

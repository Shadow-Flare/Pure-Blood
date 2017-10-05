	//draw application surface
draw_surface_ext(application_surface,monitorXOffset,monitorYOffset,1,1,0,c_white,1);

switch gameState
{
	case GameState.inGame:
	case GameState.arena:
		switch pauseState
		{
			case PauseState.paused:
				if !instance_exists(PauseController)
				{
					scr_pauseSplash();
					instance_create_layer(0,0,layer,PauseController);
				}
				break;
			case PauseState.transitioning:
				if !instance_exists(TransitionController)
				{
					scr_pauseSplash();
					with instance_create_depth(0,0,layer,TransitionController)
					{
						roomTo = other.transitionRoomTo;
						roomFrom = other.transitionRoomFrom;
					}
				}
				break;
			case PauseState.death:
				if !instance_exists(DeathController)
				{
					scr_pauseSplash();
					instance_create_depth(0,0,layer,DeathController);
				}
				break;
		}
		break;
}
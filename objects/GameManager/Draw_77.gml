	//draw application surface
draw_surface_ext(application_surface,0,0,appSurfModX,appSurfModY,0,c_white,1);

switch gameState
{
	case GameState.inGame:
	case GameState.arena:
	case GameState.hordeMode:
		switch pauseState
		{
			case PauseState.paused:
				if (!layer_exists("Controllers")) layer_create(-1, "Controllers");
				if !instance_exists(PauseController)
				{
					scr_pauseSplash();
					instance_create_layer(0,0,"Controllers",PauseController);
				}
				break;
			case PauseState.transitioning:
				if (!layer_exists("Controllers")) layer_create(-1, "Controllers");
				if !instance_exists(TransitionController)
				{
					scr_pauseSplash();
					with instance_create_depth(0,0,"Controllers",TransitionController)
					{
						roomTo = other.transitionRoomTo;
						roomFrom = other.transitionRoomFrom;
						ID = other.transitionID;
					}
				}
				break;
			case PauseState.death:
				if (!layer_exists("Controllers")) layer_create(-1, "Controllers");
				if !instance_exists(DeathController)
				{
					scr_pauseSplash();
					instance_create_depth(0,0,"Controllers",DeathController);
				}
				break;
		}
		break;
}
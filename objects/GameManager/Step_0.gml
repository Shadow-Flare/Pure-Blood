// Console step
scr_console_step();

//pause state management + transitions
if gameState != GameState.mainMenu
{
	if pauseState == PauseState.normal 
	{
		with objPlayer
		{		
			//begin transition
			if place_meeting(x,y,objRoomTransition)
			{
				var trans =  instance_place(x,y,objRoomTransition)
				other.transitionRoomTo = trans.roomTo;
				other.transitionRoomFrom = room;
				other.pauseState = PauseState.transitioning;
			}

			//begin death
			else if isDead
			{
				isDead = 0;
				other.pauseState = PauseState.death;
			}
		
			//begin pause
			else if InputManager.startInput 
			{
				other.pauseState = PauseState.paused;
			}	
		}
	}
}
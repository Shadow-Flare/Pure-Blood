// Console toggle
if keyboard_key_press(ord("/"))	consoleEnabled = !consoleEnabled;

// Console step
if (consoleEnabled) scr_console_step();

//pause state management + transitions
if pauseState = PauseState.normal
{
	//begin pause
	if InputManager.startInput pauseState = PauseState.paused;
	
	//begin transition
	if instance_exists(objPlayer) with objPlayer
	{
		if place_meeting(x,y,objRoomTransition)
		{
			var trans =  instance_place(x,y,objRoomTransition)
			other.transitionRoomTo = trans.roomTo;
			other.transitionRoomFrom = room;
			other.pauseState = PauseState.transitioning;
		}
	}

	//begin death
	if playerDead
	{
		playerDead = 0;
		pauseState = PauseState.death;
	}
}
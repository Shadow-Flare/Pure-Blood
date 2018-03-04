//pause state management + transitions
if gameState != GameState.mainMenu
{
	if pauseState == PauseState.normal 
	{
			//DIALOG TESTER
		if InputManager.backInput && CutsceneManager.dialogCurrentState == dialogState.closed with CutsceneManager
		{
			dialogCurrentState = dialogState.opening;

			dialogIndex = 0;
			dialogIndexSub = 0;
			dialogCurrentType = dialogType.choice;

			var cache = DialogCache.choices[| dialogIndex];
			ds_list_copy(dialogChoiceOptions,cache[| dialogIndexSub]);
		}
	
		with objPlayer
		{		
			//control manager
			if CutsceneManager.playerCanActDialog && CutsceneManager.playerCanActCutscene
			{
				canAct = true;
			}
			else canAct = false;
			
			//begin transition
			if place_meeting(x,y,objRoomTransition)
			{
				var trans =  instance_place(x,y,objRoomTransition)
				other.transitionRoomTo = trans.roomTo;
				other.transitionRoomFrom = room;
				other.transitionID = trans.ID;
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
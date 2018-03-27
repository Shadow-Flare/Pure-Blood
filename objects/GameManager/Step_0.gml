//pause state management + transitions
if gameState != GameState.mainMenu
{
	if pauseState == PauseState.normal 
	{		
		with objPlayer
		{		
			//determine BattleState
			other.battlePhase = battleState.peace;
			with objEnemyParent
			{
				if distance_to_object(objPlayer) < GameManager.battlePhaseRange
				{
					GameManager.battlePhase = battleState.battle;
					break;
				}
			}
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
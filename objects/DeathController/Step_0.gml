timer++

if timer == room_speed
{
	switch GameManager.gameState
	{
		case GameState.inGame:
			room_goto(GameManager.checkpointMap[? GameManager.currentCheckpointID]);
			GameManager.pauseState = PauseState.normal;
			break;
		case GameState.arena:
			room_goto(room);
			GameManager.pauseState = PauseState.normal;
			break;
		case GameState.hordeMode:
			room_goto(rmMainMenu);
			instance_destroy(all);
			break;
	}
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}

if !objPlayer.isDead
{
	GameManager.pauseState = PauseState.normal;
	instance_destroy();
}
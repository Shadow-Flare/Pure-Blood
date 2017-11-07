timer++

if timer == room_speed
{
	if GameManager.gameState = GameState.hordeMode
	{
		room_goto(rmMainMenu);
		instance_destroy(all);
	}
	else
	{
		room_goto(room);
		GameManager.pauseState = PauseState.normal;
	}
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}
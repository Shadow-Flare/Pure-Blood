timer++

if shiftRoom
{
	room_goto(roomTo);
	draw_texture_flush();
	shiftRoom = false;
}

if timer == room_speed
{
	if roomTo != rmMainMenu
	{
		instance_activate_all();
		with all if !persistent instance_destroy();
		shiftRoom = true;
	}
	else
	{
		instance_deactivate_object(GameManager);
		instance_destroy(all);
		instance_activate_object(GameManager);
		GameManager.pauseState = PauseState.normal;
		room_goto(roomTo);
	}
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}
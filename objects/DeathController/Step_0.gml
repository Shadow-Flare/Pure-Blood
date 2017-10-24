timer++

if timer == room_speed
{
	room_goto(room);
	GameManager.pauseState = PauseState.normal;
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}
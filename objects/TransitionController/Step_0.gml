timer++

if timer == room_speed
{
	instance_activate_all();
	room_goto(roomTo);
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}
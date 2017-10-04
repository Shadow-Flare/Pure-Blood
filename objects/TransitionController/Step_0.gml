timer++

if timer == room_speed
{
	room_goto(roomTo);
}
else if timer >= room_speed*2.5
{
	instance_destroy();
}
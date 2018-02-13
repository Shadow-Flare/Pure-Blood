xPrev = xprevious;
yPrev = yprevious;

if mouse_check_button_pressed(mb_left)
{
	enabled = false;
}

if enabled = false
{
	timer++;
	if timer >= round(2*room_speed)
	{
		timer= 0;
		enabled = true;
	}
}
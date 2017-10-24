draw_set_colour(c_black);

if timer <= room_speed
{	
	draw_set_alpha(timer/room_speed);
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
	draw_set_alpha(1);
}
else if timer <= room_speed*1.5
{
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
}
else
{
	draw_set_alpha(1-(timer-room_speed*1.5)/room_speed);
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
	draw_set_alpha(1);
}
if type == loadType.ending
{
	draw_set_colour(c_black);
	draw_set_alpha(1-(transTimer/(room_speed*transDur)));
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
	draw_set_alpha(1);
}
draw_set_colour(c_black);
surface_set_target(application_surface);
	draw_rectangle(0,0,surface_get_width(application_surface),6,0);
	draw_rectangle(0,surface_get_height(application_surface)-6,surface_get_width(application_surface),surface_get_height(application_surface),0);
surface_reset_target();

#region Screen Shake
//if shakeDuration != 0
//{
	draw_rectangle(-11,-11,room_width+11,-1,0);
	draw_rectangle(-11,-11,-1,room_height+11,0);
	draw_rectangle(-11,room_height,room_width+11,room_height+11,0);
	draw_rectangle(room_width,-11,room_width+11,room_height+11,0);
//}
#endregion
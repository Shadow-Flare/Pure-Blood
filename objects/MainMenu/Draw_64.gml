//options
draw_set_font(fnt_menu_large);
draw_set_colour(c_white);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if sX == i && sY == j
		{
			draw_set_colour(c_blue);
		}
		else
		{
			draw_set_colour(c_white);
		}
		draw_text((10+30*i)*GameManager.GuiRX,(65+7*j)*GameManager.GuiRY,current_menu_options[i, j]);
	}
}

if transType != mainTransType.none
{
	draw_set_colour(c_black);
	draw_set_alpha(transTimer/(room_speed*transDur));
	draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
	draw_set_alpha(1);
}
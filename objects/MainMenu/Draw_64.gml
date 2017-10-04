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
#region basic options draw

for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if sX == i && sY == j
		{
			draw_set_colour(c_blue);
			draw_text(100+500*i,100+40*j,current_menu_options[i, j]);
		}
		else
		{
			draw_set_colour(c_white);
			draw_text(100+500*i,100+40*j,current_menu_options[i, j]);
		}
	}
}

#endregion
#region draw settings data

draw_set_font(fnt_menu);
draw_set_colour(c_white);
ini_open("settings");
	for (var i = 0; i < array_height_2d(current_menu_options); i++)
	{
		for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
		{
			draw_set_colour(c_lime);
			var STR = "Off";
			if j == 0
			{
				if ini_read_real("effects","lighting",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 1
			{
				if ini_read_real("effects","blood",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 2
			{
				if ini_read_real("effects","rain",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 3
			{
				if ini_read_real("effects","fog",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 4
			{
				if ini_read_real("effects","vsync",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 5
			{
				if ini_read_real("effects","hitBoxVisuals",true) STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 6
			{
				if ini_read_real("effects","actorBoxVisuals",true) STR = "On";
				else draw_set_colour(c_red);
			}
			draw_text(100+500*i+250,100+40*j,STR);
		}
	}
ini_close();
	
#endregion
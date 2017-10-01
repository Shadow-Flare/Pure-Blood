x = camera_get_view_x(view_get_camera(view_current));
y = camera_get_view_y(view_get_camera(view_current));

//darken
draw_surface_stretched(global.pauseSplash,x,y,1920,1080);
draw_set_colour(c_black);
draw_set_alpha(0.75);
draw_rectangle(x,y,1920,1080,0);
draw_set_alpha(1);

//options
draw_set_font(fnt_arena_menu);
draw_set_colour(c_white);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if current_menu == "main menu"
		{
			if sX == i && sY == j draw_set_colour(c_blue);
			else draw_set_colour(c_white);
			if expandedNum != 0 && i != 0
			{
				if j == expandedNum -1 draw_set_alpha(1);
				else if j >= expandedNum - 2 && j <= expandedNum draw_set_alpha(0);
				else draw_set_alpha(0.5);
				
			}
			if (j == expandedNum-1) && i >= 1
			{
				draw_text(100+500*i,100+70*j,slotOptions[sExpY]);
			}
			else draw_text(100+500*i,100+70*j,current_menu_options[i, j]);
			draw_set_alpha(1);
		}
	}
}

if expandedNum != 0
{
	for (var i = 0; i < array_length_1d(slotOptions); i++)
	{
		if sExpY != i
		{
			draw_set_alpha((3/(abs(sExpY-i))-1));
			if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
			{
				draw_set_color(c_aqua);
			}
			else draw_set_color(c_gray);
			draw_text(300+300*sX,100+30*(i-sExpY)+70*(expandedNum-1),slotOptions[i]);
			draw_set_alpha(1);
		}
	}
}
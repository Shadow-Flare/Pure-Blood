#region basic options draw

for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		draw_set_halign(fa_center);
		if sX == i && sY == j draw_set_colour(c_blue);
		else if j == 0 && current_menu_options[i,j] == PlayerStats.activeOffhandID draw_set_colour(c_aqua);
		else if j != 0 && current_menu_options[i,j] == PlayerStats.activeOffhandSubtypeID draw_set_colour(c_aqua);
		else draw_set_colour(c_white);
		if j == 0 
		{
			draw_set_font(fnt_menu_large);
			draw_text(960+600*(i-sX),200,ComboCache.offhandNames[? current_menu_options[i, j]]);
			draw_set_font(fnt_menu);
		}
		else draw_text(960+600*(i-sX),300+60*j,ComboCache.offhandSubtypeNames[? current_menu_options[i, j]]);
		draw_set_halign(fa_left);
	}
}

#endregion


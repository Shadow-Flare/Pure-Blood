#region basic options draw

for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if sX == i && sY == j draw_set_colour(c_blue);
		else draw_set_colour(c_white);
		if (slotExpanded) && i >= 1
		{
			if sY == j
			{
				if sX != i draw_text(100+200*i,270+270*j,ComboCache.attackNames[? PlayerStats.activeComboIDs[i-1]]);
				else draw_text(100 + 200 * i, 270 + 270 * j, ComboCache.attackNames[? slot_options[sExpY]]);
			}
		}
		else draw_text(100+200*i,270+270*j, current_menu_options[i, j]);
	}
}

#endregion
#region draw slot options

if slotExpanded
{
	for (var i = 0; i < array_length_1d(slot_options); i++)
	{
		if sExpY != i
		{
			if slot_options[i] == PlayerStats.activeComboIDs[sX-1]
			{
				draw_set_color(c_aqua);
			}
			else draw_set_colour(c_gray)
			draw_text(100+200*sX,270+40*(i-sExpY)+270*sY,ComboCache.attackNames[? slot_options[i]]);
		}
	}
}

#endregion
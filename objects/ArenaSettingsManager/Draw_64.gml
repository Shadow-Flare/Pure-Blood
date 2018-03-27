#region darken and draw splash
if surface_exists(GameManager.pauseSplash) draw_surface(GameManager.pauseSplash,0,0);
draw_set_colour(c_black);
draw_set_alpha(0.75);
draw_rectangle(0,0,1920,1080,0);
draw_set_alpha(1);
#endregion

#region draw options and data
draw_set_font(fnt_arena_menu);
draw_set_colour(c_white);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
			//options
		var col = c_white;
		if !slotExpanded && sX == i && sY == j col = c_blue;
		var textX = 100+800*i;
		var textY = 100+60*j;
		draw_text_colour(textX,textY,current_menu_options[i, j],col,col,col,col,1.0);

			//Data
		if !(slotExpanded && sY == j) && j < array_length_1d(ArenaController.arenaStats)
		{
			var dataText = ArenaController.arenaStats[j];
			draw_text(textX+1100,textY,dataText);
		}
	}
}
#endregion
#region draw slot data
if slotExpanded
{
	for (var i = 0; i < array_length_1d(slotOptions); i++)
	{
		var sep = i-sExpX;
		var col = c_white;
		if slotOptions[i] == ArenaController.arenaStats[sY] col = c_aqua;
		if sep == 0 col = c_blue;
		var alpha = max(1-abs(sep)*(1/4),0);
		
		draw_text_colour(100+1100+800*sX+140*sep,100+60*sY,string(slotOptions[i]),col,col,col,col,alpha);
	}
}
#endregion
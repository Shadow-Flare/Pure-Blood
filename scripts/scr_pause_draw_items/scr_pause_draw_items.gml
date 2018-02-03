//graphical
	//tabs
for (var i = 0; i < ds_list_size(tabSprites); i++)
{
	var col = c_dkgray;
	if (i = selectedTab)
	{
		col = c_white;
		if (selectionY == -1) 
		{
			draw_sprite_ext(selectSprite,0,surfW*(tabX+tabXInc*i),surfH*tabY,0.5,0.5,0,col,1);
		}
	}
	draw_sprite_ext(tabSprites[| i],0,surfW*(tabX+tabXInc*i),surfH*tabY,0.5,0.5,0,col,1);
}

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
				var class = weapon_get_stat(PlayerStats.heldWeapons[sY],weaponStats.type);
				if sX != i draw_text(100+200*i,270+270*j,ComboCache.attackNames[? attack_get_id_class(i-1,vState.grounded,class)]);
				else draw_text(100 + 200 * i, 270 + 270 * j, ComboCache.attackNames[? slot_options[sExpY]]);
			}
		}
		else
		{
			if current_menu_options[i, j] = "weapon 1" var text = weapon_get_stat(PlayerStats.heldWeapons[0],weaponStats.name);
			else if current_menu_options[i, j] = "weapon 2" var text = weapon_get_stat(PlayerStats.heldWeapons[1],weaponStats.name);
			else var text = current_menu_options[i, j];
			draw_text(100+200*i,270+270*j, text);
		}
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
			var class = weapon_get_stat(PlayerStats.heldWeapons[sY],weaponStats.type)
			if slot_options[i] == attack_get_id_class(sX-1,vState.grounded,class)
			{
				draw_set_color(c_aqua);
			}
			else draw_set_colour(c_gray)
			draw_text(100+200*sX,270+40*(i-sExpY)+270*sY,ComboCache.attackNames[? slot_options[i]]);
		}
	}
}

#endregion
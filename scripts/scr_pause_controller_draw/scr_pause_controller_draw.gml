x = camera_get_view_x(view_get_camera(view_current));
y = camera_get_view_y(view_get_camera(view_current));

//darken
draw_surface(global.pauseSplash,0,0);
draw_set_colour(c_black);
draw_set_alpha(0.75);
draw_rectangle(0,0,1980,1080,0);
draw_set_alpha(1);

//options
draw_set_font(fnt_menu);
draw_set_colour(c_white);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if current_menu == "main menu" || current_menu == "inventory" || current_menu == "status" || current_menu == "options"
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
		else if current_menu == "combos"
		{
			if sX == i && sY == j draw_set_colour(c_blue);
			else draw_set_colour(c_white);
			if (slotExpanded) && i >= 1
			{
				if sX != i draw_text(100+200*i,270+270*j,global.activeComboNames[i-1]);
				else draw_text(100 + 200 * i, 270 + 270 * j, global.attackNames[slot_options[sExpY]]);
			}
			else draw_text(100 + 200 * i, 270 + 270 * j, current_menu_options[i, j]);
		}
		else if current_menu == "offhand equipment"
		{
			draw_set_halign(fa_center);
			if sX == i && sY == j draw_set_colour(c_blue);
			else if j == 0 && current_menu_options[i,j] == global.activeOffhandID draw_set_colour(c_aqua);
			else if j != 0 && current_menu_options[i,j] == global.activeOffhandSubtypeID draw_set_colour(c_aqua);
			else draw_set_colour(c_white);
			if j == 0 
			{
				draw_set_font(fnt_menu_large);
				draw_text(960+600*(i-sX),200,global.offhandNames[current_menu_options[i, j]]);
				draw_set_font(fnt_menu);
			}
			else draw_text(960+600*(i-sX),300+60*j,global.offhandSubtypeNames[current_menu_options[i, j]]);
			draw_set_halign(fa_left);
		}
	}
}

instance_activate_object(player);
if current_menu = "status"
{
	draw_set_font(fnt_status);
	draw_set_colour(c_purple);
	draw_text(400,100,"EXP:				" + string(global.xp));
	draw_set_colour(c_yellow);
	draw_text(600,100,"Gold:			" + string(GameManager.gravold));
	draw_set_colour(c_lime);
	draw_text(400,150,"Health:			" + string(ceil(objPlayer.hp))+"/" + string(PlayerStats.hpmax));
	draw_set_colour(c_blue);
	draw_text(600,150,"Mana:			" + string(floor(objPlayer.mp))+"/" + string(global.mpMax));
	draw_set_colour(c_white);
	draw_text(400,250,"Strength:		" + string(global.strength));
	draw_text(400,300,"Constitution:	" + string(global.constitution));
	draw_text(400,350,"Dexterity:		" + string(global.dexterity));
	draw_text(400,400,"Cunning:			" + string(global.cunning));
	draw_text(400,450,"Intelligence:	" + string(global.intelligence));
	draw_text(400,500,"Willpower:		" + string(global.willpower));
}
instance_deactivate_object(player);

draw_set_font(fnt_menu);
draw_set_colour(c_white);
if current_menu = "options"
{
	for (var i = 0; i < array_height_2d(current_menu_options); i++)
	{
		for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
		{
			draw_set_colour(c_lime);
			var STR = "Off";
			if j == 0
			{
				if global.FXLighting STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 1
			{
				if global.FXBlood STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 2
			{
				if EffectsManager.FXRain STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 3
			{
				if global.FXFog STR = "On";
				else draw_set_colour(c_red);
			}
			else if j == 4
			{
				if global.vsync STR = "On";
				else draw_set_colour(c_red);
			}
			draw_text(100+500*i+250,100+40*j,STR);
		}
	}
}

if slotExpanded
{
	for (var i = 0; i < array_length_1d(slot_options); i++)
	{
		if sExpY != i
		{
			if slot_options[i] == global.activeComboIDs[sX-1]
			{
				draw_set_color(c_aqua);
			}
			else draw_set_color(c_gray);
			draw_text(100+200*sX,270+40*(i-sExpY),global.attackNames[slot_options[i]]);
		}
	}
}
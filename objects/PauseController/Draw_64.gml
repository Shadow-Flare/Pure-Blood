x = camera_get_view_x(view_get_camera(view_current));
y = camera_get_view_y(view_get_camera(view_current));

//darken
draw_surface(GameManager.pauseSplash,0,0);
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
				if sX != i draw_text(100+200*i,270+270*j,ComboCache.attackNames[? PlayerStats.activeComboIDs[i-1]]);
				else draw_text(100 + 200 * i, 270 + 270 * j, ComboCache.attackNames[? slot_options[sExpY]]);
			}
			else draw_text(100 + 200 * i, 270 + 270 * j, current_menu_options[i, j]);
		}
		else if current_menu == "offhand equipment"
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
}

if current_menu = "status"
{
	draw_set_font(fnt_status);
	draw_set_colour(c_purple);
	draw_text(400,100,"EXP:				" + string(PlayerStats.xp));
	draw_set_colour(c_yellow);
	draw_text(600,100,"Gold:			" + string(PlayerStats.gold));
	draw_set_colour(c_lime);
	draw_text(400,150,"Health:			" + string(ceil(PlayerStats.hp))+"/" + string(PlayerStats.hpMax));
	draw_set_colour(c_blue);
	draw_text(600,150,"Mana:			" + string(floor(PlayerStats.mp))+"/" + string(PlayerStats.mpMax));
	draw_set_colour(c_white);
	draw_text(400,250,"Strength:		" + string(PlayerStats.strength));
	draw_text(400,300,"Constitution:	" + string(PlayerStats.constitution));
	draw_text(400,350,"Dexterity:		" + string(PlayerStats.dexterity));
	draw_text(400,400,"Cunning:			" + string(PlayerStats.cunning));
	draw_text(400,450,"Intelligence:	" + string(PlayerStats.intelligence));
	draw_text(400,500,"Willpower:		" + string(PlayerStats.willpower));
}

draw_set_font(fnt_menu);
draw_set_colour(c_white);
if current_menu = "options"
{
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
			draw_text(100+500*i+250,100+40*j,STR);
		}
	}
	ini_close();
}

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
			draw_text(100+200*sX,270+40*(i-sExpY),ComboCache.attackNames[? slot_options[i]]);
		}
	}
}
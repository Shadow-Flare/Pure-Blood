splashTimer++;
var frameStep = room_speed/splashFPS;
var frameNum = floor(splashTimer/frameStep);
//gpu_set_tex_filter(true);
draw_sprite_ext(splashSprite,frameNum,0,0,4,4,0,c_white,1.0);
//gpu_set_tex_filter(false);
draw_rectangle_color(0-4,1056,1920+4,1080+4,c_black,c_black,c_black,c_black,false);

//options
draw_set_font(fnt_menu_large);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		if sX == i && sY == j
		{
			draw_set_colour(c_red);
		}
		else
		{
			draw_set_colour(merge_colour(c_red,c_black,0.75));
		}
		draw_text((10+30*i)*GameManager.GuiRX,(10+7*j)*GameManager.GuiRY,current_menu_options[i, j]);
	}
}

var modifier = transTimer/(room_speed*transDur*0.75)
draw_set_colour(c_black);
draw_set_alpha(modifier);
draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0);
draw_set_alpha(1);
if GameManager.musicEnabled audio_sound_gain(backMusic,1-modifier,0);
else audio_sound_gain(backMusic,0,0);
#region basics
var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);
#endregion

#region draw settings data

ini_open("settings");
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		draw_set_font(settingsPanelsFont);
		var col = c_gray;
		if sX == i && sY == j {var col = c_white;}
		draw_sprite_ext(settingsPanelsSprite,0,(settingsPanelsX)*surfW,(settingsPanelsY+settingsPanelsYSep*j)*surfH,settingsPanelsScale,settingsPanelsScale,0,col,1.0);
		draw_text_color((settingsPanelsX+settingsPanelsTextX)*surfW,(settingsPanelsY+settingsPanelsTextY+settingsPanelsYSep*j)*surfH,current_menu_options[i, j],col,col,col,col,1.0);
		var col = settingsSwitchColourOn;
		var STR = "Off";
		switch j
		{
			case 0:
				if ini_read_real("effects","lighting",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 1:
				if ini_read_real("effects","blood",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 2:
				if ini_read_real("effects","rain",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 3:
				if ini_read_real("effects","fog",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 4:
				if ini_read_real("effects","vsync",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 5:
				if ini_read_real("effects","musicEnabled",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 6:
				if ini_read_real("effects","hitBoxVisuals",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 7:
				if ini_read_real("effects","actorBoxVisuals",true) STR = "On";
				else col = settingsSwitchColourOff;
				break;
			case 8:
				if ini_read_real("debug","cutsceneDebug",false) STR = "On";
				else col = settingsSwitchColourOff;
				break;
		}
		var xPos = (settingsPanelsX+settingsSwitchXOffset)*surfW+sprite_get_width(settingsPanelsSprite)*settingsPanelsScale;
		var yPos = (settingsPanelsY+settingsPanelsYSep*j)*surfH;
		draw_sprite_ext(settingsSwitchSprite,0,xPos,yPos,settingsPanelsScale,settingsPanelsScale,0,col,1.0);
		draw_set_font(settingsSwitchFont);
		draw_set_colour(c_black);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(xPos+sprite_get_width(settingsSwitchSprite)*settingsPanelsScale/2,yPos+(sprite_get_height(settingsSwitchSprite)+1)*settingsPanelsScale/2,STR);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}
ini_close();
	
#endregion
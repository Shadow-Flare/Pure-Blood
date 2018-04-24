#region get data
var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);
#endregion

#region Boundaries
	//1 (vert)
var size = (mainBoundary1Y2-mainBoundary1Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary1X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary1Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}

	//2 (vert)
var size = (mainBoundary2Y2-mainBoundary2Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary2X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary2Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}

	//3 (hor)
var size = (mainBoundary3X2-mainBoundary3X1)*surfW;
var sprW = sprite_get_width(spr_pause_main_boundary_hor)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_hor)*mainBoundaryScale;
var n = size/sprW;
for(var i = 0; i < n; i++)
{
	var xPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_hor,0,0,0,sprW/mainBoundaryScale*xPart,sprH/mainBoundaryScale,mainBoundary3X1*surfW+i*sprW,mainBoundary3Y*surfH-sprite_get_yoffset(spr_pause_main_boundary_hor)*mainBoundaryScale,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}
	
	//4 (vert)
var size = (mainBoundary4Y2-mainBoundary4Y1)*surfH;
var sprW = sprite_get_width(spr_pause_main_boundary_vert)*mainBoundaryScale;
var sprH = sprite_get_height(spr_pause_main_boundary_vert)*mainBoundaryScale;
var n = size/sprH;
for(var i = 0; i < n; i++)
{
	var yPart = min(n-i,1);
	draw_sprite_part_ext(spr_pause_main_boundary_vert,0,0,0,sprW/mainBoundaryScale,sprH/mainBoundaryScale*yPart,mainBoundary4X*surfW-sprite_get_xoffset(spr_pause_main_boundary_vert)*mainBoundaryScale,mainBoundary4Y1*surfH+i*sprH,mainBoundaryScale,mainBoundaryScale,c_white,1.0);
}
#endregion

#region Panels

draw_set_font(mainPanelsFont);
for (var i = 0; i < array_height_2d(current_menu_options); i++)
{
	for (var j = 0; j < array_length_2d(current_menu_options,i); j++)
	{
		var col = c_gray;
		if sX == i && sY == j {var col = c_white;}
		draw_sprite_ext(mainPanelsSprite,0,(mainPanelsX)*surfW,(mainPanelsY+mainPanelsYSep*j)*surfH,mainPanelsScale,mainPanelsScale,0,col,1.0);
		draw_text_color((mainPanelsX+mainPanelsTextX)*surfW,(mainPanelsY+mainPanelsTextY+mainPanelsYSep*j)*surfH,current_menu_options[i, j],col,col,col,col,1.0);
	}
}

#endregion
#region Description

#endregion
#region Map

#endregion
#region player status
	//hp
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text_color((mainPlayerHpX1-mainPlayerStatsTextSep)*surfW,(mainPlayerHpY+mainPlayerHpThickness/2)*surfH,"HP",mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,1.0);
scr_draw_bar(mainPlayerHpX1*surfW,mainPlayerHpX2*surfW,mainPlayerHpY*surfH,mainPlayerHpThickness*surfH,PlayerStats.hp,PlayerStats.hpMax,mainPlayerHpScale,mainPlayerHpColour);
	//mp
draw_text_color((mainPlayerMpX1-mainPlayerStatsTextSep)*surfW,(mainPlayerMpY+mainPlayerMpThickness/2)*surfH,"MP",mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,1.0);
scr_draw_bar(mainPlayerMpX1*surfW,mainPlayerMpX2*surfW,mainPlayerMpY*surfH,mainPlayerMpThickness*surfH,PlayerStats.mp,PlayerStats.mpMax,mainPlayerMpScale,mainPlayerMpColour);
	//ap
draw_text_color((mainPlayerApX1-mainPlayerStatsTextSep)*surfW,(mainPlayerApY+mainPlayerApThickness/2)*surfH,"AP",mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,1.0);
scr_draw_bar(mainPlayerApX1*surfW,mainPlayerApX2*surfW,mainPlayerApY*surfH,mainPlayerApThickness*surfH,PlayerStats.ap,PlayerStats.apMax,mainPlayerApScale,mainPlayerApColour);
	//hp Num
draw_text_color((mainPlayerHpX2+mainPlayerStatsNumSep)*surfW,(mainPlayerHpY+mainPlayerHpThickness/2)*surfH,string(round(PlayerStats.hp))+"/"+string(round(PlayerStats.hpMax)),mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,mainPlayerHpTextColour,1.0);
	//mp Num
draw_text_color((mainPlayerMpX2+mainPlayerStatsNumSep)*surfW,(mainPlayerMpY+mainPlayerMpThickness/2)*surfH,string(round(PlayerStats.mp))+"/"+string(round(PlayerStats.mpMax)),mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,mainPlayerMpTextColour,1.0);	
	//ap Num
draw_text_color((mainPlayerApX2+mainPlayerStatsNumSep)*surfW,(mainPlayerApY+mainPlayerApThickness/2)*surfH,string(round(PlayerStats.ap))+"/"+string(round(PlayerStats.apMax)),mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,mainPlayerApTextColour,1.0);
	//exp
draw_set_font(fnt_alagard);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
	draw_text_colour(mainPlayerExpX*surfW,mainPlayerExpY*surfH,string(round(PlayerStats.xpNeeded-PlayerStats.xp)),mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,mainPlayerExpColour,1.0);
	//gold
	draw_text_colour(mainPlayerGoldX*surfW,mainPlayerGoldY*surfH,string(PlayerStats.gold),mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,mainPlayerGoldColour,1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);	
#endregion
#region weaponry status

#endregion


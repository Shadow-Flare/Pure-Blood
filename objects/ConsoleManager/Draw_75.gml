ds_list_add(fpsList,fps_real)
if ds_list_size(fpsList)>=120 ds_list_delete(fpsList,0)
var fpsAverage = 0;
for (var i = 0; i < ds_list_size(fpsList); i++)
{
	fpsAverage += fpsList[| i];
}
fpsAverage /= ds_list_size(fpsList)

if consoleEnabled
{
	if !conPureFps
	{
		show_debug_overlay(1);
		window_set_cursor(cr_default);
		//show input
		viewW = view_wport[view_current]*2;
		viewH = view_hport[view_current]*2;
		draw_set_alpha(0.6);
		draw_set_color(c_black);
		draw_rectangle(0,0,viewW,200,0);
		draw_set_alpha(1);
		draw_set_font(fnt_console);
		draw_set_color(c_white);
		draw_text(10,30,keyboard_string+"_");
		var columnWidth = viewW/4;
		var rowHeight = viewH/108;
		if instance_exists(objPlayer)
		{
			draw_text(viewW-columnWidth*2,rowHeight* 1,"Pos X:                            "+string(objPlayer.x));
			draw_text(viewW-columnWidth*1,rowHeight* 1,"Pos Y:                            "+string(objPlayer.y));
			draw_text(viewW-columnWidth*2,rowHeight* 2,"xSpd:                             "+string(objPlayer.xSpd));
			draw_text(viewW-columnWidth*1,rowHeight* 2,"ySpd:                             "+string(objPlayer.ySpd));
			draw_text(viewW-columnWidth*2,rowHeight* 3,"envXSpd:                          "+string(objPlayer.envXSpd));
			draw_text(viewW-columnWidth*1,rowHeight* 3,"envYSPd:                          "+string(objPlayer.envYSpd));
			draw_text(viewW-columnWidth*2,rowHeight* 4,"FPS:                              "+string(fpsAverage));
			draw_text(viewW-columnWidth*1,rowHeight* 4,"Attack Number:                    "+string(objPlayer.attackNum));
			draw_text(viewW-columnWidth*2,rowHeight* 5,"Player Phase:                     "+string(objPlayer.phase));
			draw_text(viewW-columnWidth*1,rowHeight* 5,"Player Sub-Phase:                 "+string(objPlayer.subPhase));
			draw_text(viewW-columnWidth*2,rowHeight* 6,"Player Vertical-Phase:            "+string(objPlayer.vPhase));
			draw_text(viewW-columnWidth*1,rowHeight* 6,"Lock-On Type:                     "+string(conLockOnType));

			if objPlayer.lockOnTarget != noone && instance_exists(objPlayer.lockOnTarget)
			{
				var enemy = objPlayer.lockOnTarget;
				var cache = enemy.statCache;
				draw_text(viewW-columnWidth*2,rowHeight* 8,"Target Enemy:                     "+string(object_get_name(enemy.object_index)));
				draw_text(viewW-columnWidth*1,rowHeight* 8,"Target Enemy Phase:               "+string(enemy.phase));
				draw_text(viewW-columnWidth*2,rowHeight* 9,"Target Enemy SubPhase:            "+string(enemy.subPhase));
				draw_text(viewW-columnWidth*1,rowHeight* 9,"Target Enemy Vertical-Phase:      "+string(enemy.vPhase));
				draw_text(viewW-columnWidth*2,rowHeight*10,"Target Enemy Pos X:               "+string(enemy.x));
				draw_text(viewW-columnWidth*1,rowHeight*10,"Target Enemy Pos Y:               "+string(enemy.y));
				draw_text(viewW-columnWidth*2,rowHeight*11,"Target Enemy Hp:                  "+string(cache.hp)+"/"+string(cache.hpMax));
				draw_text(viewW-columnWidth*1,rowHeight*11,"Target Enemy Mp:                  "+string(cache.mp)+"/"+string(cache.mpMax));
				draw_text(viewW-columnWidth*2,rowHeight*12,"Target Enemy Toughness:           "+string(cache.toughness));
				draw_text(viewW-columnWidth*1,rowHeight*12,"Target Enemy Break HP:            "+string(round(cache.breakHp*100)/100)+"/"+string(cache.toughness));
			}
		}
	
		for(var i = 0; i < maxHistory; i++)
		{
			draw_text(20,50+10*i,history[i]);
			draw_text(450,50+10*i,historyM[i]);
		}
	
		if conHelpMenu
		{
			draw_set_alpha(0.6);
			draw_set_color(c_black);
			draw_rectangle(0,200,viewW,200+(array_length_1d(helpText)+2)*10,0);
			draw_set_alpha(1);
			draw_set_font(fnt_console);
			draw_set_color(c_white);
			for (var i = 0; i < array_length_1d(helpText);i++)
			{
				draw_text(20,210+10*i,helpText[i]);
				draw_text(450,210+10*i,helpTextM[i]);
			}
		}
	}
	else
	{		
		draw_set_font(fnt_console);
		draw_set_color(c_white);
		draw_text(10,40,keyboard_string+"_");
		draw_text(viewW-280,40,"FPS:						"+string(fpsAverage));
		
		show_debug_overlay(0);
		window_set_cursor(cr_none);
	}
}
else
{
	show_debug_overlay(0);
	window_set_cursor(cr_none);
}

if lightTester != noone && instance_exists(lightTester)
{
	var boxY = 0;
	var boxX = 0;
	if conHelpMenu
	{
		boxY += 200+(array_length_1d(helpText)+2)*10
	}
	if consoleEnabled
	{
		boxY += 200;
	}
	
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(boxX,boxY,boxX+LTBoxWidth,boxY+LTBoxHeight,0);
	draw_set_alpha(1);
	draw_set_font(fnt_console);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
		//title/instructions
	draw_text(boxX+1/2*LTBoxWidth,boxY+0.5/3*LTBoxHeight,"Light Tester");
	draw_text(boxX+1/2*LTBoxWidth,boxY+2.5/3*LTBoxHeight,"Press Num8, Num2, Num4 & Num6 (LRUD) to navigate.");
		//indeces
	draw_text(boxX+1/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Red");
	draw_text(boxX+2/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Green");
	draw_text(boxX+3/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Blue");
	draw_text(boxX+4/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Radius");
	draw_text(boxX+5/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Sim Depth");
	draw_text(boxX+6/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Blur Radius");
	draw_text(boxX+7/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Radial Blur");
	draw_text(boxX+8/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Light Scale");
	draw_text(boxX+9/10*LTBoxWidth,boxY+1/3*LTBoxHeight,"Dynamic Light Reso");
	
		//data
	if other.selectedVariable == 0 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+1/10*LTBoxWidth,boxY+2/3*LTBoxHeight,lightTester.colourR);
	if other.selectedVariable == 1 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+2/10*LTBoxWidth,boxY+2/3*LTBoxHeight,lightTester.colourG);
	if other.selectedVariable == 2 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+3/10*LTBoxWidth,boxY+2/3*LTBoxHeight,lightTester.colourB);
	if other.selectedVariable == 3 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+4/10*LTBoxWidth,boxY+2/3*LTBoxHeight,lightTester.radius);
	if other.selectedVariable == 4 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+5/10*LTBoxWidth,boxY+2/3*LTBoxHeight,lightTester.simDepth);
	if other.selectedVariable == 5 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+6/10*LTBoxWidth,boxY+2/3*LTBoxHeight,LightingController.blurRadius);
	if other.selectedVariable == 6 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+7/10*LTBoxWidth,boxY+2/3*LTBoxHeight,LightingController.radialBlurFactor);
	if other.selectedVariable == 7 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+8/10*LTBoxWidth,boxY+2/3*LTBoxHeight,LightingController.lightScale);
	if other.selectedVariable == 8 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+9/10*LTBoxWidth,boxY+2/3*LTBoxHeight,LightingController.dynamicLightReso);
	
	draw_set_halign(fa_left);
}

if ambienceTester
{
	var boxY = 0;
	var boxX = 0;
	if conHelpMenu
	{
		boxY += 170+array_length_1d(helpText)*10
	}
	if consoleEnabled
	{
		boxY += 200;
	}
	
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(boxX,boxY,boxX+ATBoxWidth,boxY+ATBoxHeight,0);
	draw_set_alpha(1);
	draw_set_font(fnt_console);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
		//title/instructions
	draw_text(boxX+1/2*ATBoxWidth,boxY+0.5/3*ATBoxHeight,"Ambience Tester, Page: "+string(selectedPage+1));
	draw_text(boxX+1/2*ATBoxWidth,boxY+2.5/3*ATBoxHeight,"Press Num8, Num2, Num4 & Num6 (LRUD) to navigate.");
		//indeces
	switch (selectedPage)
	{
		case 0:
			draw_text(boxX+2/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Red");
			draw_text(boxX+3/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Green");
			draw_text(boxX+4/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Blue");
			draw_text(boxX+5/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Blend");
			draw_text(boxX+6/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Cutout Blend");
			break;
		case 1:
			draw_text(boxX+2/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Darkness");
			draw_text(boxX+3/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Red");
			draw_text(boxX+4/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Blue");
			draw_text(boxX+5/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Green");
			draw_text(boxX+6/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Angle");
			break;
		case 2:
			draw_text(boxX+2/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Blur");
			draw_text(boxX+3/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Reso");
			draw_text(boxX+4/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"Shaft Step Reso");
			//draw_text(boxX+5/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"");
			//draw_text(boxX+6/8*ATBoxWidth,boxY+1/3*ATBoxHeight,"");
			break;
	}
	
		//data
	var ambienceCache = RoomCache.rmAmbientLightData[? room];
	var shaftCache = RoomCache.rmSunData[? room];
	
	switch (selectedPage)
	{
		case 0:
			if other.selectedVariable == 0 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+1/8*ATBoxWidth,boxY+2/3*ATBoxHeight,"<");
			if other.selectedVariable == 1 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+2/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_red(ambienceCache[| 0]));
			if other.selectedVariable == 2 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+3/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_green(ambienceCache[| 0]));
			if other.selectedVariable == 3 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+4/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_blue(ambienceCache[| 0]));
			if other.selectedVariable == 4 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+5/8*ATBoxWidth,boxY+2/3*ATBoxHeight,ambienceCache[| 1]);
			if other.selectedVariable == 5 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+6/8*ATBoxWidth,boxY+2/3*ATBoxHeight,ambienceCache[| 2]);
			if other.selectedVariable == 6 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+7/8*ATBoxWidth,boxY+2/3*ATBoxHeight,">");
			break;
		case 1:
		
			if other.selectedVariable == 0 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+1/8*ATBoxWidth,boxY+2/3*ATBoxHeight,"<");
			if other.selectedVariable == 1 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+2/8*ATBoxWidth,boxY+2/3*ATBoxHeight,RoomCache.rmDarknessData[? room]);
			if other.selectedVariable == 2 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+3/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_red(shaftCache[| 0]));
			if other.selectedVariable == 3 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+4/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_green(shaftCache[| 0]));
			if other.selectedVariable == 4 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+5/8*ATBoxWidth,boxY+2/3*ATBoxHeight,color_get_blue(shaftCache[| 0]));
			if other.selectedVariable == 5 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+6/8*ATBoxWidth,boxY+2/3*ATBoxHeight,shaftCache[| 1]);
			if other.selectedVariable == 6 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+7/8*ATBoxWidth,boxY+2/3*ATBoxHeight,">");
			break;
		case 2:
			if other.selectedVariable == 0 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+1/8*ATBoxWidth,boxY+2/3*ATBoxHeight,"<");
			if other.selectedVariable == 1 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+2/8*ATBoxWidth,boxY+2/3*ATBoxHeight,shaftCache[| 2]);
			if other.selectedVariable == 2 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+3/8*ATBoxWidth,boxY+2/3*ATBoxHeight,LightingController.shaftLightReso);
			if other.selectedVariable == 3 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+4/8*ATBoxWidth,boxY+2/3*ATBoxHeight,LightingController.shaftLightStepReso);
			if other.selectedVariable == 4 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+5/8*ATBoxWidth,boxY+2/3*ATBoxHeight,"---");
			if other.selectedVariable == 5 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+6/8*ATBoxWidth,boxY+2/3*ATBoxHeight,"---");
			if other.selectedVariable == 6 draw_set_color(c_blue); else draw_set_colour(c_white);
			draw_text(boxX+7/8*ATBoxWidth,boxY+2/3*ATBoxHeight,">");
			break;
	}
	draw_set_halign(fa_left);
}
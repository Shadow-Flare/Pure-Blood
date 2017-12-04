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
		draw_set_alpha(0.5);
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

			if objPlayer.lockOnTarget != noone
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
				draw_text(viewW-columnWidth*2,rowHeight*12,"Target Enemy Physical Break:      "+string(round(cache.physicalBreakHp*100)/100)+"/"+string(cache.physicalToughness));
				draw_text(viewW-columnWidth*1,rowHeight*12,"Target Enemy Magical Break:       "+string(round(cache.magicalBreakHp*100)/100)+"/"+string(cache.magicalToughness));
			}
		}
	
		for(var i = 0; i < 7; i++)
		{
			draw_text(20,50+10*i,history[i]);
			draw_text(450,50+10*i,historyM[i]);
		}
	
		if conHelpMenu
		{
			draw_set_alpha(0.75);
			draw_set_color(c_black);
			draw_rectangle(0,130,viewW,170+array_length_1d(helpText)*10,0);
			draw_set_alpha(1);
			draw_set_font(fnt_console);
			draw_set_color(c_white);
			for (var i = 0; i < array_length_1d(helpText);i++)
			{
				draw_text(20,150+10*i,helpText[i]);
				draw_text(450,150+10*i,helpTextM[i]);
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
		boxY += 170+array_length_1d(helpText)*10
	}
	if consoleEnabled
	{
		boxY += 200;
	}
	
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(boxX,boxY,boxX+boxWidth,boxY+boxHeight,0);
	draw_set_alpha(1);
	draw_set_font(fnt_console);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
		//indeces
	draw_text(boxX+1/9*boxWidth,boxY+1/3*boxHeight,"Red");
	draw_text(boxX+2/9*boxWidth,boxY+1/3*boxHeight,"Green");
	draw_text(boxX+3/9*boxWidth,boxY+1/3*boxHeight,"Blue");
	draw_text(boxX+4/9*boxWidth,boxY+1/3*boxHeight,"Radius");
	draw_text(boxX+5/9*boxWidth,boxY+1/3*boxHeight,"Blur Radius");
	draw_text(boxX+6/9*boxWidth,boxY+1/3*boxHeight,"Radial Blur");
	draw_text(boxX+7/9*boxWidth,boxY+1/3*boxHeight,"Light Scale");
	draw_text(boxX+8/9*boxWidth,boxY+1/3*boxHeight,"Dynamic Light Reso");
	
		//data
	if other.selectedVariable == 0 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+1/9*boxWidth,boxY+2/3*boxHeight,lightTester.colourR);
	if other.selectedVariable == 1 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+2/9*boxWidth,boxY+2/3*boxHeight,lightTester.colourG);
	if other.selectedVariable == 2 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+3/9*boxWidth,boxY+2/3*boxHeight,lightTester.colourB);
	if other.selectedVariable == 3 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+4/9*boxWidth,boxY+2/3*boxHeight,lightTester.radius);
	if other.selectedVariable == 4 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+5/9*boxWidth,boxY+2/3*boxHeight,LightingController.blurRadius);
	if other.selectedVariable == 5 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+6/9*boxWidth,boxY+2/3*boxHeight,LightingController.radialBlurFactor);
	if other.selectedVariable == 6 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+7/9*boxWidth,boxY+2/3*boxHeight,LightingController.lightScale);
	if other.selectedVariable == 7 draw_set_color(c_blue); else draw_set_colour(c_white);
	draw_text(boxX+8/9*boxWidth,boxY+2/3*boxHeight,LightingController.dynamicLightReso);
	
	draw_set_halign(fa_left);
}
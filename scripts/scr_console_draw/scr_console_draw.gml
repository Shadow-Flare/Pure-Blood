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
		draw_set_alpha(0.75);
		draw_set_color(c_black);
		draw_rectangle(0,0,viewW,130,0);
		draw_set_alpha(1);
		draw_set_font(fnt_console);
		draw_set_color(c_white);
		draw_text(10,30,keyboard_string+"_");
		if instance_exists(objPlayer)
		{
			draw_text(viewW-400*2,30,"Pos X:					"+string(objPlayer.x));
			draw_text(viewW-200*2,30,"Pos Y:					"+string(objPlayer.y));
			draw_text(viewW-400*2,40,"FPS:						"+string(fpsAverage));
			draw_text(viewW-200*2,40,"Attack Number:			"+string(objPlayer.attackNum));
			draw_text(viewW-400*2,50,"Player Phase:				"+string(objPlayer.phase));
			draw_text(viewW-200*2,50,"Player Sub-Phase:			"+string(objPlayer.subPhase));
			draw_text(viewW-400*2,60,"Lock-On Type:				"+string(conLockOnType));
			if conLockOnTarget != noone draw_text(viewW-200*2,60,"Lock-On Target:			"+string(object_get_name(conLockOnTarget)));
	
			if instance_exists(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent))
			{
				draw_text(viewW-400*2, 90,"Nearest Enemy:			"+string(object_get_name(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).object_index)));
				draw_text(viewW-200*2, 90,"Nearest Enemy Attack:	"+string(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).nextAttack));
				draw_text(viewW-400*2,100,"Nearest Enemy Phase:		"+string(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).phase));
				draw_text(viewW-200*2,100,"Nearest Enemy SubPhase:	"+string(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).subPhase));
				draw_text(viewW-400*2,110,"Nearest Enemy Pos X:		"+string(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).x));
				draw_text(viewW-200*2,110,"Nearest Enemy Pos Y:		"+string(instance_nearest(objPlayer.x,objPlayer.y,objEnemyParent).y));
			}
		}
	
		for(var i = 0; i < 7; i++)
		{
			draw_text(20,50+10*i,history[i]);
			draw_text(450,50+10*i,historyM[i]);
		}
	
		if conHelpMenu == 1
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
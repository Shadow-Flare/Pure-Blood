/*
shader_set(shd_bloom);
shader_set_uniform_f(bloomIntensity,darknessStr/3); //0 = off, 1 = a bit, 80 = extremely intense
shader_set_uniform_f(bloomblurSize,1/512);
draw_surface(application_surface, 0, 0);
shader_reset();
*/

//Console draw
if (consoleEnabled) scr_console_draw();

switch gameState
{
	case GameState.inGame:
	case GameState.arena:
		if pauseState = PauseState.normal
		{
			/*
			//Stats //HP
			hp = ceil(objPlayer.hp);
			hpMax = PlayerStats.hphpMaxmax;
			draw_set_font(fnt_menu_large);
			draw_set_colour(make_color_rgb(255-(hp/hpMax*255),hp/hpMax*255,0));
			draw_text(40,40,string(floor(hp))+"/"+string(floor(hpMax)));
				//MP
			mp = floor(objPlayer.mp);
			maxMp = global.mpMax;
			draw_set_font(fnt_menu_large);
			draw_set_colour(make_color_rgb(255-(mp/maxMp*255),0,mp/maxMp*255));
			draw_text(40,80,string(floor(mp))+"/"+string(floor(maxMp)));

			//equipment
				//Offhand && Subtype
			activeAbilityName = ComboCache.offhandActivatableNames[ComboCache.activeOffhandActivatableID];
			offhandName = ComboCache.offhandNames[ComboCache.activeOffhandID];
			offhandSubtypeName = ComboCache.offhandSubtypeNames[ComboCache.activeOffhandSubtypeID];
			draw_set_font(fnt_menu);
			draw_set_colour(c_orange);
			draw_set_valign(fa_bottom);
			draw_text(40,1080-120,offhandName);
			draw_text(60,1080-80,offhandSubtypeName);
			draw_text(80,1080-40,activeAbilityName);
			draw_set_valign(fa_top);
			*/
		}
		break;
}
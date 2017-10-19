//Console draw
if (consoleEnabled) scr_console_draw();
else
{
	show_debug_overlay(0);
	window_set_cursor(cr_none);
}

switch gameState
{
	case GameState.inGame:
	case GameState.arena:
		if pauseState = PauseState.normal
		{
			//Stats //HP
			var hp = ceil(PlayerStats.hp);
			var hpMax = PlayerStats.hpMax;
			draw_set_font(fnt_menu_large);
			draw_set_colour(make_color_rgb(255-(hp/hpMax*255),hp/hpMax*255,0));
			draw_text(40,40,string(floor(hp))+"/"+string(floor(hpMax)));
				//MP
			var mp = floor(PlayerStats.mp);
			var mpMax = PlayerStats.mpMax;
			draw_set_font(fnt_menu_large);
			draw_set_colour(make_color_rgb(255-(mp/mpMax*255),0,mp/mpMax*255));
			draw_text(40,80,string(floor(mp))+"/"+string(floor(mpMax)));

			//equipment
				//Offhand && Subtype
			var activeAbilityName = ComboCache.offhandActivatableNames[? PlayerStats.activeOffhandActivatableID];
			var offhandName = ComboCache.offhandNames[? PlayerStats.activeOffhandID];
			var offhandSubtypeName = ComboCache.offhandSubtypeNames[? PlayerStats.activeOffhandSubtypeID];
			draw_set_font(fnt_menu);
			draw_set_colour(c_orange);
			draw_set_valign(fa_bottom);
			draw_text(40,1080-120,offhandName);
			draw_text(60,1080-80,offhandSubtypeName);
			draw_text(80,1080-40,activeAbilityName);
			draw_set_valign(fa_top);
		}
		break;
}
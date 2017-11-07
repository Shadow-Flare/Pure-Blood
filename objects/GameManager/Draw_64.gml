var GUIWidth = surface_get_width(application_surface);
var GUIHeight = surface_get_height(application_surface)

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
	case GameState.hordeMode:
		if pauseState = PauseState.normal
		{
			//messages
			if ds_list_size(messageFeed) != 0
			{
				var deleteMessage = false;
				messageTop -= messageMovePerFrame;
				if messageTop < 0 messageTop = 0;
				for (var i = 0; i < ds_list_size(messageFeed); i++)
				{
					messageTimers[| i]++;			
					if i != 0 messageTimers[| i] = clamp(messageTimers[| i],0,messageFadeDuration*room_speed);
					var tim = messageTimers[| i];
					if tim <= round(messageFadeDuration*room_speed) draw_set_alpha(tim/(messageFadeDuration*room_speed));
					else if tim >= round((messageFadeDuration+messageShowDuration)*room_speed) draw_set_alpha(1-((tim-((messageShowDuration+messageFadeDuration)*room_speed))/(messageFadeDuration*room_speed)));
					else draw_set_alpha(1);
					if i == 0 && messageTimers[| i] = round((messageFadeDuration*2+messageShowDuration)*room_speed)
					{
						deleteMessage = true;
					}
					draw_set_font(fnt_menu);
					draw_set_colour(c_white);
					draw_set_halign(fa_right);
					draw_text(GUIWidth-20,20+messageTop+i*messageDivider,messageFeed[| i]);
					draw_set_halign(fa_left);
					draw_set_alpha(1);
				}
				if deleteMessage
				{
					ds_list_delete(messageFeed,0);
					ds_list_delete(messageTimers,0);
					messageTop += messageDivider;
				}
			}
			
			//level up indication
			if PlayerStats.statPoints != 0 draw_circle_color(20,20,15,c_yellow,c_yellow,false);
			
			//HP
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
				//Offhand && Subtype && weapon
			var equipmentName = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.name)
			var offhandName = ComboCache.offhandNames[? PlayerStats.activeOffhandID];
			var offhandSubtypeName = ComboCache.offhandSubtypeNames[? PlayerStats.activeOffhandSubtypeID];
			var activeAbilityName = ComboCache.offhandActivatableNames[? PlayerStats.activeOffhandActivatableID];
			draw_set_font(fnt_menu);
			draw_set_colour(c_orange);
			draw_set_valign(fa_bottom);
			draw_text(20,1080-160,equipmentName);
			draw_text(40,1080-120,offhandName);
			draw_text(60,1080-80,offhandSubtypeName);
			draw_text(80,1080-40,activeAbilityName);
			draw_set_valign(fa_top);
		}
		break;
}
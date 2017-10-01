switch gameState
{
	case GameState.inGame:
	case GameState.arena:
		if (objPlayer.pauseing)
		{
			objPlayer.pauseing = 0;
			global.paused = 1;
			global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
			surface_set_target(global.pauseSplash);
				draw_set_colour(c_white);
				draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
				gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
					draw_surface(application_surface,0,0);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
			instance_create_layer(0,0,layer_get_id("lay_interactables"),PauseController);
		}

		if objPlayer.transitioning && !objPlayer.falling
		{
			objPlayer.transitioning = 0;
			global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
			surface_set_target(global.pauseSplash);
				draw_set_colour(c_white);
				draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
				gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
					draw_surface(application_surface,0,0);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
			global.roomTrans = instance_nearest(objPlayer.x,objPlayer.y,obj_room_transition);
			instance_create_depth(x,y,-10000,TransitionManager);
		}
		else if objPlayer.transitioning && objPlayer.falling
		{
			objPlayer.transitioning = 0;
			objPlayer.falling = 0;
			objPlayer.hp = PlayerStats.hpmax;
			global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
			surface_set_target(global.pauseSplash);
				draw_set_colour(c_white);
				draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
				gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
					draw_surface(application_surface,0,0);
				gpu_set_blendmode(bm_normal);
			surface_reset_target();
			global.roomTrans = instance_create_layer(x,y,layer_get_id("lay_technicals"),obj_room_transition);
			with global.roomTrans {roomTo = room; roomFrom = room;}
			instance_create_depth(0,0,-10000,TransitionManager);
		break;
		}
}
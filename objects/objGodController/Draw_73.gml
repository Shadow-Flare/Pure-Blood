if player.pauseing
{
	player.pauseing = 0;
	global.paused = 1;
	global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(global.pauseSplash);
		draw_set_colour(c_white);
		draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
			draw_surface(application_surface,0,0);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	instance_create_layer(0,0,layer_get_id("lay_interactables"),obj_pause_controller);
}

if player.transitioning && !player.falling
{
	player.transitioning = 0;
	global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(global.pauseSplash);
		draw_set_colour(c_white);
		draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
			draw_surface(application_surface,0,0);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	global.roomTrans = instance_nearest(player.x,player.y,obj_room_transition);
	instance_create_depth(x,y,-10000,obj_transition_controller);
}
else if player.transitioning && player.falling
{
	player.transitioning = 0;
	player.falling = 0;
	player.hp = global.hpMax;
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
	instance_create_depth(0,0,-10000,obj_transition_controller);
}
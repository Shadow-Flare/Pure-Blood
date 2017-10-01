if pausing
{
	pausing = 0;
	global.paused = 1;
	global.pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(global.pauseSplash);
		draw_set_colour(c_white);
		draw_rectangle(0,0,surface_get_width(application_surface),surface_get_height(application_surface),0)
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_src_color,bm_zero,bm_one)
			draw_surface(application_surface,0,0);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	instance_create_layer(0,0,layer_get_id("lay_interactables"),ArenaSettingsManager);
}
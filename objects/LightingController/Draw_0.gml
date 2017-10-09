gpu_set_blendmode_ext_sepalpha(bm_zero,bm_inv_src_color,bm_zero,bm_one);
	if surface_exists(light) draw_surface(light,camera_get_view_x(Camera.cam),camera_get_view_y(Camera.cam));
gpu_set_blendmode(bm_normal);
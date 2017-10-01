if shadowType == "basic" || shadowType == "dynamic"
{	
	/*
	shader_set(shd_blur);
		gpu_set_blendmode(bm_subtract);
			size = shader_get_uniform(shd_blur,"size");
			shader_set_uniform_f(size,512,512,16);
			draw_surface(light,0,0);
		gpu_set_blendmode(bm_normal);
	shader_reset();
	*/
	gpu_set_blendmode(bm_subtract);
		if surface_exists(light) draw_surface(light,camera_get_view_x(Camera.cam),camera_get_view_y(Camera.cam));
	gpu_set_blendmode(bm_normal);
}
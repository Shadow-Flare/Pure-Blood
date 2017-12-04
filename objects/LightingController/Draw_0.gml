	//draw lights
scr_emit_light_dynamic(dynamicLightReso,1,lightScale,radialBlurFactor);
scr_emit_light_basic(0.2,lightScale);

if variable_instance_exists(id,"light") && surface_exists(light) 
{	
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_inv_src_color,bm_zero,bm_one);

	if blurRadius > 0
	{
		shader_set(shd_blur);
		var shd_resolution = shader_get_uniform(shd_blur,"resolution");
		shader_set_uniform_f(shd_resolution,surface_get_width(light),surface_get_height(light));
		var shd_radius = shader_get_uniform(shd_blur,"radius");
		shader_set_uniform_f(shd_radius,blurRadius);
	}
	
	draw_surface_ext(light,camera_get_view_x(Camera.cam)-1,camera_get_view_y(Camera.cam)-1,1/lightScale,1/lightScale,0,c_white,1);

	if blurRadius > 0
	{
		shader_reset();
	}

	gpu_set_blendmode(bm_normal);
}
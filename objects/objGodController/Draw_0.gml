if !global.paused
{
	//Blood: draw
	if global.FXBlood
	{
		if surface_exists(bloodyTiles) draw_surface(bloodyTiles,0,0);
	}
	else
	{
		layer_set_visible(layer_get_id("Tiles_foreground_a"),1);
		layer_set_visible(layer_get_id("Tiles_foreground_b"),1);
		layer_set_visible(layer_get_id("Tiles_foreground_c"),1);
	}
	//Fog: draw
	if global.FXFog
	{
		for (var i = 0; i < array_length_1d(fogSurfaces); i++)
		{
			if surface_exists(fogSurfaces[i]) draw_surface_ext(fogSurfaces[i],0,0,1,1,0,c_white,0.15)
		}
	}
	//foreground parallax
	if instance_exists(obj_camera) && layer_exists(layer_get_id("Tiles_parallax_b"))
	{
		var shift = obj_camera.xPos*paraBSpd;
		draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles_parallax_b")),obj_camera.xPos-shift,0);
		layer_set_visible(layer_get_id("Tiles_parallax_b"),0);
	}
	//ligting; draw shadow minus lights
	if global.FXLighting && instance_exists(obj_camera)
	{
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
				if surface_exists(light) draw_surface(light,camera_get_view_x(obj_camera.cam),camera_get_view_y(obj_camera.cam));
			gpu_set_blendmode(bm_normal);
		}
	}
}
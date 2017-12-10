	//draw lights
scr_emit_light_dynamic(dynamicLightReso,1,lightScale,radialBlurFactor);
scr_emit_light_basic(1,lightScale);

if variable_instance_exists(id,"light") && surface_exists(light) 
{	
	var camX = camera_get_view_x(Camera.cam)-1;
	var camY = camera_get_view_y(Camera.cam)-1;
	var camW = camera_get_view_width(Camera.cam);
	var camH = camera_get_view_height(Camera.cam)
	var appW = surface_get_width(application_surface);
	var appH = surface_get_height(application_surface);
	var Hscale = appW/camW;
	var Vscale = appH/camH;
	
	if !variable_instance_exists(id,"temp") || !surface_exists(temp)
	{
		temp = surface_create(surface_get_width(light),surface_get_height(light));
	}
	if !variable_instance_exists(id,"temp2") || !surface_exists(temp2)
	{
		temp2 = surface_create(surface_get_width(light),surface_get_height(light));
	}
	if !variable_instance_exists(id,"temp3") || !surface_exists(temp3)
	{
		temp3 = surface_create(camW*lightScale,camH*lightScale);
	}
	if !variable_instance_exists(id,"cutoutTiles") || !surface_exists(cutoutTiles)
	{
		cutoutTiles = surface_create(room_width,room_height);
	}
	if !variable_instance_exists(id,"cutout") || !surface_exists(cutout)
	{
		cutout = surface_create(room_width*lightScale,room_height*lightScale);
	}
	
	surface_set_target(temp);
		draw_clear_alpha(c_white,0);
		shader_set(shd_gaussian_horizontal);
			var shd_radius = shader_get_uniform(shd_gaussian_horizontal,"blur_amount");
			shader_set_uniform_f(shd_radius,blurRadius);
			var shd_resolution = shader_get_uniform(shd_gaussian_horizontal,"resolution");
			shader_set_uniform_f(shd_resolution,surface_get_width(temp),surface_get_height(temp));
			draw_surface(light,0,0);
		shader_reset();
	surface_reset_target();
	
	surface_set_target(temp2);
	shader_set(shd_gaussian_vertical);
		var shd_radius = shader_get_uniform(shd_gaussian_vertical,"blur_amount");
		shader_set_uniform_f(shd_radius,blurRadius);
		var shd_resolution = shader_get_uniform(shd_gaussian_vertical,"resolution");
		shader_set_uniform_f(shd_resolution,surface_get_width(temp),surface_get_height(temp));
		draw_surface(temp,0,0);
	shader_reset();
	surface_reset_target();
		
	surface_set_target(cutoutTiles);
		draw_clear_alpha(c_black,0);
			tileMapA = layer_tilemap_get_id(layer_get_id("Tiles_background_a"));
			tileMapB = layer_tilemap_get_id(layer_get_id("Tiles_background_b"));
			tileMapC = layer_tilemap_get_id(layer_get_id("Tiles_background_c"));
			tileMapD = layer_tilemap_get_id(layer_get_id("Tiles_background_d"));
			tileMapOcc = layer_tilemap_get_id(layer_get_id("Tiles_occlusion"));
			draw_tilemap(tileMapA,0,0);
			draw_tilemap(tileMapB,0,0);
			draw_tilemap(tileMapC,0,0);
			draw_tilemap(tileMapD,0,0);
			draw_tilemap(tileMapOcc,0,0);
	surface_reset_target();
	
	surface_set_target(cutout);
		var ambientColInv = make_color_rgb(255-color_get_red(ambienceColour),255-color_get_green(ambienceColour),255-color_get_blue(ambienceColour))
		draw_clear(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255));
		gpu_set_blendmode(bm_subtract);
		shader_set(shd_black);
			draw_surface_ext(cutoutTiles,0,0,lightScale,lightScale,0,c_white,1);
			with objActorParent draw_sprite_ext(sprite_index,image_index,x*other.lightScale,y*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,c_white,image_alpha);
		shader_reset();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	surface_set_target(temp3);
		draw_clear_alpha(c_white,0);
		draw_surface_ext(temp2,(camera_get_view_x(Camera.cam)-1)*lightScale,(camera_get_view_y(Camera.cam)-1*lightScale),1,1,0,c_white,1);
		draw_surface_ext(cutout,0,0,1,1,0,c_white,1);
		with obj_light_parent
		{
			var alpha = 0.4
			col = make_color_rgb(colour_get_red(colour)*alpha,colour_get_green(colour)*alpha,colour_get_blue(colour)*alpha)
			///// DRAW SURFACE \\\\\
			var xCam = camera_get_view_x(Camera.cam);
			var yCam = camera_get_view_y(Camera.cam);

			gpu_set_blendmode(bm_subtract)
				var LSH = lightSize/2;
				draw_ellipse_colour((x-LSH)*other.lightScale,(y-LSH)*other.lightScale,(x+LSH)*other.lightScale,(y+LSH)*other.lightScale,col,c_black,0);
			gpu_set_blendmode(bm_normal);
		}
	surface_reset_target();
		
		////NORMALS\\\\
	var lightList = ds_list_create();
	var num = 0;
	with obj_light_parent if enabled
	{
		lightList[| num  ] = (x/room_width)*255;
		lightList[| num+1] = (y/room_height)*255;
		lightList[| num+2] = simDepth;
		num+=3;
	}
	if !variable_instance_exists(id,"lightTextureBuffer") || !surface_exists(lightTextureBuffer)
	{
		lightTextureBuffer = surface_create(normMaxLights,1);
	}
	if !variable_instance_exists(id,"normalMap") || !surface_exists(normalMap)
	{
		normalMap = surface_create(camW,camH);
	}
	if !variable_instance_exists(id,"specularMap") || !surface_exists(specularMap)
	{
		specularMap = surface_create(camW,camH);
	}
	if !variable_instance_exists(id,"temp4") || !surface_exists(temp4)
	{
		temp4 = surface_create(camW*lightScale,camH*lightScale);
	}
	surface_set_target(lightTextureBuffer);
		draw_clear(c_black);
		var dsSize = ds_list_size(lightList);
		draw_set_alpha(1);
		for (var i = 0; i < dsSize/3; i++)
		{
		    draw_point_color(i,0,make_colour_rgb(lightList[| 3*i],lightList[| 3*i+1],lightList[| 3*i+2]))
		}
	surface_reset_target();
	
	//tileMapA = layer_tilemap_get_id(layer_get_id("Tiles_background_a"));
	tileMapB = layer_tilemap_get_id(layer_get_id("Tiles_background_b"));
	tileMapC = layer_tilemap_get_id(layer_get_id("Tiles_background_c"));
	tileMapD = layer_tilemap_get_id(layer_get_id("Tiles_background_d"));
	tileMapOcc = layer_tilemap_get_id(layer_get_id("Tiles_occlusion"));
	surface_set_target(normalMap);
		draw_clear_alpha(c_black,0);
		//tilemap_tileset(tileMapA,til_forestNormal);
		tilemap_tileset(tileMapB,til_forestNormal);
		tilemap_tileset(tileMapC,til_forestNormal);
		tilemap_tileset(tileMapD,til_forestNormal);
		tilemap_tileset(tileMapOcc,til_forestNormal);
		//draw_tilemap(tileMapA,0,0);
		draw_tilemap(tileMapB,0,0);
		draw_tilemap(tileMapC,0,0);
		draw_tilemap(tileMapD,0,0);
		draw_tilemap(tileMapOcc,0,0);
	surface_reset_target();
	surface_set_target(specularMap);
		//tilemap_tileset(tileMapA,til_forestSpecular);
		tilemap_tileset(tileMapB,til_forestSpecular);
		tilemap_tileset(tileMapC,til_forestSpecular);
		tilemap_tileset(tileMapD,til_forestSpecular);
		tilemap_tileset(tileMapOcc,til_forestSpecular);
		//draw_tilemap(tileMapA,0,0);
		draw_tilemap(tileMapB,0,0);
		draw_tilemap(tileMapC,0,0);
		draw_tilemap(tileMapD,0,0);
		draw_tilemap(tileMapOcc,0,0);
	surface_reset_target();
	
	//tilemap_tileset(tileMapA,til_forest);
	tilemap_tileset(tileMapB,til_forest);
	tilemap_tileset(tileMapC,til_forest);
	tilemap_tileset(tileMapD,til_forest);
	tilemap_tileset(tileMapOcc,til_forest);
	
	surface_set_target(temp4);
		shader_set(shd_normals);
		var shd_light = shader_get_sampler_index(shd_normals,"light");
		var shd_norm = shader_get_sampler_index(shd_normals,"norm");
		var shd_spec = shader_get_sampler_index(shd_normals,"spec");
		var shd_num = shader_get_uniform(shd_normals,"lightNum");
		texture_set_stage(shd_light,surface_get_texture(lightTextureBuffer));
		texture_set_stage(shd_norm,surface_get_texture(normalMap));
		texture_set_stage(shd_spec,surface_get_texture(specularMap));
		shader_set_uniform_f(shd_num,dsSize/3);
			draw_surface(temp3,0,0);
		shader_reset();
	surface_reset_target();
		
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_inv_src_color,bm_zero,bm_one);
		draw_surface_ext(temp4,0,0,1/lightScale,1/lightScale,0,c_white,1);
	gpu_set_blendmode(bm_normal);
}
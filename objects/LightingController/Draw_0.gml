#region intial variable grabs
var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam)
var appW = surface_get_width(application_surface);
var appH = surface_get_height(application_surface);
var Hscale = appW/camW;
var Vscale = appH/camH;
var shaftCache = RoomCache.rmSunData[? room];
var shaftColour = shaftCache[| 0];
var shaftAngle = shaftCache[| 1];
var shaftBlur = shaftCache[| 2];
if shaftAngle != undefined
{
	if shaftAngle != clamp(shaftAngle,0,360) shaftAngle = undefined;
	shaftAngle = degtorad(shaftAngle);
}
frameNum++;
#endregion

#region Shadow based lighting
	#region Draw Dynamic lights
	if !variable_instance_exists(id,"light") || !surface_exists(light)
	{
		light = surface_create((camW+2)*lightScale,(camH+2)*lightScale);
	}
	if !variable_instance_exists(id,"light2") || !surface_exists(light2)
	{
		light2 = surface_create(surface_get_width(light),surface_get_height(light));
	}
	scr_emit_light_dynamic(dynamicLightReso,1,lightScale,radialBlurFactor);
	#endregion
	#region Shaft based lighting
if shaftAngle != undefined
{
	#region initialize
		if !variable_instance_exists(id,"shaftScan") || !surface_exists(shaftScan)
		{
			shaftScan = surface_create(shaftLightReso,1);
		}
		if !variable_instance_exists(id,"shaft") || !surface_exists(shaft)
		{
			shaft = surface_create(surface_get_width(light),surface_get_height(light));
		}
		if shaftAngle <= pi/2			var pixelToStart = [1,1,0]; //[x,y,yFirst?]
		else if shaftAngle <= pi		var pixelToStart = [1,0,1];
		else if shaftAngle <= pi*(3/2)	var pixelToStart = [0,0,0];
		else							var pixelToStart = [0,1,1];
	#endregion
	#region set tilemaps to draw on shaft occlusionMap.
	var layerNamesBack = ["Tiles_background_a","Tiles_background_b","Tiles_background_c","Tiles_background_d","Tiles_background_e"];
	var layerNamesFore = ["Tiles_foreground_a","Tiles_foreground_b","Tiles_foreground_c","Tiles_foreground_d","Tiles_foreground_e"];
	var tileLayersBack = [];
	var tileLayersFore = [];
	var count = 0;
	for (var i = 0; i < array_length_1d(layerNamesBack); i++)
	{
		var layerIDToCheck = layer_get_id(layerNamesBack[i]);
		if layerIDToCheck != -1
		{
			tileLayersBack[count] = layerIDToCheck;
			count++;
		}
	}
	count = 0;
	for (var i = 0; i < array_length_1d(layerNamesFore); i++)
	{
		var layerIDToCheck = layer_get_id(layerNamesFore[i]);
		if layerIDToCheck != -1
		{
			tileLayersFore[count] = layerIDToCheck;
			count++;
		}
	}
	#endregion
	#region build occlusion map
		#region Generate tiles texture BACK (only once per load/texture deletion)
		if !variable_instance_exists(id,"shaftBackTiles") || !surface_exists(shaftBackTiles)
		{
			shaftBackTiles = surface_create(room_width,room_height);
			surface_set_target(shaftBackTiles);
				draw_clear_alpha(c_black,0);
				for (var i = 0; i < array_length_1d(layerNamesBack); i++)
				{
					var tilemapID = layer_tilemap_get_id(layerNamesBack[i])
					draw_tilemap(tilemapID,0,0);
				}
			surface_reset_target();
		}
		#endregion
		#region Generate tiles texture FORE (only once per load/texture deletion)
		if !variable_instance_exists(id,"shaftForeTiles") || !surface_exists(shaftForeTiles)
		{
			shaftForeTiles = surface_create(room_width,room_height);
			surface_set_target(shaftForeTiles);
				draw_clear_alpha(c_black,0);
				for (var i = 0; i < array_length_1d(layerNamesFore); i++)
				{
					var tilemapID = layer_tilemap_get_id(layerNamesFore[i])
					draw_tilemap(tilemapID,0,0);
				}
			surface_reset_target();
		}
		#endregion
		#region compile occlusion layers
		if !variable_instance_exists(id,"shaftOcclusionMap") || !surface_exists(shaftOcclusionMap)
		{
			shaftOcclusionMap = surface_create(camW*lightScale,camH*lightScale);
		}
		if !variable_instance_exists(id,"shaftOcclusionMapRot") || !surface_exists(shaftOcclusionMapRot)
		{
			var maxSize = sqrt(sqr(camW*lightScale)+sqr(camH*lightScale))
			shaftOcclusionMapRot = surface_create(maxSize,maxSize);
		}
		surface_set_target(shaftOcclusionMap);
			draw_clear(c_black);
			draw_set_colour(c_white);
			shader_set(shd_white);
				draw_surface_ext(shaftBackTiles,-(camX)*lightScale,-(camY)*lightScale,lightScale,lightScale,0,make_color_rgb(128,128,128),1);
				draw_surface_ext(shaftForeTiles,-(camX)*lightScale,-(camY)*lightScale,lightScale,lightScale,0,c_white,1);
			shader_reset();
		surface_reset_target();
		surface_set_target(shaftOcclusionMapRot);
			draw_clear(c_gray);
			var finalAngle = degtorad(180)-arctan(surface_get_height(shaftOcclusionMap)/surface_get_width(shaftOcclusionMap))-shaftAngle;
			var surfX = surface_get_width(shaftOcclusionMapRot)/2+(surface_get_width(shaftOcclusionMapRot)/2)*cos(finalAngle);
			var surfY = surface_get_height(shaftOcclusionMapRot)/2-(surface_get_width(shaftOcclusionMapRot)/2)*sin(finalAngle);
			draw_surface_ext(shaftOcclusionMap,surfX,surfY,1,1,-radtodeg(shaftAngle),c_white,1);
		surface_reset_target();
		#endregion
	#endregion
	#region draw scan
		surface_set_target(shaftScan);
			draw_clear_alpha(c_black,0);
			shader_set(shd_lightShaftScan);
				//var shd_size = shader_get_uniform(shd_lightShaftScan,"size");
				var shd_stepNum = shader_get_uniform(shd_lightShaftScan,"stepNum");
				//var shd_angle = shader_get_uniform(shd_lightShaftScan,"angle");
				//var shd_reso = shader_get_uniform(shd_lightShaftScan,"reso");
				//var shd_cornerStart = shader_get_uniform(shd_lightShaftScan,"cornerStart");
				//shader_set_uniform_i(shd_size,shaftLightReso);
				shader_set_uniform_i(shd_stepNum,shaftLightStepReso);
				//shader_set_uniform_f(shd_angle,shaftAngle);
				//shader_set_uniform_f(shd_reso,surface_get_width(shaftOcclusionMapRot),surface_get_height(shaftOcclusionMapRot));
				//shader_set_uniform_f(shd_cornerStart,pixelToStart[0],pixelToStart[1],pixelToStart[2]);
				draw_surface_ext(shaftOcclusionMapRot,0,0,shaftLightStepReso/surface_get_width(shaftOcclusionMapRot),shaftLightStepReso/surface_get_width(shaftOcclusionMapRot),0,c_white,1);
			shader_reset();
		surface_reset_target();
	#endregion
	#region draw shaft Lighting
		surface_set_target(shaft);
			draw_clear_alpha(c_white,0);
			shader_set(shd_lightShaftDraw);
				//var shd_size = shader_get_uniform(shd_lightShaftDraw,"size");
				//var shd_stepNum = shader_get_uniform(shd_lightShaftDraw,"stepNum");
				var shd_angle = shader_get_uniform(shd_lightShaftDraw,"angle");
				var shd_blurFactor = shader_get_uniform(shd_lightShaftDraw,"blurFactor");
				var shd_reso = shader_get_uniform(shd_lightShaftDraw,"reso");
				//var shd_cornerStart = shader_get_uniform(shd_lightShaftDraw,"cornerStart");
				//shader_set_uniform_i(shd_size,shaftLightReso);
				//shader_set_uniform_i(shd_stepNum,shaftLightStepReso);
				shader_set_uniform_f(shd_angle,cos(shaftAngle),sin(shaftAngle));
				shader_set_uniform_f(shd_blurFactor,shaftRadialBlurFactor);
				shader_set_uniform_f(shd_reso,surface_get_width(light),surface_get_height(light));
				//shader_set_uniform_f(shd_cornerStart,pixelToStart[0],pixelToStart[1]);
				draw_surface_ext(shaftScan,0,0,surface_get_width(light)/shaftLightReso,surface_get_height(light),0,shaftColour,1);
				//draw_surface_ext(shaftScan,0,0,surface_get_width(light)/shaftLightReso,surface_get_height(light),0,shaftColour,1);
			shader_reset();
		surface_reset_target();
	#endregion
	#region draw onto light surface
		surface_set_target(light);
			draw_surface(shaft,0,0);
		surface_reset_target();
	#endregion
	#region DEBUG
		if !variable_instance_exists(id,"debug") || !surface_exists(debug)
		{
			var maxSize = sqrt(sqr(camW*lightScale)+sqr(camH*lightScale))
			debug = surface_create(maxSize,maxSize);
		}
		surface_set_target(debug);
			shader_set(shd_lightShaftUnscan);
				draw_clear_alpha(c_white,0);
				var maxSize = sqrt(sqr(camW*lightScale)+sqr(camH*lightScale))
				var shd_angle = shader_get_uniform(shd_lightShaftUnscan,"angle");
				var shd_blurFactor = shader_get_uniform(shd_lightShaftUnscan,"blurFactor");
				var shd_reso = shader_get_uniform(shd_lightShaftUnscan,"reso");
				shader_set_uniform_f(shd_angle,cos(shaftAngle),sin(shaftAngle));
				shader_set_uniform_f(shd_blurFactor,shaftRadialBlurFactor);
				shader_set_uniform_f(shd_reso,surface_get_width(light),surface_get_height(light));
				//draw_surface_ext(shaftScan,0,0,1,1,0,c_white,1);
				draw_surface_stretched(shaftScan,0,0,maxSize,maxSize);
			shader_reset();
		surface_reset_target();
		if !variable_instance_exists(id,"debug2") || !surface_exists(debug2)
		{
			var maxSize = sqrt(sqr(camW*lightScale)+sqr(camH*lightScale))
			debug2 = surface_create(maxSize,maxSize);
		}
		surface_set_target(debug2);
			draw_surface_ext(shaftOcclusionMapRot,0,0,1,1,0,c_white,1);
			draw_surface_ext(debug,0,0,1,1,0,c_white,0.5);
		surface_reset_target();
	#endregion
}
#endregion

	#region Apply Gausian filters to light (horiz./Vert.)
	if !variable_instance_exists(id,"temp") || !surface_exists(temp)
	{
		temp = surface_create(surface_get_width(light),surface_get_height(light));
	}
	if !variable_instance_exists(id,"temp2") || !surface_exists(temp2)
	{
		temp2 = surface_create(surface_get_width(light),surface_get_height(light));
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
	#endregion
	
	#region set tilemaps to draw on cutout
	var layerNames = ["Tiles_background_a","Tiles_background_b","Tiles_background_c","Tiles_background_d","Tiles_background_e",
					  "Tiles_foreground_a","Tiles_foreground_b","Tiles_foreground_c","Tiles_foreground_d","Tiles_foreground_e"];
	var tileLayers = [];
	var count = 0;
	for (var i = 0; i < array_length_1d(layerNames); i++)
	{
		var layerIDToCheck = layer_get_id(layerNames[i]);
		if layerIDToCheck != -1
		{
			tileLayers[count] = layerIDToCheck;
			count++;
		}
	}
	#endregion
	
	#region Generate cutout tiles texture (only once per load/texture deletion)
	if !variable_instance_exists(id,"cutoutTiles") || !surface_exists(cutoutTiles)
	{
		cutoutTiles = surface_create(room_width,room_height);
		surface_set_target(cutoutTiles);
			draw_clear_alpha(c_black,0);
			for (var i = 0; i < array_length_1d(tileLayers); i++)
			{
				var tilemapID = layer_tilemap_get_id(tileLayers[i])
				draw_tilemap(tilemapID,0,0);
			}
		surface_reset_target();
	}
	#endregion
	#region Add cutout tiles and instance based cutters to cutout (every frame)
	if !variable_instance_exists(id,"cutout") || !surface_exists(cutout)
	{
		cutout = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(cutout);
		draw_clear(c_black);
		gpu_set_blendmode(bm_subtract);
		shader_set(shd_white);
			draw_surface_ext(cutoutTiles,-(camX-1)*lightScale,-(camY-1)*lightScale,lightScale,lightScale,0,c_white,1);
			with objActorParent draw_sprite_ext(sprite_index,image_index,(x+1-camX)*other.lightScale,(y+1-camY)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,c_black,image_alpha);
			with objPlatformMovingParent draw_sprite_ext(sprite_index,image_index,(x+1-camX)*other.lightScale,(y+1-camY)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,c_black,image_alpha);
		shader_reset();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	#endregion
	
	#region draw lights then apply cutout, also add basic lighting flairs (?)
	if !variable_instance_exists(id,"temp3") || !surface_exists(temp3)
	{
		temp3 = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(temp3);
		draw_clear_alpha(c_white,0);
		draw_surface_ext(temp2,0,0,1,1,0,c_white,1);
		draw_surface_ext(cutout,0,0,1,1,0,c_white,1);
		with obj_light_parent
		{
			var alpha = 0.4
			col = make_color_rgb(colour_get_red(colour)*alpha,colour_get_green(colour)*alpha,colour_get_blue(colour)*alpha)
			///// DRAW SURFACE \\\\\
			gpu_set_blendmode(bm_max)
				var LSH = lightSize/2;
				draw_ellipse_colour((x-LSH-camX)*other.lightScale,(y-LSH-camY)*other.lightScale,(x+LSH-camX)*other.lightScale,(y+LSH-camY)*other.lightScale,col,c_black,0);
			gpu_set_blendmode(bm_normal);
		}
	surface_reset_target();
	#endregion
#endregion

#region Normal Mapping System
if normalMappingEnabled
{
	#region set tilemaps to draw on normal/specular maps.
	var layerNames = ["Tiles_background_a","Tiles_background_b","Tiles_background_c","Tiles_background_d","Tiles_background_e",
					  "Tiles_foreground_a","Tiles_foreground_b","Tiles_foreground_c","Tiles_foreground_d","Tiles_foreground_e"];
	var tileLayers = [];
	var count = 0;
	for (var i = 0; i < array_length_1d(layerNames); i++)
	{
		var layerIDToCheck = layer_get_id(layerNames[i]);
		if layerIDToCheck != -1
		{
			tileLayers[count] = layerIDToCheck;
			count++;
		}
	}
	#endregion
	#region Construct Light data Texture buffer (every frame)
	if !variable_instance_exists(id,"lightTextureBuffer") || !surface_exists(lightTextureBuffer)
	{
		lightTextureBuffer = surface_create(normMaxLights,1);
	}
	surface_set_target(lightTextureBuffer);
		draw_clear_alpha(c_black,0);
		var lightCount = 0;
		gpu_set_blendmode_ext(bm_one,bm_zero);
		with obj_light_parent if enabled
		{
			draw_set_alpha((lightSize/other.normMaxLightRadius)*other.lightScale);
			draw_point_color(lightCount,0,make_colour_rgb((x/room_width)*255,(y/room_height)*255,simDepth*255));
			lightCount++;
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	surface_reset_target();
	#endregion
	
	#region draw normal/specular maps for tiles. Every frame relative to cam.
	if (!variable_instance_exists(id,"normalMap") || !surface_exists(normalMap))
	{
		normalMap = surface_create(room_width,room_height);
		surface_set_target(normalMap);
		draw_clear(make_color_rgb(128,128,255));
		for (var i = 0; i < array_length_1d(tileLayers); i++)
		{
			var tilemapID = layer_tilemap_get_id(tileLayers[i])
			var tileW = tilemap_get_tile_width(tilemapID);
			var tileH = tilemap_get_tile_width(tilemapID);
			var tilesetID = tilemap_get_tileset(tilemapID);
			var tilesetNormalID = tilesetID+1;
			tilemap_tileset(tilemapID,tilesetNormalID);
			for(var j = 0; j < tilemap_get_width(tilemapID); j++)
			{
				for (var k = 0; k < tilemap_get_height(tilemapID); k++)
				{
				    var tile = tilemap_get(tilemapID,j,k);
						//base
					var rStat = [false, false];		//R/G , reg/inv (false = R/Reg, true = G/Inv) 
					var gStat = [true, false];
						//hor flip
					if tile_get_mirror(tile) rStat = [rStat[0],!rStat[1]];
						//vert flip
					if tile_get_flip(tile) gStat = [gStat[0],!gStat[1]];
						//rotate
					if tile_get_rotate(tile)
					{
						rStat = [!rStat[0],!rStat[1]];
						gStat = [!gStat[0], gStat[1]];
					}
						//draw
					shader_set(shd_normalTileDraw);
					var shd_rStat = shader_get_uniform(shd_normalTileDraw,"rStat");
					var shd_gStat = shader_get_uniform(shd_normalTileDraw,"gStat");
					shader_set_uniform_i(shd_rStat,rStat[0],rStat[1]);
					shader_set_uniform_i(shd_gStat,gStat[0],gStat[1]);
						draw_tile(tilesetNormalID,tile,tilemap_get_frame(tilemapID),tileW*j,tileH*k);
					shader_reset();
				}
			}
			tilemap_tileset(tilemapID,tilesetID);
		}
		surface_reset_target();
		
	}
	if (!variable_instance_exists(id,"normalMapCamera") || !surface_exists(normalMapCamera))
	{
		normalMapCamera = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(normalMapCamera);
		draw_surface_ext(normalMap,-(camX-1)*lightScale,-(camY-1)*lightScale,lightScale,lightScale,0,c_white,1);
		with objActorParent
		{
			shader_set(shd_white);
				draw_sprite_ext(sprite_index,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,255),image_alpha);
				if variable_instance_exists(id,"weaponSpriteIndex") && weaponSpriteIndex != noone
				{
					draw_sprite_ext(weaponSpriteIndex,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,255),image_alpha);
				}
			shader_reset();
		}
		with objBlockParent if visible
		{
			draw_sprite_ext(sprite_index,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,255),image_alpha);
		}
	surface_reset_target();
	
	if (!variable_instance_exists(id,"specularMap") || !surface_exists(specularMap))
	{
		specularMap = surface_create(room_width,room_height);
		surface_set_target(specularMap);
		draw_clear_alpha(c_black,1);
		for (var i = 0; i < array_length_1d(tileLayers); i++)
		{
			var tilemapID = layer_tilemap_get_id(tileLayers[i])
			var tilesetID = tilemap_get_tileset(tilemapID);
			var tilesetSpecularID = tilesetID+2;
			tilemap_tileset(tilemapID,tilesetSpecularID);
				var n = i*(255/array_length_1d(tileLayers));
				var blend = make_color_rgb(n,n,n)
				draw_set_colour(blend);
				draw_tilemap(tilemapID,0,0);
				draw_set_colour(c_white);
			tilemap_tileset(tilemapID,tilesetID);
		}
		surface_reset_target();
	}
		if (!variable_instance_exists(id,"specularMapCamera") || !surface_exists(specularMapCamera))
	{
		specularMapCamera = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(specularMapCamera);
		draw_surface_ext(specularMap,-(camX-1)*lightScale,-(camY-1)*lightScale,lightScale,lightScale,0,c_white,1);
		with objActorParent
		{
			shader_set(shd_white);
				draw_sprite_ext(sprite_index,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,128),image_alpha);
				if variable_instance_exists(id,"weaponSpriteIndex") && weaponSpriteIndex != noone
				{
					draw_sprite_ext(weaponSpriteIndex,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,128),image_alpha);
				}
			shader_reset();
		}
		with objBlockParent if visible
		{
			draw_sprite_ext(sprite_index,image_index,(x-camX+1)*other.lightScale,(y-camY+1)*other.lightScale,image_xscale*other.lightScale,image_yscale*other.lightScale,image_angle,make_color_rgb(128,128,128),image_alpha);
		}
	surface_reset_target();
	#endregion
	
	#region draw modified lighting using normal and specular maps
	if !variable_instance_exists(id,"temp4") || !surface_exists(temp4)
	{
		temp4 = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(temp4);
		shader_set(shd_normals);
		var shd_light = shader_get_sampler_index(shd_normals,"light");
		var shd_norm = shader_get_sampler_index(shd_normals,"norm");
		var shd_spec = shader_get_sampler_index(shd_normals,"spec");
		var shd_num = shader_get_uniform(shd_normals,"lightNum");
		var shd_numMax = shader_get_uniform(shd_normals,"lightNumMax");
		var shd_radiusMax = shader_get_uniform(shd_normals,"lightMaxRadius");
		var shd_depth = shader_get_uniform(shd_normals,"depthScale");
		var shd_reso = shader_get_uniform(shd_normals,"reso");
		var shd_camX = shader_get_uniform(shd_normals,"camX");
		var shd_camY = shader_get_uniform(shd_normals,"camY");
		var shd_camW = shader_get_uniform(shd_normals,"camW");
		var shd_camH = shader_get_uniform(shd_normals,"camH");
		var shd_roomW = shader_get_uniform(shd_normals,"roomW");
		var shd_roomH = shader_get_uniform(shd_normals,"roomH");
		var shd_frameNum = shader_get_uniform(shd_normals,"frameNum");
		var shd_shaftLighting = shader_get_uniform(shd_normals,"shaftLighting");
		var shd_angle = shader_get_uniform(shd_normals,"shaftAngle");
		texture_set_stage(shd_light,surface_get_texture(lightTextureBuffer));
		texture_set_stage(shd_norm,surface_get_texture(normalMapCamera));
		texture_set_stage(shd_spec,surface_get_texture(specularMapCamera));
		shader_set_uniform_i(shd_num,round(lightCount));
		shader_set_uniform_i(shd_numMax,normMaxLights);
		shader_set_uniform_i(shd_radiusMax,normMaxLightRadius);
		shader_set_uniform_i(shd_depth,normDepthScale);
		shader_set_uniform_f(shd_reso,surface_get_width(temp4),surface_get_height(temp4));
		shader_set_uniform_i(shd_camX,camX);
		shader_set_uniform_i(shd_camY,camY);
		shader_set_uniform_i(shd_camW,camW);
		shader_set_uniform_i(shd_camH,camH);
		shader_set_uniform_i(shd_roomW,room_width);
		shader_set_uniform_i(shd_roomH,room_height);
		shader_set_uniform_i(shd_frameNum,frameNum%360);
		shader_set_uniform_i(shd_shaftLighting,shaftAngle != undefined);
		if shaftAngle != undefined shader_set_uniform_f(shd_angle,cos(shaftAngle),sin(shaftAngle));
			draw_surface(temp3,0,0);
		shader_reset();
	surface_reset_target();
	#endregion
}
#endregion

#region inversion and darkness application
	if !variable_instance_exists(id,"temp5") || !surface_exists(temp5)
	{
		temp5 = surface_create(surface_get_width(light),surface_get_height(light));
	}
	surface_set_target(temp5);
		var ambientColInv = make_color_rgb(255-color_get_red(ambienceColour),255-color_get_green(ambienceColour),255-color_get_blue(ambienceColour));
		draw_clear(merge_color(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255),ambientColInv,ambienceBlendStr));
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_inv_src_color,bm_zero,bm_one);
			if normalMappingEnabled draw_surface(temp4,0,0);
			else draw_surface(temp3,0,0);
		gpu_set_blendmode(bm_normal);
		var col = merge_color(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255),ambientColInv,ambienceCutoutStr);
		shader_set(shd_white);
			draw_surface_ext(cutout,0,0,1,1,0,col,1);
		shader_reset();
	surface_reset_target();
#endregion

#region draw lighting subtractively (color only) to scale on room ???
//surface_set_target(application_surface);
gpu_set_blendmode_ext_sepalpha(bm_zero,bm_inv_src_color,bm_zero,bm_one);
	draw_surface_ext(temp5,camX-((camX%1)-round(camX%1))*(clamp(6-lightScale,0,5)/5)-1,camY-((camY%1)+round(camY%1))*(clamp(6-lightScale,0,5)/5)-1,1/lightScale,1/lightScale,0,c_white,1);
gpu_set_blendmode(bm_normal);
//surface_reset_target();
#endregion
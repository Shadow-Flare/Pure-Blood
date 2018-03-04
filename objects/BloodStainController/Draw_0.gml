if (!surface_exists(blood)) blood = surface_create(room_width,room_height);
if (!surface_exists(temp)) temp = surface_create(room_width,room_height);

//set layers for inverse-cutout
	var layerNames = ["Tiles_foreground_a","Tiles_foreground_b","Tiles_foreground_c","Tiles_foreground_d","Tiles_foreground_e"];
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

	//cutout surface
surface_set_target(temp);
	draw_clear(c_black);
	gpu_set_blendmode(bm_subtract);
		for (var i = 0; i < array_length_1d(tileLayers); i++)
		{
			var tilemapID = layer_tilemap_get_id(tileLayers[i])
			draw_tilemap(tilemapID,0,0);
		}
	gpu_set_blendmode(bm_normal);
	var tilemapID = layer_tilemap_get_id("Tiles_foreground_top");
	shader_set(shd_white);
		draw_set_colour(c_black);
		draw_tilemap(tilemapID,0,0);
	shader_reset();
surface_reset_target();
	//compose bloody tiles
surface_set_target(blood);
		//cut out
	gpu_set_blendmode(bm_subtract);
		draw_surface(temp,0,0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(blood,0,0);
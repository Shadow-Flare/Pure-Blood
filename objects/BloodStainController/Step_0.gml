//audio
if lastBloodSound != noone
{
	if !audio_is_playing(lastBloodSound) lastBloodSound = noone;
}

//Blood: compute
if (!surface_exists(tiles))
{
	tiles = surface_create(room_width,room_height);
	
	surface_set_target(tiles);
	
	var tileMapA = layer_tilemap_get_id(layer_get_id("tiles_foreground_a"));
	var tileMapB = layer_tilemap_get_id(layer_get_id("tiles_foreground_b"));
	var tileMapC = layer_tilemap_get_id(layer_get_id("tiles_foreground_c"));
	var tileMapD = layer_tilemap_get_id(layer_get_id("tiles_foreground_d"));
	var tileMapTop = layer_tilemap_get_id(layer_get_id("tiles_foreground_top"));
	draw_tilemap(tileMapA,0,0);
	draw_tilemap(tileMapB,0,0);
	draw_tilemap(tileMapC,0,0);
	draw_tilemap(tileMapD,0,0);
	draw_tilemap(tileMapTop,0,0);
	
	surface_reset_target();
	
	layer_set_visible(layer_get_id("Tiles_foreground_a"),0);
	layer_set_visible(layer_get_id("Tiles_foreground_b"),0);
	layer_set_visible(layer_get_id("Tiles_foreground_c"),0);
	layer_set_visible(layer_get_id("Tiles_foreground_d"),0);
	layer_set_visible(layer_get_id("Tiles_foreground_top"),0);
}

if (!surface_exists(blood)) blood = surface_create(room_width,room_height);
if (!surface_exists(bloodyTiles)) bloodyTiles = surface_create(room_width,room_height);
if (!surface_exists(temp)) temp = surface_create(room_width,room_height);

	//hole surface
surface_set_target(temp);
	draw_set_colour(c_black);
	draw_rectangle(0,0,room_width,room_height,0);
	gpu_set_blendmode(bm_subtract);
	draw_surface(tiles,0,0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();
	//compose bloody tiles
surface_set_target(bloodyTiles);
	draw_surface(tiles,0,0);
	draw_surface(blood,0,0);
		//cutt out
	gpu_set_blendmode(bm_subtract);
	draw_surface(temp,0,0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();
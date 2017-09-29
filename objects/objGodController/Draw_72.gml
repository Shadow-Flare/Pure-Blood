//background && parallax
if instance_exists(obj_camera)
{
	var xScale = room_height/sprite_get_height(bck_forest)*1.2;
	var yScale = xScale;
	var shift = obj_camera.xPos*backgroundSpeed/sprite_get_number(bck_forest);
	for(var i = 0; i < sprite_get_number(bck_forest); i++)
	{
		draw_sprite_tiled_ext(bck_forest,i,obj_camera.xPos-shift*i,0,xScale,yScale,c_white,1);
	}
}

if instance_exists(obj_camera) && layer_exists(layer_get_id("Tiles_parallax_a"))
{
	var shift = obj_camera.xPos*paraASpd;
	draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles_parallax_a")),obj_camera.xPos-shift,0)
	layer_set_visible(layer_get_id("Tiles_parallax_a"),0);
}
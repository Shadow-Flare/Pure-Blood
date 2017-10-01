//foreground parallax
if instance_exists(Camera) && layer_exists(layer_get_id("Tiles_parallax_b"))
{
	var shift = Camera.xPos*paraBSpd;
	draw_tilemap(layer_tilemap_get_id(layer_get_id("Tiles_parallax_b")),Camera.xPos-shift,0);
	layer_set_visible(layer_get_id("Tiles_parallax_b"),0);
}
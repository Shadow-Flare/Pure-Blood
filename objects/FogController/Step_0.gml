var cam = Camera.cam;
var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);

var pixelsPerPixel = 12;			//how many pixels in surface = pixels in sprite
var PixelsPerTile = 16;			//number of sprite pixels per Tile

//fog: compute
for (var i = 0; i < array_length_1d(fogSpriteNumbers); i++)
{
	var num = fogSpriteNumbers[i]*round(surface_get_width(application_surface)/1000);
	if !surface_exists(fogSurfaces[i]) fogSurfaces[i] = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	if !ds_exists(fogSpriteData,ds_type_list) fogSpriteData = ds_list_create();
	if ds_list_find_value(fogSpriteData,i) == undefined
	{
		var g = ds_grid_create(num,4)
		ds_list_set(fogSpriteData,i,g)
		for (var j = 0; j < num; j++)
		{
			ds_grid_set(g,j,0,irandom(sprite_get_number(spr_fog)-1));						//sprite ID
			ds_grid_set(g,j,1,irandom(room_width));											//x initi
			var variance = PixelsPerTile*1;
			ds_grid_set(g,j,2,round((room_height+irandom_range((-variance/2),(variance/2)) + PixelsPerTile*(i*2-1.5))/2)*2);		//y initi
			var spdDir = irandom(1); if spdDir == 0 spdDir = -1;
			ds_grid_set(g,j,3,random_range(0.05,0.10)*spdDir*(1-0.2*i));										//xSpd initi
		}
	}
	surface_set_target(fogSurfaces[i]);
		draw_clear_alpha(c_white,0)
		for (var j = 0; j < num; j++)
		{
			var g = ds_list_find_value(fogSpriteData,i)
			if g != undefined && ds_exists(g,ds_type_grid)
			{
				var S = ds_grid_get(g,j,0);
				var Y = ds_grid_get(g,j,2);
				var Spd = ds_grid_get(g,j,3);
				var X = ds_grid_get(g,j,1) + Spd;
				if X < -sprite_get_width(spr_fog)*pixelsPerPixel*2
				{
					X = surface_get_width(application_surface)+sprite_get_width(spr_fog)*pixelsPerPixel*2;
				}
				else if X > surface_get_width(application_surface)+sprite_get_width(spr_fog)*pixelsPerPixel*2
				{
					X = -sprite_get_width(spr_fog)*pixelsPerPixel*2;
				}
				ds_grid_set(g,j,1,X);
				draw_sprite_ext(spr_fog,S,(X-camX)*6,(Y-camY)*6,6*3,6*3,0,make_color_rgb(192,192,192),1)
			}
		}
	surface_reset_target();
}
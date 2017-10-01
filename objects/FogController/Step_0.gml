//fog: compute
for (var i = 0; i < array_length_1d(fogSpriteNumbers); i++)
{
	var num = fogSpriteNumbers[i]*round(room_width/1000);
	if !surface_exists(fogSurfaces[i]) fogSurfaces[i] = surface_create(room_width,room_height);
	if !ds_exists(fogSpriteData,ds_type_list) fogSpriteData = ds_list_create();
	if ds_list_find_value(fogSpriteData,i) == undefined
	{
		var g = ds_grid_create(num,4)
		ds_list_set(fogSpriteData,i,g)
		for (var j = 0; j < num; j++)
		{
			ds_grid_set(g,j,0,irandom(sprite_get_number(spr_fog)-1));						//sprite ID
			ds_grid_set(g,j,1,irandom(room_width/16)*16);									//x initi
			ds_grid_set(g,j,2,irandom_range((room_height-125+150*i)/16,(room_height+100+150*i)/16)*16);		//y initi
			ds_grid_set(g,j,3,random_range(0.5,1)*sign(random_range(-1000,1000)));										//xSpd initi
		}
	}
	surface_set_target(fogSurfaces[i]);
		gpu_set_blendmode(bm_subtract);
			draw_set_colour(c_white);
			draw_rectangle(0,0,surface_get_width(fogSurfaces[i]),surface_get_height(fogSurfaces[i]),0)
		gpu_set_blendmode(bm_normal);
		for (var j = 0; j < num; j++)
		{
			var g = ds_list_find_value(fogSpriteData,i)
			if g != undefined && ds_exists(g,ds_type_grid)
			{
				var S = ds_grid_get(g,j,0);
				var Y = ds_grid_get(g,j,2);
				var Spd = ds_grid_get(g,j,3);
				var X = ds_grid_get(g,j,1) + Spd;
				if X <= -sprite_get_width(spr_fog)*8 || X >= room_width+sprite_get_width(spr_fog)*8
				{
					ds_grid_set(ds_list_find_value(fogSpriteData,i),j,3,ds_grid_get(ds_list_find_value(fogSpriteData,i),j,3)*-1);
				}
				ds_grid_set(ds_list_find_value(fogSpriteData,i),j,1,X);
				draw_sprite_ext(spr_fog,S,X,Y,32,32,0,make_color_rgb(192,192,192),1)
			}
		}
	surface_reset_target();
}
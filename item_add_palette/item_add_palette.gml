///@arg sprite
///@arg [optional default false] animate
var spr = argument[0];
var animate = false;
if (argument_count > 1) {
	animate = argument[1];	
}

wepData[? weaponStats.palette] = ds_list_create();
if (!animate) {
	var list = wepData[? weaponStats.palette];
	var ind = ds_list_size(global.palettes);
	ds_list_add(list, ind);
	ds_list_add(list, spr);
	ds_list_add(list, "no subimages");
	var temp_surf = surface_create(sprite_get_width(list[| 0]), sprite_get_height(list[| 1]));
	surface_set_target(temp_surf);
	draw_sprite(list[| 0], 0, 0, 0);
	surface_reset_target();
	for (var i = 0; i < sprite_get_height(list[| 0]); i++) {
		ds_list_add(list, surface_getpixel_ext(temp_surf, 0, i));
	}
	ds_list_add(list, false);
	
} else {
	var list = wepData[? weaponStats.palette];
	var ind = ds_list_size(global.palettes);
	ds_list_add(list, ind);
	ds_list_add(list, spr);
	var temp_surf = surface_create(sprite_get_width(spr), sprite_get_height(spr));
	for (var _i = 0; _i < sprite_get_number(spr); _i++) {
		ds_list_add(list, "subimage"+string(_i));
		surface_set_target(temp_surf);
		draw_clear_alpha(c_white, 0);
		draw_sprite(spr, _i, 0, 0);
		surface_reset_target();
		for (var i = 0; i < sprite_get_height(list[| 0]); i++) {
			ds_list_add(list, surface_getpixel_ext(temp_surf, 0, i));
		}
		
	}
	ds_list_add(list, true);
}
surface_free(temp_surf);
wepData[? weaponStats.palette] = list;
ds_list_add(global.palettes, list);
if !surface_exists(firePixBackSurf) firePixBackSurf = surface_create(room_width,room_height);
surface_set_target(firePixBackSurf);
	draw_clear_alpha(c_black,0);
	part_system_drawit(pSysFire2);
surface_reset_target();
if !surface_exists(firePixSurf) firePixSurf = surface_create(room_width,room_height);
surface_set_target(firePixSurf);
	draw_clear_alpha(c_black,0);
	part_system_drawit(pSysFire);
surface_reset_target();

if !surface_exists(icePixSurf) icePixSurf = surface_create(room_width,room_height);
surface_set_target(icePixSurf);
	draw_clear_alpha(c_black,0);
	part_system_drawit(pSysIce);
surface_reset_target();

if !surface_exists(lightningPixSurf) lightningPixSurf = surface_create(room_width,room_height);
surface_set_target(lightningPixSurf);
	draw_clear_alpha(c_black,0);
	part_system_drawit(pSysLightning);
surface_reset_target();
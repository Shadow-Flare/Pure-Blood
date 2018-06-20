if !surface_exists(particleSurfFinal) particleSurfFinal = surface_create(room_width,room_height);

surface_set_target(particleSurfFinal);
	draw_clear_alpha(c_black,0);
	if surface_exists(firePixBackSurf) draw_surface(firePixBackSurf,0,0);
	if surface_exists(firePixSurf) draw_surface(firePixSurf,0,0);
	if surface_exists(icePixSurf) draw_surface(icePixSurf,0,0);
	if surface_exists(lightningPixSurf) draw_surface(lightningPixSurf,0,0);
	if surface_exists(arcanePixSurf) draw_surface(arcanePixSurf,0,0);
	if surface_exists(lightPixSurf) draw_surface(lightPixSurf,0,0);
		
	shader_set(shd_invert);
		if surface_exists(darkPixSurf) draw_surface(darkPixSurf,0,0);
	shader_reset();
	
	if surface_exists(weaponSummonPixSurf) draw_surface(weaponSummonPixSurf,0,0);
	
surface_reset_target();

draw_surface(particleSurfFinal,0,0);

//simulation
	//surf1
if !surface_exists(particleSurfSim) particleSurfSim = surface_create(room_width,room_height);
surface_set_target(particleSurfSim);
	draw_clear_alpha(c_black,0);
		if forceInvert
		{
			if surface_exists(overidePixSurf) draw_surface(overidePixSurf,0,0);
		}
		else
		{
			shader_set(shd_invert);

				if surface_exists(overidePixSurf) draw_surface(overidePixSurf,0,0);
			shader_reset();
		}
surface_reset_target();
	//surf2
if !surface_exists(overidePixSurf) overidePixSurf = surface_create(room_width,room_height);
surface_set_target(overidePixSurf);
	draw_clear_alpha(c_black,0);
	part_system_drawit(pSysOveride2);
surface_reset_target();

surface_set_target(particleSurfSim);
		if forceInvert
		{
			if surface_exists(overidePixSurf) draw_surface(overidePixSurf,0,0);
		}
		else
		{
			shader_set(shd_invert);
				if surface_exists(overidePixSurf) draw_surface(overidePixSurf,0,0);
			shader_reset();
		}
surface_reset_target();
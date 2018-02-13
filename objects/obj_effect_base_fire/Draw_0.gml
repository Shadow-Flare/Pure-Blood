with ParticleController
{
	if !part_system_exists(pSysFire)
	{
		pSysFire = part_system_create();
		part_system_automatic_draw(pSysFire,false)
		pEmitter = part_emitter_create(pSysFire);
	}
		if !part_system_exists(pSysFire2)
	{
		pSysFire2 = part_system_create();
		part_system_automatic_draw(pSysFire2,false)
		pEmitter2 = part_emitter_create(pSysFire2);
	}
	
	if other.enabled
	{
		surface_set_target(firePixBackSurf);
			repeat(3) draw_sprite_ext(sprFireGlow,0,other.x,other.y,0.6,0.6,random(360),c_orange,1.0);
		surface_reset_target();
		part_emitter_region(pSysFire,pEmitter,other.xPrev+random_range(-4,4),other.x+random_range(-4,4),other.yPrev+random_range(-4,4),other.y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_emitter_region(pSysFire2,pEmitter2,other.xPrev+random_range(-4,4),other.x+random_range(-4,4),other.yPrev+random_range(-4,4)+4,other.y+random_range(-4,4)+4,ps_shape_line,ps_distr_linear);
		part_type_direction(other.pFire,85,95,0,2);
		part_type_direction(other.pGlow,85,95,0,2);
		part_type_direction(other.pEmber,55,125,0,20);
		part_emitter_burst(pSysFire2,pEmitter2,other.pGlow,-2);
		part_emitter_burst(pSysFire,pEmitter,other.pFire,2);
		part_emitter_burst(pSysFire,pEmitter,other.pEmber,-20);
	}
	else if other.timer == round(1*room_speed)
	{
		part_emitter_region(pSysFire,pEmitter,other.xPrev+random_range(-4,4),other.x+random_range(-4,4),other.yPrev+random_range(-4,4),other.y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_type_direction(other.pFire,0,360,0,2);
		part_type_direction(other.pGlow,0,360,0,0);
		part_type_direction(other.pEmber,0,360,0,0);
		part_emitter_burst(pSysFire2,pEmitter2,other.pGlow,12);
		part_emitter_burst(pSysFire,pEmitter,other.pFire,120);
		part_emitter_burst(pSysFire,pEmitter,other.pEmber,10);
	}
}
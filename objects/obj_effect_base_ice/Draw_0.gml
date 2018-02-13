with ParticleController
{
	if !part_system_exists(pSysIce)
	{
		pSysIce = part_system_create();
		part_system_automatic_draw(pSysIce,false)
		pEmitterIce = part_emitter_create(pSysIce);
	}
	part_emitter_region(pSysIce,pEmitterIce,other.xPrev+random_range(-2,2),other.x+random_range(-2,2),other.yPrev+random_range(-2,2),other.y+random_range(-2,2),ps_shape_line,ps_distr_linear);

	if other.enabled
	{
		part_type_size(other.pMist,0.2,0.4,0.01,0);
		part_emitter_burst(pSysIce,pEmitterIce,other.pMist,-2);
		part_emitter_burst(pSysIce,pEmitterIce,other.pIce,1);
	}
	else if other.timer == round(1*room_speed)
	{
		part_type_size(other.pMist,0.4,0.8,0.02,0);
		part_emitter_burst(pSysIce,pEmitterIce,other.pMist,4);
		part_emitter_burst(pSysIce,pEmitterIce,other.pIce,30);
	}
}
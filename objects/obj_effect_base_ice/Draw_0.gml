with ParticleController
{
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysIce)
	{
		pSysIce = part_system_create();
		part_system_automatic_draw(pSysIce,false)
		pEmitterIce = part_emitter_create(pSysIce);
	}

	if other.enabled
	{
		part_emitter_region(pSysIce,pEmitterIce,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_size(other.pIce,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pMist,0.2*intensity,0.4*intensity,0.01*intensity,0);
		part_type_speed(other.pIce,0.3*intensity,0.8*intensity,-0.001*intensity,0);
		part_emitter_burst(pSysIce,pEmitterIce,other.pMist,-2*min(1/intensity,999));
		part_emitter_burst(pSysIce,pEmitterIce,other.pIce,max(1*intensity,1));
	}
	if other.burst
	{
		other.burst = false;
		part_emitter_region(pSysIce,pEmitterIce,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_size(other.pIce,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pMist,0.2*intensity,0.4*intensity,0.01*intensity,0);
		part_type_speed(other.pIce,0.3*intensity,0.8*intensity,-0.001*intensity,0);
		part_emitter_burst(pSysIce,pEmitterIce,other.pMist,6*intensity);
		part_emitter_burst(pSysIce,pEmitterIce,other.pIce,80*intensity);
	}
}
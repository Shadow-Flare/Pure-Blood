with ParticleController
{
	var pSysTarget = pSysIce;
	if other.simOveride var pSysTarget = pSysOveride;
	
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysTarget)
	{
		if !other.simOveride 
		{
			pSysIce = part_system_create();
			part_system_automatic_draw(pSysIce,false)
			pEmitterIce = part_emitter_create(pSysIce);
			var pSysTarget = pSysIce;
		}
		else
		{
			pSysOveride = part_system_create();
			part_system_automatic_draw(pSysOveride,false)
			pEmitterIce = part_emitter_create(pSysOveride);
			var pSysTarget = pSysOveride;
		}
	}

	if other.effectEnabled
	{
		part_emitter_region(pSysTarget,pEmitterIce,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_size(other.pIce,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pMist,0.2*intensity,0.4*intensity,0.01*intensity,0);
		part_type_speed(other.pIce,0.3*intensity,0.8*intensity,-0.001*intensity,0);
		part_emitter_burst(pSysTarget,pEmitterIce,other.pMist,-2*min(1/intensity,999));
		part_emitter_burst(pSysTarget,pEmitterIce,other.pIce,max(1*intensity,1));
	}
	if other.effectBurst
	{
		other.effectBurst = false;
		part_emitter_region(pSysTarget,pEmitterIce,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_size(other.pIce,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pMist,0.2*intensity,0.4*intensity,0.01*intensity,0);
		part_type_speed(other.pIce,0.3*intensity,0.8*intensity,-0.001*intensity,0);
		part_emitter_burst(pSysTarget,pEmitterIce,other.pMist,6*intensity);
		part_emitter_burst(pSysTarget,pEmitterIce,other.pIce,80*intensity);
	}
}
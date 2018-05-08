with ParticleController
{
	var pSysTarget = pSysLight;
	if other.simOveride var pSysTarget = pSysOveride;
	
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysTarget)
	{
		if !other.simOveride 
		{
			pSysLight = part_system_create();
			part_system_automatic_draw(pSysLight,false)
			pEmitterLight = part_emitter_create(pSysLight);
			var pSysTarget = pSysLight;
		}
		else
		{
			pSysOveride = part_system_create();
			part_system_automatic_draw(pSysOveride,false)
			pEmitterLight = part_emitter_create(pSysOveride);
			var pSysTarget = pSysOveride;
		}
	}
	
	if other.effectEnabled
	{
		part_emitter_region(pSysTarget,pEmitterLight,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.2,0.6,0,0);
		part_emitter_burst(pSysTarget,pEmitterLight,other.pAura,max(2*intensity,1));
	}
	if other.effectBurst
	{
		other.effectBurst = false;
		part_emitter_region(pSysTarget,pEmitterLight,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.6,1.2,0,0);
		part_emitter_burst(pSysTarget,pEmitterLight,other.pAura,max(36*intensity,0));
	}
}
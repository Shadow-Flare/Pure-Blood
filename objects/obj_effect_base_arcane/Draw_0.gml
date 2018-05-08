with ParticleController
{
	var pSysTarget = pSysArcane;
	if other.simOveride var pSysTarget = pSysOveride;
	
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysTarget)
	{
		if !other.simOveride 
		{
			pSysArcane = part_system_create();
			part_system_automatic_draw(pSysArcane,false)
			pEmitterArcane = part_emitter_create(pSysArcane);
			var pSysTarget = pSysArcane;
		}
		else
		{
			pSysOveride = part_system_create();
			part_system_automatic_draw(pSysOveride,false)
			pEmitterArcane = part_emitter_create(pSysOveride);
			var pSysTarget = pSysOveride;
		}
	}
	
	if other.effectEnabled
	{
		part_emitter_region(pSysTarget,pEmitterArcane,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.2,0.6,0,0);
		part_emitter_burst(pSysTarget,pEmitterArcane,other.pAura,max(2*intensity,1));
	}
	if other.effectBurst
	{
		other.effectBurst = false;
		part_emitter_region(pSysTarget,pEmitterArcane,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.6,1.2,0,0);
		part_emitter_burst(pSysTarget,pEmitterArcane,other.pAura,max(36*intensity,0));
	}
}
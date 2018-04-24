with ParticleController
{
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysLight)
	{
		pSysLight = part_system_create();
		part_system_automatic_draw(pSysLight,false)
		pEmitter = part_emitter_create(pSysLight);
	}
	
	if other.effectEnabled
	{
		part_emitter_region(pSysLight,pEmitter,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.2,0.6,0,0);
		part_emitter_burst(pSysLight,pEmitter,other.pAura,max(2*intensity,1));
	}
	if other.effectBurst
	{
		other.effectBurst = false;
		part_emitter_region(pSysLight,pEmitter,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_speed(other.pAura,0.6,1.2,0,0);
		part_emitter_burst(pSysLight,pEmitter,other.pAura,max(36*intensity,0));
	}
}
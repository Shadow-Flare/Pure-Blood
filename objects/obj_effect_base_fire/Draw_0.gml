with ParticleController
{
		//initial
	var pSysTarget = pSysFire;
	if other.simOveride var pSysTarget = pSysOveride2;
	var pSysTarget2 = pSysFire2;
	if other.simOveride var pSysTarget2 = pSysOveride;
	
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysTarget)
	{
		if !other.simOveride 
		{
			pSysFire = part_system_create();
			part_system_automatic_draw(pSysFire,false)
			pEmitterFire = part_emitter_create(pSysFire);
			var pSysTarget = pSysFire;
		}
		else
		{
			pSysOveride = part_system_create();
			part_system_automatic_draw(pSysOveride,false)
			pEmitterFire = part_emitter_create(pSysOveride);
			var pSysTarget = pSysOveride;
		}
	}
	if !part_system_exists(pSysTarget2)
	{
		if !other.simOveride 
		{
			pSysFire2 = part_system_create();
			part_system_automatic_draw(pSysFire2,false)
			pEmitterFire2 = part_emitter_create(pSysFire2);
			var pSysTarget2 = pSysFire2;
		}
		else
		{
			pSysOveride2 = part_system_create();
			part_system_automatic_draw(pSysOveride2,false)
			pEmitterFire2 = part_emitter_create(pSysOveride2);
			var pSysTarget2 = pSysOveride2;
		}
	}
	
	if other.effectEnabled
	{
		surface_set_target(firePixBackSurf);
			repeat(3) draw_sprite_ext(sprFireGlow,0,other.x,other.y,0.6*intensity,0.6*intensity,random(360),c_orange,1.0);
		surface_reset_target();
		part_emitter_region(pSysTarget,pEmitterFire,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_emitter_region(pSysTarget2,pEmitterFire2,other.xPrev+random_range(-radius,radius),other.x+random_range(-radius,radius),other.yPrev+random_range(0,radius*2),other.y+random_range(0,radius*2),ps_shape_line,ps_distr_linear);
		part_type_direction(other.pFire,85,95,0,2);
		part_type_direction(other.pGlow,85,95,0,2);
		part_type_direction(other.pEmber,55,125,0,20);
		part_type_size(other.pFire,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pGlow,0.6*intensity,0.8*intensity,0,0);
		part_type_size(other.pEmber,1.2*intensity,1.5*intensity,-0.001*intensity,0);
		part_type_speed(other.pFire,1*intensity,2*intensity,-0.1*intensity,0);
		part_type_speed(other.pGlow,1.2*intensity,2.4*intensity,-0.1*intensity,0);
		part_type_speed(other.pEmber,1*intensity,1.5*intensity,0.02*intensity,0);
		part_emitter_burst(pSysTarget2,pEmitterFire2,other.pGlow,-2*min(1/intensity,999));
		part_emitter_burst(pSysTarget,pEmitterFire,other.pFire,max(2*intensity,1));
		part_emitter_burst(pSysTarget,pEmitterFire,other.pEmber,-20*min(1/intensity,999));
	}
	if other.effectBurst
	{
		other.effectBurst = false;
		part_emitter_region(pSysTarget,pEmitterFire,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_emitter_region(pSysTarget2,pEmitterFire2,other.x+random_range(-radius,radius),other.x+random_range(-radius,radius),other.y+random_range(-radius,radius),other.y+random_range(-radius,radius),ps_shape_line,ps_distr_linear);
		part_type_direction(other.pFire,0,360,0,2);
		part_type_direction(other.pGlow,0,360,0,2);
		part_type_direction(other.pEmber,0,360,0,20);
		part_type_size(other.pFire,1*intensity,1.5*intensity,-0.025*intensity,0);
		part_type_size(other.pGlow,0.6*intensity,0.8*intensity,0,0);
		part_type_size(other.pEmber,1.2*intensity,1.5*intensity,-0.001*intensity,0);
		part_type_speed(other.pFire,1*intensity,2*intensity,-0.1*intensity,0);
		part_type_speed(other.pGlow,1.2*intensity,2.4*intensity,-0.1*intensity,0);
		part_type_speed(other.pEmber,1*intensity,1.5*intensity,0.02*intensity,0);
		part_emitter_burst(pSysTarget2,pEmitterFire2,other.pGlow,max(16*intensity,0));
		part_emitter_burst(pSysTarget,pEmitterFire,other.pFire,max(36*intensity,0));
		part_emitter_burst(pSysTarget,pEmitterFire,other.pEmber,max(8*intensity,0));
	}
}
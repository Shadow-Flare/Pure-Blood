with ParticleController
{
	if !part_system_exists(pSysLightning)
	{
		pSysLightning = part_system_create();
		part_system_automatic_draw(pSysLightning,false)
		pEmitterLightning = part_emitter_create(pSysLightning);
	}
	part_emitter_region(pSysLightning,pEmitterLightning,other.xPrev,other.x,other.yPrev,other.y,ps_shape_line,ps_distr_linear);

	if other.enabled
	{
		part_type_direction(other.pSpark,0,360,0,0);
		part_emitter_burst(pSysLightning,pEmitterLightning,other.pSpark,-16);
		part_emitter_burst(pSysLightning,pEmitterLightning,other.pLum,1);
		other.sparkTimer++;
		if other.sparkTimer >= other.sparkDuration*room_speed
		{
			var dir = random(360);
			part_type_direction(other.pSpark,dir-25,dir+25,0,0);
			part_emitter_burst(pSysLightning,pEmitterLightning,other.pSpark,6);
			other.sparkTimer = 0;
			other.sparkDuration = random_range(other.sparkDurationMin,other.sparkDurationMax);
		}
	}
	else if other.timer == round(1*room_speed)
	{
		part_emitter_burst(pSysLightning,pEmitterLightning,other.pLum,10);
		part_emitter_burst(pSysLightning,pEmitterLightning,other.pSpark,18);
		other.trailForce = true;
		other.trailTimer = 0;
	}
}

var trailVarMod = 0;
var trailAlphaMod = 0;
var trailEnable = enabled;
if trailForce = true
{
	var trailVarMod = (trailTimer/60)*32
	var trailAlphaMod = (trailTimer/60)*0.8
	trailEnable = true;
	trailTimer++;
	if trailTimer >= trailDuration*room_speed
	{
		trailTimer = 0;
		trailForce = false;
	}
}
	
surface_set_target(ParticleController.lightningPixSurf);	
	scr_draw_trail(trailEnable,2,0.25,30,c_orange,2,16+trailVarMod,1-trailAlphaMod,2);
surface_reset_target();
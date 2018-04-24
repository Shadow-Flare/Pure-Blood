var trailVarMod = 0;
var trailAlphaMod = 0;
//if variable_instance_exists(id,"hitOn") 
var trailEnable = hitOn;
//else var trailEnable = true;

var fadeFactor = clamp((timer/60),0,1)			//[0:1]

	//sparks	
with ParticleController
{
	var radius = other.radius;
	var intensity = other.intensity;
	if !part_system_exists(pSysLightning)
	{
		pSysLightning = part_system_create();
		part_system_automatic_draw(pSysLightning,false)
		pEmitterLightning = part_emitter_create(pSysLightning);
	}

	part_emitter_region(pSysLightning,pEmitterLightning,other.x-16,other.x+16,other.groundY-16,other.groundY+16,ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(pSysLightning,pEmitterLightning,other.pSpark,32*intensity*(1-fadeFactor*3));
}

	//trails
surface_set_target(ParticleController.lightningPixSurf);
	var xPrev = x;
	var yPrev = y;
	var height = bbox_bottom-bbox_top;
	
	var stepBaseSize = 6*(1+fadeFactor*(height/4/6));
	
	var maxStep = round(height/stepBaseSize)
	var step = 0;
	var stepDist = height/maxStep;
	
	if trailBoltDown
	{
		var topIniti = bbox_top;
		y = bbox_top;
	}
	else
	{
		var botIniti = bbox_bottom;
		y = bbox_bottom;
		stepDist *= -1;
	}
	while step <= maxStep
	{
		scr_draw_trail(trailEnable,1,0.2,10,c_orange,3-fadeFactor*1,intensity*16-fadeFactor*12,1-fadeFactor,2-fadeFactor,1);
		y += stepDist;
		step++;
	}
	
	x = xPrev;
	y = yPrev;
	trailBoltDown = !trailBoltDown;
surface_reset_target();
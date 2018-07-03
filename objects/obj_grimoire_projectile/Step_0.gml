#region State machine

switch phase
{
	case projectilePhase.normal:			#region Normal State
		effectEnabled = true;
		hitOn = false;
		image_xscale = normalScale;
		image_yscale = normalScale;
		var ang = point_direction(0,0,xSpd,-ySpd);
		hitAngle = ang;
		
		if place_meeting(x+xSpd,y+ySpd,objActorParent) 
			with objActorParent with other if place_meeting(x+xSpd,y+ySpd,other) && is_enemy(casterType,other.actorType)
		{
			while !place_meeting(x+dcos(ang),y+dsin(ang),other) {x+=dcos(ang); y+=dsin(ang);}
			xSpd = 0;
			ySpd = 0;
			phase = projectilePhase.exploding;
			phaseTimer = 0;
			effectBurst = true;
		}
		if !place_free(x+xSpd,y+ySpd)
		{
			while place_free(x+dcos(ang),y+dsin(ang)) {x+=dcos(ang); y+=dsin(ang);}
			xSpd = 0;
			ySpd = 0;
			phase = projectilePhase.exploding;
			phaseTimer = 0;
			effectBurst = true;
		}
		
		if normalDuration != -1 && phaseTimer >= round(normalDuration*room_speed)
		{
			xSpd = 0;
			ySpd = 0;
			phase = projectilePhase.exploding;
			phaseTimer = 0;
		}
		
		if normalStepScript != noone script_execute(normalStepScript);
		
		x += xSpd;
		y += ySpd;
		break;
		#endregion
	case projectilePhase.exploding:			#region Exploding State
		effectEnabled = false;
		hitOn = true;
		image_xscale = explodeScale;
		image_yscale = explodeScale;
		
		if phaseTimer == 0 && explodeStartScript != noone script_execute(explodeStartScript);
		
		if explodeDuration != -1 && phaseTimer >= round(explodeDuration*room_speed)
		{
			if explodeEndScript != noone script_execute(explodeEndScript);
			instance_destroy();
		}
		break;
		#endregion
}

#endregion
#region Bound effect

if !initialized
{
	initialized = true;
	if boundEffect != noone
	{
		effect = instance_create_depth(x,y,10000,obj_effect_persistent_follow);
		with effect 
		{
			boundEffect = other.boundEffect;
			effectEnabled = true;
			target = other.id;
			radius = 4;
			intensity = 1;
		}
	}
}
else if effect != noone with effect
{
	effectEnabled = other.effectEnabled;
	if other.effectBurst
	{
		other.effectBurst = false;
		effectBurst = true;
	}
}

#endregion
#region Roundup

if (x >= room_width + 64 || x <= -64 || y >= room_height || y <= -64) instance_destroy();
phaseTimer++;

#endregion
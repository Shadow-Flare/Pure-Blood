switch vPhase
	{
		case vState.grounded:
			var block = instance_place(x,y+1,obj_block_parent)
			if canChangeVState && (block == noone || place_meeting(x,y,block)) vPhase = vState.midAir;
			break;
		case vState.midAir:
			var block = instance_place(x,y+1,obj_block_parent)
			if canChangeVState && (block != noone && !place_meeting(x,y,block)) vPhase = vState.grounded;
			else ySpd += GameManager.grav;
			if ySpd > maxFallSpeed ySpd = maxFallSpeed;
			break;
		case vState.jumping:
			ySpd += GameManager.grav;
			if ySpd > maxFallSpeed ySpd = maxFallSpeed;
			if ySpd >= 0 vPhase = vState.midAir;
			break;
	}
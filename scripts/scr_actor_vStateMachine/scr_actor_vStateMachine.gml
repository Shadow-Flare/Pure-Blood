lastVState = vPhase;
switch vPhase
{
	case vState.grounded:
			//transition
		var isGrounded = false;
		var block = noone;
		var lowestYSpd = noone;
		with objBlockParent
		{
			if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
			{
				if !(object_is_ancestor(object_index,objPlatformParent) && other.dropThroughPlatforms)
				{
					isGrounded = true;
					if ySpdSim < lowestYSpd || lowestYSpd = noone
					{
						block = id;
						lowestYSpd = ySpdSim;
					}
				}
			}
		}
		with block
		{
			if object_is_ancestor(object_index,objPlatformParent)
			{
				other.onPlatform = true;
				other.envXSpd = xSpdSim;
				other.envYSpd = ySpdSim;
				other.ySpd = 0;
			}
			else
			{
				other.onPlatform = false;
				other.xSpd += other.envXSpd;
				other.envXSpd = 0;
				other.envYSpd = 0;
				other.ySpd = 0;
			}
			with other 
			{
				var sprHeightDif = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);
				if place_free(x,other.y-sprHeightDif-1) y = other.y-sprHeightDif-1;
			}
		}
		if !isGrounded
		{
			vPhase = vState.midAir;
			onPlatform = false
			envXSpd -= envXSpd/16;
			envYSpd -= envYSpd/16;
		}
			//no ySpd change
		break;
	case vState.midAir:
			//transition
		var isGrounded = false;
		var block = noone;
		var lowestYSpd = noone;
		with objBlockParent
		{
			if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
			{
				if !(object_is_ancestor(object_index,objPlatformParent) && other.dropThroughPlatforms)
				{
					isGrounded = true;
					other.vPhase = vState.grounded;
					if ySpdSim < lowestYSpd || lowestYSpd = noone
					{
						block = id;
						lowestYSpd = ySpdSim;
					}
				}
			}
		}
		with block
		{
			if object_is_ancestor(object_index,objPlatformParent)
			{
				other.onPlatform = true;
				other.envXSpd = xSpdSim;
				other.envYSpd = ySpdSim;
				other.ySpd = 0;
			}
			else
			{
				other.onPlatform = false;
				other.xSpd += other.envXSpd;
				other.envXSpd = 0;
				other.envYSpd = 0;
				other.ySpd = 0;
			}
			with other 
			{
				var sprHeightDif = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);
				if place_free(x,other.y-sprHeightDif-1) y = other.y-sprHeightDif-1;
			}
		}
			//ySpd
		if !isGrounded
		{
			ySpd += GameManager.grav;
			onPlatform = false
			envXSpd -= envXSpd/16;
			envYSpd -= envYSpd/16;	
		}
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
	case vState.jumping:
			//transition
		if ySpd >= 0 vPhase = vState.midAir;
			//ySpd
		ySpd += GameManager.grav;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		envXSpd -= envXSpd/32;
		envYSpd -= envYSpd/32;	
		break;
}
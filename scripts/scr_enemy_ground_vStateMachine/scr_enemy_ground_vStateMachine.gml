vPhasePrev = vPhase;
switch vPhase
{
	case vState.grounded:
			//transition
		var isGrounded = false;
		with obj_block_parent
		{
			if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
			{
				isGrounded = true;
				if object_is_ancestor(object_index,obj_platform_parent) other.onPlatform = true;
				else other.onPlatform = false;
				break;
			}
		}
		if !isGrounded
		{
			vPhase = vState.midAir;
			onPlatform = false
		}
			//no ySpd change
		break;
	case vState.midAir:
			//transition
		var isGrounded = false;
		if sign(ySpd) != -1
		{
			with obj_block_parent
			{
				if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
				{
					isGrounded = true;
					other.vPhase = vState.grounded;
					if object_is_ancestor(object_index,obj_platform_parent) other.onPlatform = true;
					else other.onPlatform = false;
					break;
				}
			}
		}
			//ySpd
		if !isGrounded ySpd += GameManager.grav;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
	case vState.jumping:
			//transition
		if ySpd >= 0 vPhase = vState.midAir;
			//ySpd
		ySpd += GameManager.grav;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
}
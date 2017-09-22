switch vPhase
{
	case vState.grounded:
		if moveH == 0 
		{
			subPhase = subState.idle;
		}
		else if !hardLockOn
		{
			if abs(moveH) <= 0.8
			{
				subPhase = subState.walking;
				facing = sign(moveH)
			}
			else subPhase = subState.running;
		}
		else
		{
			if sign(moveH) = lockOnDir
			{
				if abs(moveH) <= 0.8
				{
					subPhase = subState.walking;
					facing = sign(moveH)
				}
				else subPhase = subState.running;
			}
			else
			{
				subPhase = subState.walkingBackwards;
			}
		}
		break;
	case vState.midAir:
		subPhase = subState.airborne;
		break;
}
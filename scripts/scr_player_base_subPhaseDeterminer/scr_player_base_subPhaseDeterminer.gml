with objPlayer
{
	switch vPhase
	{
		case vState.grounded:
			if moveH == 0 
			{
				subPhase = subState.idle;
				subPhaseTimer = 0;
			}
			else
			{
				if sign(moveH) = facing
				{
					if abs(moveH) <= 0.8
					{
						subPhase = subState.walking;
						subPhaseTimer = 0;
					}
					else 
					{
						subPhase = subState.running;
						subPhaseTimer = 0;
					}
				}
				else
				{
					subPhase = subState.walkingBackwards;
					subPhaseTimer = 0;
				}
			}
			break;
		case vState.midAir:
		case vState.jumping:
			subPhase = subState.airborne;
			subPhaseTimer = 0;
			break;
	}
}
if abs(xSpd) > statCache.moveSpeed xSpd = sign(xSpd)*statCache.moveSpeed

switch vPhase
{
	case vState.grounded:
		if driveMove == 0 
		{
			subPhase = subState.idle;
			subPhaseTimer = 0;
		}
		else 
		{
			subPhase = subState.running;
			subPhaseTimer = 0;
		}
		break;
	case vState.midAir:
	case vState.jumping:
		subPhase = subState.airborne;
		subPhaseTimer = 0;
		break;
}
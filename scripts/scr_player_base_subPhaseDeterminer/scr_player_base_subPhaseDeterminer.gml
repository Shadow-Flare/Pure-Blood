var IE = instance_exists(inputManager)
if IE var moveH = inputManager.moveInputH;
else var moveH = 0;
if IE var moveV = inputManager.moveInputV;
else var moveV = 0;

switch vPhase
{
	case vState.grounded:
		if moveH == 0 
		{
			subPhase = subState.idle;
			subPhaseTimer = 0;
		}
		else if !hardLockOn
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
			if sign(moveH) = lockOnDir
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
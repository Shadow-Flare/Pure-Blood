//if abs(xSpd) > statCache.moveSpeed xSpd = sign(xSpd)*statCache.moveSpeed

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
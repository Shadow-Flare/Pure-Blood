//if abs(xSpd) > statCache.moveSpeed xSpd = sign(xSpd)*statCache.moveSpeed

if aggroPhase == enemyAggroState.passive
{
	subPhase = subState.idle;
	subPhaseTimer = 0;
}
else if aggroPhase == enemyAggroState.attacking
{
	subPhase = subState.running;
	subPhaseTimer = 0;
}
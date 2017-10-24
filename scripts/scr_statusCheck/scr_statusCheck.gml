//begin dying
if phase != state.dying && statCache.hp <= 0
{
	phased = 1;
	actorType = actorTypes.corpse;
	phase = state.dying;
	phaseTimer = 0;
	if subPhase != subState.flung subPhase = subState.none
	subPhaseTimer = 0;
}
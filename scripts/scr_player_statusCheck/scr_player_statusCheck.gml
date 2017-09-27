if hp <= 0 
{
	phase = state.dying;
	phaseTimer = 0;
	if subPhase != subState.flung subPhase = subState.none
	subPhaseTimer = 0;
}

//Fall
if place_meeting(x,y,obj_fall) && !instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 1;
}

//Room Change
if (place_meeting(x,y,obj_room_transition))&&(!global.spawning)&&!instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 0;
}
//initializer
if !hasInitialized
{
	if GameManager.currentCheckpointID == checkpointID
	{
		activeState = 1;
	}
	else activeState = 0;
	hasInitialized = true;
}

//state machine
switch activeState
{
	case 0:	//inactive
		if place_meeting(x,y,objPlayer)
		{
			activeState = 1;
			if checkpointID != noone GameManager.currentCheckpointID = checkpointID;
		}
		sprite_index = sprCheckpointInactive;
		break;
	case 1:	//activating
		timer++;
		if timer >= round(activationDuration*room_speed)
		{
			activeState = 2;
		}
		sprite_index = sprCheckpointActivating;
		image_speed = sprite_get_number(sprite_index)/(activationDuration);
		break;
	case 2:	//active
		sprite_index = sprCheckpointActive;
		break;
}
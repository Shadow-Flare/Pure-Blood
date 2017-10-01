//Up input change
if (InputManager.dUInput)
{
	dUInputTimer = 0;
}

if (dUInputTimer != -1)
{
	dUInputTimer++;
	if (!dUInputTimerInputHeld)
	{
		if player.phase != "offhand" && player.phase != "ability"
		{
			for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
			{
				if global.ownedOffhands[i] = global.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(global.ownedSubtypes,ownedID); i++)
			{
				if global.ownedSubtypes[ownedID,i] = global.activeOffhandSubtypeID
				{
					ownedSubtypeID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_1d(global.ownedActivatables); i++)
			{
				if global.ownedActivatables[ownedID,i] = global.activeOffhandActivatableID
				{
					activeOwnedID = i;
					break;
				}
			}
			ownedSubtypeID++;
			if ownedSubtypeID >= array_length_2d(global.ownedSubtypes,ownedID) ownedSubtypeID = 0;
			global.activeOffhandSubtypeID = global.ownedSubtypes[ownedID,ownedSubtypeID];
		}
		dUInputTimer = -1;
	}
	else if (dUInputTimer = floor(room_speed * 0.5))
	{
		if player.phase != "offhand" && player.phase != "ability" && player.phase != "hooked"
		{
			for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
			{
				if global.ownedOffhands[i] = global.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			ownedID++;
			if ownedID >= array_length_1d(global.ownedOffhands) ownedID = 0;
			global.activeOffhandID = global.ownedOffhands[ownedID];
			global.activeOffhandSubtypeID = global.ownedSubtypes[ownedID,0];
			global.activeOffhandActivatableID = global.ownedActivatables[ownedID,0];
		}
		dUInputTimer = -1;
	}
}


if (InputManager.dRInput)
{
	dRInputTimer = 0;
}
	
if dRInputTimer != -1
{
	dRInputTimer++;
	if (!dRInputTimerInputHeld)
	{
		if (player.phase != "ability" && player.phase != "hooked")
		{
			for (var i = 0; i < array_length_1d(global.ownedOffhands); i++)
			{
				ownedID = 0;
				if global.ownedOffhands[i] = global.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(global.ownedActivatables,ownedID); i++)
			{
				activeOwnedID = 0;
				if global.ownedActivatables[ownedID,i] = global.activeOffhandActivatableID
				{
					activeOwnedID = i;
					break;
				}
			}
			activeOwnedID++;
			if activeOwnedID >= array_length_2d(global.ownedActivatables,ownedID) activeOwnedID = 0;
			global.activeOffhandActivatableID = global.ownedActivatables[ownedID,activeOwnedID];
		}
		dRInputTimer = -1;
	}
	else if dRInputTimer = floor(room_speed * 1)
	{
		dRInputTimer = -1;
	}
}
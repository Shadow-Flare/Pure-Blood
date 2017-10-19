//Up input change
if (InputManager.dUInput)
{
	dUInputTimer = 0;
}

if (dUInputTimer != -1)
{
	dUInputTimer++;
	if (!InputManager.dUInputHeld)
	{
		if phase != state.offhand && phase != state.ability
		{
			for (var i = 0; i < array_length_1d(PlayerStats.ownedOffhands); i++)
			{
				if PlayerStats.ownedOffhands[i] = PlayerStats.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(PlayerStats.ownedSubtypes,ownedID); i++)
			{
				if PlayerStats.ownedSubtypes[ownedID,i] = PlayerStats.activeOffhandSubtypeID
				{
					ownedSubtypeID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_1d(PlayerStats.ownedActivatables); i++)
			{
				if PlayerStats.ownedActivatables[ownedID,i] = PlayerStats.activeOffhandActivatableID
				{
					activeOwnedID = i;
					break;
				}
			}
			ownedSubtypeID++;
			if ownedSubtypeID >= array_length_2d(PlayerStats.ownedSubtypes,ownedID) ownedSubtypeID = 0;
			PlayerStats.activeOffhandSubtypeID = PlayerStats.ownedSubtypes[ownedID,ownedSubtypeID];
		}
		dUInputTimer = -1;
	}
	else if (dUInputTimer = floor(room_speed * 0.5))
	{
		if phase != state.offhand && phase != state.ability //&& phase != state.hooked
		{
			for (var i = 0; i < array_length_1d(PlayerStats.ownedOffhands); i++)
			{
				if PlayerStats.ownedOffhands[i] = PlayerStats.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			ownedID++;
			if ownedID >= array_length_1d(PlayerStats.ownedOffhands) ownedID = 0;
			PlayerStats.activeOffhandID = PlayerStats.ownedOffhands[ownedID];
			PlayerStats.activeOffhandSubtypeID = PlayerStats.ownedSubtypes[ownedID,0];
			PlayerStats.activeOffhandActivatableID = PlayerStats.ownedActivatables[ownedID,0];
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
	if (!InputManager.dRInputHeld)
	{
		if phase != state.ability //&& phase != hooked
		{
			for (var i = 0; i < array_length_1d(PlayerStats.ownedOffhands); i++)
			{
				ownedID = 0;
				if PlayerStats.ownedOffhands[i] = PlayerStats.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(PlayerStats.ownedActivatables,ownedID); i++)
			{
				activeOwnedID = 0;
				if PlayerStats.ownedActivatables[ownedID,i] = PlayerStats.activeOffhandActivatableID
				{
					activeOwnedID = i;
					break;
				}
			}
			activeOwnedID++;
			if activeOwnedID >= array_length_2d(PlayerStats.ownedActivatables,ownedID) activeOwnedID = 0;
			PlayerStats.activeOffhandActivatableID = PlayerStats.ownedActivatables[ownedID,activeOwnedID];
		}
		dRInputTimer = -1;
	}
	else if dRInputTimer = floor(room_speed * 1)
	{
		dRInputTimer = -1;
	}
}
#region Up: change offhand equpment/subtype

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
					var ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(PlayerStats.ownedSubtypes,ownedID); i++)
			{
				if PlayerStats.ownedSubtypes[ownedID,i] = PlayerStats.activeOffhandSubtypeID
				{
					var ownedSubtypeID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_1d(PlayerStats.ownedActivatables); i++)
			{
				if PlayerStats.ownedActivatables[ownedID,i] = PlayerStats.activeOffhandActivatableID
				{
					var activeOwnedID = i;
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

#endregion
#region Left: change held weapon

	#region code without hold function (active)
if InputManager.dLInput
{
	for (var i = 0; i < array_length_1d(PlayerStats.heldWeapons); i++)
	{
		var ownedID = 0;
		if PlayerStats.heldWeapons[i] = PlayerStats.currentWeaponID
		{
			ownedID = i;
			break;
		}
	}
	ownedID++;
	if ownedID >= array_length_1d(PlayerStats.heldWeapons) ownedID = 0;
	PlayerStats.currentWeaponID = PlayerStats.heldWeapons[ownedID];
	equipmentChange = true;
}
	#endregion
	#region code with hold function (inactive)
//if (InputManager.dLInput)
//{
//	dLInputTimer = 0;
//}
	
//if dLInputTimer != -1
//{
//	dLInputTimer++;
//	if (!InputManager.dLInputHeld)
//	{
//		if phase != state.attacking //&& phase != hooked
//		{
//			for (var i = 0; i < array_length_1d(PlayerStats.heldWeapons); i++)
//			{
//				var ownedID = 0;
//				if PlayerStats.heldWeapons[i] = PlayerStats.currentWeaponID
//				{
//					ownedID = i;
//					break;
//				}
//			}
//			ownedID++;
//			if ownedID >= array_length_1d(PlayerStats.heldWeapons) ownedID = 0;
//			PlayerStats.currentWeaponID = PlayerStats.heldWeapons[ownedID];
//		}
//		dLInputTimer = -1;
//	}
//	else if dLInputTimer = floor(room_speed * 1)
//	{
//		dLInputTimer = -1;
//		//do hold things
//	}
//}
	#endregion

#endregion
#region Right: change active ability

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
				var ownedID = 0;
				if PlayerStats.ownedOffhands[i] = PlayerStats.activeOffhandID
				{
					ownedID = i;
					break;
				}
			}
			for (var i = 0; i < array_length_2d(PlayerStats.ownedActivatables,ownedID); i++)
			{
				var activeOwnedID = 0;
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

#endregion
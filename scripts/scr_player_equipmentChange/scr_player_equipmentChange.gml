//initials
var mainWeaponPrev = PlayerStats.currentWeaponID;

#region Up: change offhand equpment/subtype

//Up input change
if (InputManager.dUInput && !InputManager.ltInputHeld && canAct)
{
	dUInputTimer = 0;
}

if (dUInputTimer != -1)
{
	dUInputTimer++;
	if (!InputManager.dUInputHeld || !canAct)
	{
		if phase != state.offhand && phase != state.ability with PlayerStats
		{
			currentOffhandSubtypeIndex++
		}
		dUInputTimer = -1;
	}
	else if (dUInputTimer = floor(room_speed * 0.5))
	{
		if phase != state.offhand && phase != state.ability with PlayerStats
		{
			currentOffhandIndex++
		}
		dUInputTimer = -1;
	}
}

#endregion
#region Left: change held weapon

	#region code without hold function
if InputManager.dLInput && !InputManager.ltInputHeld && canAct with PlayerStats
{
	currentWeaponIndex++;
	if currentWeaponIndex > 1 currentWeaponIndex = 0;	//2 max weapons atm
	other.mainWeaponEquipmentChange = true;
}
	#endregion

#endregion
#region Right: change active ability

if (InputManager.dRInput && !InputManager.ltInputHeld && canAct)
{
	dRInputTimer = 0;
}
	
if dRInputTimer != -1
{
	dRInputTimer++;
	if (!InputManager.dRInputHeld || !canAct)
	{
		if phase != state.ability with PlayerStats
		{
			currentOffhandActivatableIndex++;
		}
		dRInputTimer = -1;
	}
	else if dRInputTimer = floor(room_speed * 0.5)
	{
		dRInputTimer = -1;
	}
}

#endregion

#region Cleanup
//main weapon
	var equip = [equipmentSlot.main1,equipmentSlot.main2];
	var prevEquipID = ItemCache.equipment[? equip[PlayerStats.currentWeaponIndex]]
	if ItemCache.equipment[? equip[PlayerStats.currentWeaponIndex]] == noone currentWeaponIndex = 0;
	PlayerStats.currentWeaponID = ItemCache.equipment[? equip[PlayerStats.currentWeaponIndex]];
	if prevEquipID != ItemCache.equipment[? equip[PlayerStats.currentWeaponIndex]] mainWeaponEquipmentChange = true;
	
//offhand weapon
	if PlayerStats.currentOffhandIndex >= 2 PlayerStats.currentOffhandIndex = 0;
	var equip = [equipmentSlot.off1,equipmentSlot.off2];
	var prevEquipID = ItemCache.equipment[? equip[PlayerStats.currentOffhandIndex]]
	if ItemCache.equipment[? equip[PlayerStats.currentOffhandIndex]] == noone currentOffhandIndex = 0;
	PlayerStats.currentOffhandID = ItemCache.equipment[? equip[PlayerStats.currentOffhandIndex]];
	if prevEquipID != ItemCache.equipment[? equip[PlayerStats.currentOffhandIndex]]
	{
		PlayerStats.currentOffhandSubtypeIndex = 0;
		PlayerStats.currentOffhandActivatableIndex = 0;
	}
	
//offhand Subtype
	if PlayerStats.currentOffhandSubtypeIndex >= ds_list_size(PlayerStats.subtypeCache) PlayerStats.currentOffhandSubtypeIndex = 0;
	PlayerStats.currentOffhandSubtypeID = PlayerStats.subtypeCache[| PlayerStats.currentOffhandSubtypeIndex];
	
//offhand activatable
	if PlayerStats.currentOffhandActivatableIndex >= ds_list_size(PlayerStats.activeCache) PlayerStats.currentOffhandActivatableIndex = 0;
	PlayerStats.currentOffhandActivatableID = PlayerStats.activeCache[| PlayerStats.currentOffhandActivatableIndex];
#endregion

//mainWeaponEquipmentChange old id save
if mainWeaponEquipmentChange equipmentSwitchWeaponIndex = mainWeaponPrev;
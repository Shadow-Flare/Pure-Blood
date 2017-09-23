///@scr_set_combo(oldSlot,newId)
activeComboIDs[argument0] = argument1;
activeComboNames[argument0] = attackNames[argument1];
activeComboAnimations[argument0] = attackAnimations[argument1];
activeComboDurations[argument0] = attackDurations[argument1];
activeComboCooldowns[argument0] = attackCooldowns[argument1];
activeComboMoveStarts[argument0] = attackMoveStart[argument1];
activeComboMoveDurations[argument0] = attackMoveDuration[argument1];
activeComboMoceDistancesY[argument0] = attackMoveDistancesY[argument1];
activeComboMoveDistancesX[argument0] = attackMoveDistancesX[argument1];
activeComboXOffsets[argument0] = attackXOffsets[argument1];
activeComboYOffsets[argument0] = attackYOffsets[argument1];
activeComboWidths[argument0] = attackWidths[argument1];
activeComboHeights[argument0] = attackHeights[argument1];

for (var i = 0; i < array_length_2d(attackHitStart,argument1); i++)
{
	activeComboHitStarts[argument0,i] = attackHitStart[argument1,i];
	activeComboHitDurations[argument0,i] = attackHitDuration[argument1,i];
	activeComboAttackTypes[argument0,i] = attackDamageTypes[argument1,i];
	activeComboDamageModifiers[argument0,i] = attackDamageModifiers[argument1,i];
	activeComboStaggerModifiers[argument0,i] = attackStaggerModifiers[argument1,i];
	activeComboKnockbacks[argument0,i] = attackKnockbacks[argument1,i];
	activeComboStatusTypes[argument0,i] = attackStatusTypes[argument1,i];
	activeComboStatusValues[argument0,i] = attackStatusValues[argument1,i];
}
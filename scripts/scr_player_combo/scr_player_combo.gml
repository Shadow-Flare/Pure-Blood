//att effect
var pl = id;
with instance_create_depth(x,y,-100,objPlayer_attack_effect)
{
	caster = pl;
	attackNum = pl.attackNum;
	caster.effect = id;
	//get effect properties/collisions
	attackName = ComboCache.activeComboNames[attackNum];
	attackDuration = ComboCache.activeComboDurations[attackNum];
	attackCooldown = ComboCache.activeComboCooldowns[attackNum];
	pl.attackName = attackName
	pl.attackDuration = attackDuration;
	pl.attackAnimation = ComboCache.activeComboAnimations[attackNum];
	pl.attackCooldown = attackCooldown
	pl.attackMoveDistanceY = ComboCache.activeComboMoceDistancesY[attackNum];
	pl.attackMoveDistanceX = ComboCache.activeComboMoveDistancesX[attackNum];
	pl.attackMoveStart = ComboCache.activeComboMoveStarts[attackNum];
	pl.attackMoveDuration = ComboCache.activeComboMoveDurations[attackNum];
	for(var i = 0; i < array_length_2d(ComboCache.activeComboHitStarts,attackNum); i++)
	{
		//Hit box numbs
		attackHitStart[i] = ComboCache.activeComboHitStarts[attackNum,i];
		attackHitDuration[i] = ComboCache.activeComboHitDurations[attackNum,i];
		//STATS
		attackDamageType[i] = ComboCache.activeComboAttackTypes[attackNum,i];
		attackDamageModifier[i] = ComboCache.activeComboDamageModifiers[attackNum,i];
		attackStaggerModifier[i] = ComboCache.activeComboStaggerModifiers[attackNum,i];
		attackKnockback[i] = ComboCache.activeComboKnockbacks[attackNum,i];
		attackStatusType[i] = ComboCache.activeComboStatusTypes[attackNum,i];
		attackStatusValue[i] = ComboCache.activeComboStatusValues[attackNum,i];
	}
	attackXOffset = ComboCache.activeComboXOffsets[attackNum];
	attackYOffset = ComboCache.activeComboYOffsets[attackNum];

	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*ComboCache.activeComboWidths[attackNum]/8;
	y=pl.y+attackYOffset;
	image_yscale = ComboCache.activeComboHeights[attackNum]/8;

}
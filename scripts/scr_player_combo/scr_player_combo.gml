//att effect
var pl = id;
with instance_create_depth(x,y,-100,obj_player_attack_effect)
{
	caster = pl;
	attackNum = pl.attackNum;
	caster.effect = id;
	//get effect properties/collisions
	attackName = obj_comboCache.activeComboNames[attackNum];
	attackDuration = obj_comboCache.activeComboDurations[attackNum];
	attackCooldown = obj_comboCache.activeComboCooldowns[attackNum];
	pl.attackDuration = attackDuration;
	pl.attackAnimation = obj_comboCache.activeComboAnimations[attackNum];
	pl.attackAnimationWep = obj_comboCache.activeComboAnimationWeps[attackNum];
	pl.attackAnimationEffect = obj_comboCache.activeComboAnimationEffects[attackNum];
	pl.attackCooldown = obj_comboCache.activeComboCooldowns[attackNum];
	pl.attackMoveDistanceY = obj_comboCache.activeComboMoceDistancesY[attackNum];
	pl.attackMoveDistanceX = obj_comboCache.activeComboMoveDistancesX[attackNum];
	pl.attackMoveStart = obj_comboCache.activeComboMoveStarts[attackNum];
	pl.attackMoveDuration = obj_comboCache.activeComboMoveDurations[attackNum];
	for(var i = 0; i < array_length_2d(obj_comboCache.activeComboHitStarts,attackNum); i++)
	{
		//Hit box numbs
		attackHitStart[i] = obj_comboCache.activeComboHitStarts[attackNum,i];
		attackHitDuration[i] = obj_comboCache.activeComboHitDurations[attackNum,i];
		//STATS
		attackDamageType[i] = obj_comboCache.activeComboAttackTypes[attackNum,i];
		attackDamageModifier[i] = obj_comboCache.activeComboDamageModifiers[attackNum,i];
		attackStaggerModifier[i] = obj_comboCache.activeComboStaggerModifiers[attackNum,i];
		attackKnockback[i] = obj_comboCache.activeComboKnockbacks[attackNum,i];
		attackStatusType[i] = obj_comboCache.activeComboStatusTypes[attackNum,i];
		attackStatusValue[i] = obj_comboCache.activeComboStatusValues[attackNum,i];
	}
	attackXOffset = obj_comboCache.activeComboXOffsets[attackNum];
	attackYOffset = obj_comboCache.activeComboYOffsets[attackNum];

	
	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*obj_comboCache.activeComboWidths[attackNum]/8;
	y=pl.y+attackYOffset;
	image_yscale = obj_comboCache.activeComboHeights[attackNum]/8;

}
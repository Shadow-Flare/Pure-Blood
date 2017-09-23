var pl = id;
with instance_create_depth(x,y,-100,obj_player_attack_effect)
{
	attackNum = argument0;
	caster = pl;
	caster.effect = id;
	//get effect properties/collisions
	attackName = obj_comboCache.attackNames[attackNum];
	attackDuration = obj_comboCache.attackDurations[attackNum];
	attackCooldown = obj_comboCache.attackCooldowns[attackNum];
	pl.attackDuration = attackDuration;
	pl.attackAnimation = obj_comboCache.attackAnimations[attackNum];
	pl.attackCooldown = attackCooldown;
	pl.attackMoveDistanceY = obj_comboCache.attackMoveDistancesY[attackNum];
	pl.attackMoveDistanceX = obj_comboCache.attackMoveDistancesX[attackNum];
	pl.attackMoveStart = obj_comboCache.attackMoveStart[attackNum];
	pl.attackMoveDuration = obj_comboCache.attackMoveDuration[attackNum];
	for(var i = 0; i < array_length_2d(obj_comboCache.attackHitStart,attackNum); i++)
	{
		//Hit box numbs
		attackHitStart[i] = obj_comboCache.attackHitStart[attackNum,i];
		attackHitDuration[i] = obj_comboCache.attackHitDuration[attackNum,i];
		//STATS
		attackDamageType[i] = obj_comboCache.attackDamageTypes[attackNum,i];
		attackDamageModifier[i] = obj_comboCache.attackDamageModifiers[attackNum,i];
		attackStaggerModifier[i] = obj_comboCache.attackStaggerModifiers[attackNum,i];
		attackKnockback[i] = obj_comboCache.attackKnockbacks[attackNum,i];
		attackStatusType[i] = obj_comboCache.attackStatusTypes[attackNum,i];
		attackStatusValue[i] = obj_comboCache.attackStatusValues[attackNum,i];
	}
	attackXOffset = obj_comboCache.attackXOffsets[attackNum];
	attackYOffset = obj_comboCache.attackYOffsets[attackNum];
	
	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*obj_comboCache.attackWidths[attackNum]/8;
	y=pl.y+attackYOffset;
	image_yscale = obj_comboCache.attackHeights[attackNum]/8;
}
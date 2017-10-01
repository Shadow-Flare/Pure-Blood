//
var pl = id;
with instance_create_depth(x,y,-100,obj_player_attack_effect)
{
	attackNum = argument0;
	caster = pl;
	caster.effect = id;
	//get effect properties/collisions
	attackName = ComboCache.attackNames[attackNum];
	attackDuration = ComboCache.attackDurations[attackNum];
	attackCooldown = ComboCache.attackCooldowns[attackNum];
	pl.attackName = attackName;
	pl.attackDuration = attackDuration;
	pl.attackAnimation = ComboCache.attackAnimations[attackNum];
	pl.attackCooldown = attackCooldown;
	pl.attackMoveDistanceY = ComboCache.attackMoveDistancesY[attackNum];
	pl.attackMoveDistanceX = ComboCache.attackMoveDistancesX[attackNum];
	pl.attackMoveStart = ComboCache.attackMoveStart[attackNum];
	pl.attackMoveDuration = ComboCache.attackMoveDuration[attackNum];
	for(var i = 0; i < array_length_2d(ComboCache.attackHitStart,attackNum); i++)
	{
		//Hit box numbs
		attackHitStart[i] = ComboCache.attackHitStart[attackNum,i];
		attackHitDuration[i] = ComboCache.attackHitDuration[attackNum,i];
		//STATS
		attackDamageType[i] = ComboCache.attackDamageTypes[attackNum,i];
		attackDamageModifier[i] = ComboCache.attackDamageModifiers[attackNum,i];
		attackStaggerModifier[i] = ComboCache.attackStaggerModifiers[attackNum,i];
		attackKnockback[i] = ComboCache.attackKnockbacks[attackNum,i];
		attackStatusType[i] = ComboCache.attackStatusTypes[attackNum,i];
		attackStatusValue[i] = ComboCache.attackStatusValues[attackNum,i];
	}
	attackXOffset = ComboCache.attackXOffsets[attackNum];
	attackYOffset = ComboCache.attackYOffsets[attackNum];
	
	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*ComboCache.attackWidths[attackNum]/8;
	y=pl.y+attackYOffset;
	image_yscale = ComboCache.attackHeights[attackNum]/8;
}
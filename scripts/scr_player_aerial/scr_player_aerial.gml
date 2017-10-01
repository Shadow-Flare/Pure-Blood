var pl = id;
with instance_create_depth(x,y,-100,objPlayer_attack_effect)
{
	caster = pl;
	caster.effect = id;
	attackNum = global.activeAerialID + argument0;
	//get effect properties/collisions
	attackName = global.aerialNames[attackNum];
	attackDuration = global.aerialDurations[attackNum];
	attackCooldown = global.aerialCooldowns[attackNum];
	pl.attackDuration = attackDuration;
	pl.attackAnimation = global.aerialAnimations[attackNum];
	pl.attackAnimationWep = global.aerialAnimationWeps[attackNum];
	pl.attackAnimationEffect = global.aerialAnimationEffects[attackNum];
	pl.attackCooldown = global.aerialCooldowns[attackNum];
	pl.attackMoveDistanceX = global.aerialMoveDistancesX[attackNum];
	pl.attackMoveDistanceY = global.aerialMoveDistancesY[attackNum];
	pl.attackMoveStart = global.aerialMoveStart[attackNum];
	pl.attackMoveDuration = global.aerialMoveDuration[attackNum];
	for(var i = 0; i < array_length_2d(global.aerialHitStart,attackNum); i++)
	{
		//Hit box numbs
		attackHitStart[i] = global.aerialHitStart[attackNum,i];
		attackHitDuration[i] = global.aerialHitDuration[attackNum,i];
		//STATS
		attackDamageType[i] = global.aerialDamageTypes[attackNum,i];
		attackDamageModifier[i] = global.aerialDamageModifiers[attackNum,i];
		attackStaggerModifier[i] = global.aerialStaggerModifiers[attackNum,i];
		attackKnockback[i] = global.aerialKnockbacks[attackNum,i];
		attackStatusType[i] = global.aerialStatusTypes[attackNum,i];
		attackStatusValue[i] = global.aerialStatusValues[attackNum,i];
	}
	attackXOffset = global.aerialXOffsets[attackNum];
	attackYOffset = global.aerialYOffsets[attackNum];

	
	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*global.aerialWidths[attackNum]/8;
	y=pl.y+attackYOffset;
	image_yscale = global.aerialHeights[attackNum]/8;
	
	//pl move set 0
	pl.xSpd = 0;
}
//att effect
var pl = id;
with instance_create_depth(x,y,-100,objPlayer_attack_effect)
{
	caster = pl;
	caster.effect = id;
	//get effect properties/collisions
	attackName = "Uppercut"
	attackDuration = ComboCache.uppercutDuration;
	attackCooldown = ComboCache.uppercutCooldown;
	pl.attackName = attackName;
	pl.attackDuration = attackDuration;
	pl.attackAnimation = ComboCache.offhandUppercutSprites[ComboCache.activeOffhandActivatableID];
	pl.attackCooldown = attackCooldown
	pl.attackMoveDistanceY = ComboCache.uppercutMoveDistanceY;
	pl.attackMoveDistanceX = ComboCache.uppercutMoveDistanceX;
	pl.attackMoveStart = ComboCache.uppercutMoveStart;
	pl.attackMoveDuration = ComboCache.uppercutMoveDuration;
	for(var i = 0; i < array_length_1d(ComboCache.uppercutHitStart); i++)
	{
		//Hit box numbs
		attackHitStart[i] = ComboCache.uppercutHitStart[i];
		attackHitDuration[i] = ComboCache.uppercutHitDuration[i];
		//STATS
		attackDamageType[i] = ComboCache.offhandSubtypeDamageTypes[ComboCache.activeOffhandSubtypeID];
		attackDamageModifier[i] = ComboCache.uppercutDamageModifier[i];
		attackStaggerModifier[i] = ComboCache.uppercutStaggerModifier[i];
		attackKnockback[i] = ComboCache.uppercutKnockback[i];
		attackStatusType[i] = ComboCache.uppercutStatusType[i];
		attackStatusValue[i] = ComboCache.uppercutStatusValue[i];
	}
	attackXOffset = ComboCache.uppercutXOffset;
	attackYOffset = ComboCache.uppercutYOffset;

	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*ComboCache.uppercutWidth/8;
	y=pl.y+attackYOffset;
	image_yscale = ComboCache.uppercutHeight/8;

}
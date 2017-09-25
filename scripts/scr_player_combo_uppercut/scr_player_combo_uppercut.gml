//att effect
var pl = id;
with instance_create_depth(x,y,-100,obj_player_attack_effect)
{
	caster = pl;
	caster.effect = id;
	//get effect properties/collisions
	attackName = "Uppercut"
	attackDuration = obj_comboCache.uppercutDuration;
	attackCooldown = obj_comboCache.uppercutCooldown;
	pl.attackName = attackName;
	pl.attackDuration = attackDuration;
	pl.attackAnimation = obj_comboCache.offhandUppercutSprites[obj_comboCache.activeOffhandActivatableID];
	pl.attackCooldown = attackCooldown
	pl.attackMoveDistanceY = obj_comboCache.uppercutMoveDistanceY;
	pl.attackMoveDistanceX = obj_comboCache.uppercutMoveDistanceX;
	pl.attackMoveStart = obj_comboCache.uppercutMoveStart;
	pl.attackMoveDuration = obj_comboCache.uppercutMoveDuration;
	for(var i = 0; i < array_length_1d(obj_comboCache.uppercutHitStart); i++)
	{
		//Hit box numbs
		attackHitStart[i] = obj_comboCache.uppercutHitStart[i];
		attackHitDuration[i] = obj_comboCache.uppercutHitDuration[i];
		//STATS
		attackDamageType[i] = obj_comboCache.offhandSubtypeDamageTypes[obj_comboCache.activeOffhandSubtypeID];
		attackDamageModifier[i] = obj_comboCache.uppercutDamageModifier[i];
		attackStaggerModifier[i] = obj_comboCache.uppercutStaggerModifier[i];
		attackKnockback[i] = obj_comboCache.uppercutKnockback[i];
		attackStatusType[i] = obj_comboCache.uppercutStatusType[i];
		attackStatusValue[i] = obj_comboCache.uppercutStatusValue[i];
	}
	attackXOffset = obj_comboCache.uppercutXOffset;
	attackYOffset = obj_comboCache.uppercutYOffset;

	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*obj_comboCache.uppercutWidth/8;
	y=pl.y+attackYOffset;
	image_yscale = obj_comboCache.uppercutHeight/8;

}
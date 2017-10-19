var pl = objPlayer;
with instance_create_depth(x,y,-100,obj_player_attack_effect)
{
	attackID = argument0;
	caster = pl;
	caster.effect = id;
	//get effect properties/collisions
	attackName = ComboCache.attackNames[? attackID];
	attackDuration = ComboCache.attackDurations[? attackID];
	attackCooldown = ComboCache.attackCooldowns[? attackID];
	pl.attackName = attackName;
	pl.attackDuration = attackDuration;
	pl.attackAnimation = ComboCache.attackAnimations[? attackID];
	pl.attackCooldown = attackCooldown;
	pl.attackMoveDistanceY = ComboCache.attackMoveDistancesY[? attackID];
	pl.attackMoveDistanceX = ComboCache.attackMoveDistancesX[? attackID];
	pl.attackMoveStart = ComboCache.attackMoveStart[? attackID];
	pl.attackMoveDuration = ComboCache.attackMoveDuration[? attackID];
	for(var i = 0; i < ds_list_size(ComboCache.attackHitStarts[? attackID]); i++)
	{
		//Hit box numbs
		attackHitStarts[i] = ds_list_find_value(ComboCache.attackHitStarts[? attackID],i);
		attackHitDurations[i] = ds_list_find_value(ComboCache.attackHitDurations[? attackID],i);
		//STATS
		attackDamageType[i] = ds_list_find_value(ComboCache.attackDamageTypes[? attackID],i);
		attackDamageModifier[i] = ds_list_find_value(ComboCache.attackDamageModifiers[? attackID],i);
		attackStaggerModifier[i] = ds_list_find_value(ComboCache.attackStaggerModifiers[? attackID],i);
		attackKnockback[i] = ds_list_find_value(ComboCache.attackKnockbacks[? attackID],i);
		attackStatusType[i] = ds_list_find_value(ComboCache.attackStatusTypes[? attackID],i);
		attackStatusValue[i] = ds_list_find_value(ComboCache.attackStatusValues[? attackID],i);
	}
	attackXOffset = ComboCache.attackXOffsets[? attackID];
	attackYOffset = ComboCache.attackYOffsets[? attackID];
	
	hitList = ds_list_create();
	
	//Set
	timer = 0;
	facing = pl.facing;
	x=pl.x+facing*attackXOffset;
	image_xscale = facing*ComboCache.attackWidths[? attackID]/3;
	y=pl.y+attackYOffset;
	image_yscale = ComboCache.attackHeights[? attackID]/3;
}
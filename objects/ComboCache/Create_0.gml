#region INITIALIZER
attackNames = ds_map_create();
attackTypes = ds_map_create();
attackAnimations = ds_map_create();
attackDurations = ds_map_create();
attackCooldowns = ds_map_create();
attackHitStarts = ds_map_create();
attackHitDurations = ds_map_create();
attackMoveStart = ds_map_create();
attackMoveDuration = ds_map_create();
attackMoveDistancesY = ds_map_create();
attackMoveDistancesX = ds_map_create();
attackXOffsets = ds_map_create();
attackYOffsets = ds_map_create();
attackWidths = ds_map_create();
attackHeights = ds_map_create();
attackDamageTypes = ds_map_create();
attackDamageModifiers = ds_map_create();
attackStaggerModifiers = ds_map_create();
attackKnockbacks = ds_map_create();
attackStatusTypes = ds_map_create();
attackStatusValues = ds_map_create();
#endregion

#region #-01 Uppercut:					template for uppercut
var tmpId = -1;
attackNames[? tmpId] = "Uppercut";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordCrossbowUppercut;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.3;
attackCooldowns[? tmpId] = 0.1;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/4/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 2;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],0);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],1);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.25);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],-1);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);		
#endregion

//GROUND COMBO VARIABLES
//Attack Types:
//	0: non-typical, used for utilities like counter attacks && directional attacks
//	1: all slots
//	2: initial
//	3: middle
//	4: finisher
//Attacks:
//1: Sword (# indicates a non selectable attack)
//		0: #Counter
//		1: #Skyward Slice
//		2: #Earthen Release
//		3: #Burst
//		4: #Shove
//		5: #Uppercut
//		6: Slice (Has alternate animation)
//		7: Smash
//		8: Gut

#region #000 Counter:				Counter attack - flows into rest of combo afterwards.
tmpId++;
attackNames[? tmpId] = "Counter";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordCounter;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.4;
attackCooldowns[? tmpId] = 0.2;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 24;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],0);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],1.3);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.3);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],5);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);	
#endregion
#region #001 Skyward Slice:			Upwards attack - slash upwards while jumping, does not (typically) uppercut enemies.
tmpId++;
attackNames[? tmpId] = "Skyward Slice";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordSkywardSlice;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.6;
attackCooldowns[? tmpId] = 0.2;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = -40;
attackMoveDistancesX[? tmpId] = 6;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],0);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],0.3);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],-1);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);	
#endregion
#region #002 Earthen Release:		Downwards attack - attack to both sides of player with moderate reach, low damage and high stagger.
tmpId++;
attackNames[? tmpId] = "Earthen Release";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordEarthenRelease;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.8;
attackCooldowns[? tmpId] = 0.4;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 0;
attackXOffsets[? tmpId] = 0;
attackYOffsets[? tmpId] = -12;
attackWidths[? tmpId] = 60;
attackHeights[? tmpId] = 32;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],2);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],0.8);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.3);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],4);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);		
#endregion
#region #003 Burst:					Forwards attack - flows into rest of combo.
tmpId++;
attackNames[? tmpId] = "Burst";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordBurst;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.8;
attackCooldowns[? tmpId] = 0.2;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 80;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],2);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],0.8);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.3);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],3);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);		
#endregion
#region #004 Shove:					Backwards attack - slow attack pushing enemy backwards.
tmpId++;
attackNames[? tmpId] = "Shove";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordShove;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.6;
attackCooldowns[? tmpId] = 0.3;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 6;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],1);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],0.2);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],2.5);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],4);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);	
#endregion
#region #005 Slice:					Fast basic strike.
tmpId++;
attackNames[? tmpId] = "Slice";
attackTypes[? tmpId] = 1;
attackAnimations[? tmpId] = sprPlayerBodySwordSlice;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.2;
attackCooldowns[? tmpId] = 0.4;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 6;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],0);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],1);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.25);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],2);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);				
#endregion
#region #006 Smash:					Heavy knockback attack.
tmpId++;
attackNames[? tmpId] = "Smash";
attackTypes[? tmpId] = 4;
attackAnimations[? tmpId] = sprPlayerBodySwordSmash;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.6;
attackCooldowns[? tmpId] = 0.4;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 8;
attackXOffsets[? tmpId] = 8;
attackYOffsets[? tmpId] = -8;
attackWidths[? tmpId] = 40;
attackHeights[? tmpId] = 30;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],1);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],2.8);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],4);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],10);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);	
#endregion
#region #007 Gut:					Bleed inducing finisher, attemps to knock down opponent on second hit.
tmpId++;
attackNames[? tmpId] = "Gut";
attackTypes[? tmpId] = 4;
attackAnimations[? tmpId] = sprPlayerBodySwordGut;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 2;
attackCooldowns[? tmpId] = 0;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])),
										 (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/8/**//sprite_get_number(attackAnimations[? tmpId])),
											(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 2;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = 0;
attackWidths[? tmpId] = 20;
attackHeights[? tmpId] = 9;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],2,2);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],0.5,0.1);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],2,4);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],0,2.5);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1,0);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0,130);	
#endregion

//class ID lists
//Sword: (0)Slice (1)Burst (2)Smash (3)Gut
swordClassID = 0;

swordCounterID = 0;
swordUpwardsID = 1;
swordDownwardsID = 2;
swordForwardsID = 3;
swordBackwardsID = 4;

swordSize = tmpId
for(var i = 0; i < tmpId+1; i++)
{
	classSwordAttackIDs[i] = i+swordClassID;
}

//AERIAL COMBO VARIABLES
//Attacks:
//1: Sword
//		0: Basic (HAS ALTERNATE ANIMATION)
//		1: Slam

//aerial class ID lists
//Sword: (0)Basic (1)Slam

#region #008 Slash:					Fast basic strike.
tmpId++;
attackNames[? tmpId] = "Slash";
attackTypes[? tmpId] = 0;
attackAnimations[? tmpId] = sprPlayerBodySwordAerialSlash;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.2;
attackCooldowns[? tmpId] = 0.4;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 6;
attackXOffsets[? tmpId] = 16;
attackYOffsets[? tmpId] = -6;
attackWidths[? tmpId] = 30;
attackHeights[? tmpId] = 18;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],0);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],1);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],1.25);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],12);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);	
#endregion
#region #009 Slam:					Heavy knockback attack.
tmpId++;
attackNames[? tmpId] = "Slam";
attackTypes[? tmpId] = 2;
attackAnimations[? tmpId] = sprPlayerBodySwordAerialSlam;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
attackDurations[? tmpId] = 0.4;
attackCooldowns[? tmpId] = 0.3;
attackHitStarts[? tmpId] = ds_list_create();
	ds_list_add(attackHitStarts[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/3/**//sprite_get_number(attackAnimations[? tmpId])))
attackHitDurations[? tmpId] = ds_list_create();
	ds_list_add(attackHitDurations[? tmpId],(attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/2/**//sprite_get_number(attackAnimations[? tmpId])))
attackMoveStart[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/1/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDuration[? tmpId] = (attackDurations[? tmpId]+attackCooldowns[? tmpId])*(/**/4/**//sprite_get_number(attackAnimations[? tmpId]));
attackMoveDistancesY[? tmpId] = 0;
attackMoveDistancesX[? tmpId] = 12;
attackXOffsets[? tmpId] = 8;
attackYOffsets[? tmpId] = -8;
attackWidths[? tmpId] = 40;
attackHeights[? tmpId] = 30;
attackDamageTypes[? tmpId] = ds_list_create();
	ds_list_add(attackDamageTypes[? tmpId],1);
attackDamageModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackDamageModifiers[? tmpId],2.8);
attackStaggerModifiers[? tmpId] = ds_list_create();
	ds_list_add(attackStaggerModifiers[? tmpId],4);
attackKnockbacks[? tmpId] = ds_list_create();
	ds_list_add(attackKnockbacks[? tmpId],-2);
attackStatusTypes[? tmpId] = ds_list_create();
	ds_list_add(attackStatusTypes[? tmpId],-1);
attackStatusValues[? tmpId] = ds_list_create();
	ds_list_add(attackStatusValues[? tmpId],0);		
#endregion

//EQUIPMENT & SPELLS
	//Equipments:
		//0:	Crossbow
		//1:	Spells
	//SubTypes:
		//Crossbow:
			//0:	Normal Bolts
			//1:	Flaming Bolts
			//2:	Frozen Bolts
			//3:	Charged Bolts
			//4:	Serrated Bolts
		//Spells:
			//5:	Blaze
			//6:	Frost
			//7:	Spark
			//8:	Leech
			//9:	Osmose
	//Activatables:
		//Crossbow:
			//0: Rope Shot
			//1: Shrapnel Burst
		//Spell:
			//2: Mine
			//3: Shell
			//4: Aura
		
//0: Crossbow
tmpId = 0;
offhandNames[tmpId] = "Crossbow";
offhandQuickfireSprites[tmpId] = noone;
offhandUppercutSprites[tmpId] = sprPlayerBodySwordCrossbowUppercut;
offhandHoldingSprites[tmpId] = noone;
//offhandAerialSprites[tmpId] = spr_player_crossbow_aerial_body;
offhandBaseProjectiles[tmpId] = obj_crossbow_projectile;
	//subtypes
  var tmpIdTwo = 0;		//0: Normal Bolts
		offhandSubtypeNames[tmpIdTwo] = "Normal Bolts";					//Name	
		offhandSubtypeDamageTypes[tmpIdTwo] = 1;							//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.3;					//damage modifier, multiplicative
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;							//Status Type (-1:None|0:Bleed)
		offhandSubtypeStatusValues[tmpIdTwo] = 0;							//Status Value (NEED BASED ON PLAYER STAT IMPLEMENTATION)
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;					//stagger modifier, multiplicative
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;							//physics knockback on a heavy stagger attack
		offhandSubtypeManaCosts[tmpIdTwo] = 0;							//mana cost per use
		tmpIdTwo++;		//1: Flaming Bolts
		offhandSubtypeNames[tmpIdTwo] = "Flaming Bolts";
		offhandSubtypeDamageTypes[tmpIdTwo] = 3;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.2;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;
		offhandSubtypeStatusValues[tmpIdTwo] = 0;
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;
		offhandSubtypeManaCosts[tmpIdTwo] = 2;
		tmpIdTwo++;		//2: Frozen Bolts
		offhandSubtypeNames[tmpIdTwo] = "Frozen Bolts";
		offhandSubtypeDamageTypes[tmpIdTwo] = 4;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.3;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;					
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;						
		offhandSubtypeManaCosts[tmpIdTwo] = 3;
		tmpIdTwo++;		//3: Charged Bolts
		offhandSubtypeNames[tmpIdTwo] = "Charged Bolts";
		offhandSubtypeDamageTypes[tmpIdTwo] = 5;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.4;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;				
		offhandSubtypeStatusValues[tmpIdTwo] = 0;			
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;	
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;					
		offhandSubtypeManaCosts[tmpIdTwo] = 4;
		tmpIdTwo++;		//4: Serrated Bolts
		offhandSubtypeNames[tmpIdTwo] = "Serrated Bolts";
		offhandSubtypeDamageTypes[tmpIdTwo] = 0;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.3;
		offhandSubtypeStatusTypes[tmpIdTwo] = 0;					
		offhandSubtypeStatusValues[tmpIdTwo] = 20;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;						
		offhandSubtypeManaCosts[tmpIdTwo] = 3;
	//activatables
  var tmpIdThree = 0;	//0: Rope Shot
		offhandActivatableNames[tmpIdThree] = "Rope Shot";
		offhandActivatableDurations[tmpIdThree] = 0.4;
		offhandActivatableCooldowns[tmpIdThree] = 0.2;
		tmpIdThree++;	//1: Shrapnel Burst
		offhandActivatableNames[tmpIdThree] = "Shrapnel Burst";
		offhandActivatableDurations[tmpIdThree] = 0.4;
		offhandActivatableCooldowns[tmpIdThree] = 0.2;
		
crossbowId = tmpId;
crossbowSubId = 0;
crossbowSubSize = tmpIdTwo;
crossbowActiveId = 0;
crossbowActiveSize = tmpIdThree;

tmpId++;
offhandNames[tmpId] = "Spells"
offhandQuickfireSprites[tmpId] = spr_player_spells_quickfire_body;
offhandUppercutSprites[tmpId] = spr_player_spells_uppercut_body;
offhandHoldingSprites[tmpId] = spr_player_spells_holding_body;
offhandAerialSprites[tmpId] = spr_player_spells_aerial_body;
offhandBaseProjectiles[tmpId] = obj_spells_projectile;
	//Subtypes
		tmpIdTwo++;		//5: Blaze
		offhandSubtypeNames[tmpIdTwo] = "Blaze"
		offhandSubtypeDamageTypes[tmpIdTwo] = 3;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.8;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;	
		offhandSubtypeManaCosts[tmpIdTwo] = 4;
		tmpIdTwo++;		//6: Frost
		offhandSubtypeNames[tmpIdTwo] = "Frost"
		offhandSubtypeDamageTypes[tmpIdTwo] = 4;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 1;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;	
		offhandSubtypeManaCosts[tmpIdTwo] = 5;
		tmpIdTwo++;		//7: Spark
		offhandSubtypeNames[tmpIdTwo] = "Spark"
		offhandSubtypeDamageTypes[tmpIdTwo] = 5;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 1.2;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;	
		offhandSubtypeManaCosts[tmpIdTwo] = 6;
		tmpIdTwo++;		//8: Leech
		offhandSubtypeNames[tmpIdTwo] = "Leech"
		offhandSubtypeDamageTypes[tmpIdTwo] = 8;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 0.7;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;	
		offhandSubtypeManaCosts[tmpIdTwo] = 8;
		tmpIdTwo++;		//9: Osmose
		offhandSubtypeNames[tmpIdTwo] = "Osmose"
		offhandSubtypeDamageTypes[tmpIdTwo] = 6;
		offhandSubtypeDamageModifiers[tmpIdTwo] = 1;
		offhandSubtypeStatusTypes[tmpIdTwo] = -1;					
		offhandSubtypeStatusValues[tmpIdTwo] = 0;				
		offhandSubtypeStaggerModifiers[tmpIdTwo] = 0.2;			
		offhandSubtypeKnockbacks[tmpIdTwo] = 5;	
		offhandSubtypeManaCosts[tmpIdTwo] = 2;
	//activatables
		tmpIdThree++;	//2: Mine
		offhandActivatableNames[tmpIdThree] = "Mine";
		offhandActivatableDurations[tmpIdThree] = 0.4;
		offhandActivatableCooldowns[tmpIdThree] = 0.2;
		tmpIdThree++;	//4: Aura
		offhandActivatableNames[tmpIdThree] = "Aura";
		offhandActivatableDurations[tmpIdThree] = 0.4;
		offhandActivatableCooldowns[tmpIdThree] = 0.2;
		
spellId = tmpId;
spellSubId = crossbowSubId+crossbowSubSize;
spellSubSize = tmpIdThree-crossbowSubSize;
spellActiveId = crossbowActiveId+crossbowActiveSize;
spellActiveSize = tmpIdThree-crossbowActiveSize;

//ACTIVE E&S VARIABLES; WHACKED IN DEFAULTS, GET RID OF THESE
activeOffhandID = 0;
activeOffhandSubtypeID = 0;
activeOffhandActivatableID = 0;
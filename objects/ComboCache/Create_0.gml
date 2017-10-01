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
var tmpId = 0;
attackNames[tmpId] = "Counter";								//Name to be displayed in combo editor
attackTypes[tmpId] = 0;										//dictates possible slots for editor, key above
attackAnimations[tmpId] = sprPlayerBodySwordCounter;		//body sprite
attackDurations[tmpId] = 0.4;								//active attack duration (seconds)			//below code looks complex but just place the relevant
attackCooldowns[tmpId] = 0.2;								//cooldown period AFTER duration (seconds)	//time in FRAMES in between the "/**/"s (collumn index is for multiple hits)
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;							//total distance moved Vertically over move duration (8*<distance in pixels>)
attackMoveDistancesX[tmpId] = 8*24;							//total distance moved Horizontally over move duration (8*<distance in pixels>)
attackXOffsets[tmpId] = 8*16;								//distance from player center where center of hitbox will be along X axis (8*<distance in pixels>)
attackYOffsets[tmpId] = 8*-6;								//distance from player center where center of hitbox will be along Y axis (8*<distance in pixels>)
attackWidths[tmpId] = 8*30;									//width of hit box about box center (8*<width in pixels>)
attackHeights[tmpId] = 8*18;									//height of hit box about box center (8*<height in pixels>)
attackDamageTypes[tmpId,0] = 0;								//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
attackDamageModifiers[tmpId,0] = 1.3;							//Damage modifier (multiplicative)
attackStaggerModifiers[tmpId,0] = 1.3;							//Stagger modifier (multiplicative)
attackKnockbacks[tmpId,0] = 40;								//Physics knockback on a heavy stagger attack
attackStatusTypes[tmpId,0] = -1;								//Status Type (-1:None|0:Bleed)
attackStatusValues[tmpId,0] = 0;								//Status Value (NEED BASED ON PLAYER STAT IMPLEMENTATION)
#endregion
#region #001 Skyward Slice:			Upwards attack - slash upwards while jumping, does not (typically) uppercut enemies.
tmpId++;
attackNames[tmpId] = "Skyward Slice";
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = sprPlayerBodySwordSkywardSlice;
attackDurations[tmpId] = 0.6;
attackCooldowns[tmpId] = 0.2;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*-40;
attackMoveDistancesX[tmpId] = 8*0;
attackXOffsets[tmpId] = 8*16;
attackYOffsets[tmpId] = 8*-6;
attackWidths[tmpId] = 8*30;
attackHeights[tmpId] = 8*18;
attackDamageTypes[tmpId,0] = 0;
attackDamageModifiers[tmpId,0] = 0.3;
attackStaggerModifiers[tmpId,0] = 1;
attackKnockbacks[tmpId,0] = -1;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;
#endregion
#region #002 Earthen Release:		Downwards attack - attack to both sides of player with moderate reach, low damage and high stagger.
tmpId++;
attackNames[tmpId] = "Earthen Release"
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = sprPlayerBodySwordEarthenRelease;
attackDurations[tmpId] = 0.8;
attackCooldowns[tmpId] = 0.4;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*0;
attackXOffsets[tmpId] = 8*0;
attackYOffsets[tmpId] = 8*-12;
attackWidths[tmpId] = 8*60;
attackHeights[tmpId] = 8*32;
attackDamageTypes[tmpId,0] = 2;								
attackDamageModifiers[tmpId,0] = 0.8;					
attackStaggerModifiers[tmpId,0] = 1.3;			
attackKnockbacks[tmpId,0] = 25;						
attackStatusTypes[tmpId,0] = -1;					
attackStatusValues[tmpId,0] = 0;	
#endregion
#region #003 Burst:					Forwards attack - flows into rest of combo.
tmpId++;
attackNames[tmpId] = "Burst"
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = sprPlayerBodySwordBurst;
attackDurations[tmpId] = 0.8;
attackCooldowns[tmpId] = 0.2;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*80;
attackXOffsets[tmpId] = 8*16;
attackYOffsets[tmpId] = 8*-6;
attackWidths[tmpId] = 8*30;
attackHeights[tmpId] = 8*18;
attackDamageTypes[tmpId,0] = 2;								
attackDamageModifiers[tmpId,0] = 0.8;					
attackStaggerModifiers[tmpId,0] = 1.3;			
attackKnockbacks[tmpId,0] = 25;						
attackStatusTypes[tmpId,0] = -1;					
attackStatusValues[tmpId,0] = 0;	
#endregion
#region #004 Shove:					Backwards attack - slow attack pushing enemy backwards.
tmpId++;
attackNames[tmpId] = "Shove";
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = sprPlayerBodySwordShove
attackDurations[tmpId] = 0.6;
attackCooldowns[tmpId] = 0.3;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*6;
attackXOffsets[tmpId] = 8*16;
attackYOffsets[tmpId] = 8*-6;
attackWidths[tmpId] = 8*30;
attackHeights[tmpId] = 8*18;
attackDamageTypes[tmpId,0] = 1;
attackDamageModifiers[tmpId,0] = 0.2;
attackStaggerModifiers[tmpId,0] = 2.5;
attackKnockbacks[tmpId,0] = 30;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;
#endregion
#region #005 Slice:					Fast basic strike.
tmpId++;
attackNames[tmpId] = "Slice";
attackTypes[tmpId] = 1;
attackAnimations[tmpId] = sprPlayerBodySwordSlice;
attackDurations[tmpId] = 0.2;
attackCooldowns[tmpId] = 0.4;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*6;
attackXOffsets[tmpId] = 8*16;
attackYOffsets[tmpId] = 8*-6;
attackWidths[tmpId] = 8*30;
attackHeights[tmpId] = 8*18;
attackDamageTypes[tmpId,0] = 0;
attackDamageModifiers[tmpId,0] = 1;
attackStaggerModifiers[tmpId,0] = 1.25;
attackKnockbacks[tmpId,0] = 16;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;				
#endregion
#region #006 Smash:					Heavy knockback attack.
tmpId++;
attackNames[tmpId] = "Smash"
attackTypes[tmpId] = 4;
attackAnimations[tmpId] = sprPlayerBodySwordSmash;
attackDurations[tmpId] = 0.6;
attackCooldowns[tmpId] = 0.4;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*8;
attackXOffsets[tmpId] = 8*8;
attackYOffsets[tmpId] = 8*-8;
attackWidths[tmpId] = 8*40;
attackHeights[tmpId] = 8*30;
attackDamageTypes[tmpId,0] = 1;								
attackDamageModifiers[tmpId,0] = 2.8;					
attackStaggerModifiers[tmpId,0] = 4;			
attackKnockbacks[tmpId,0] = 80;						
attackStatusTypes[tmpId,0] = -1;					
attackStatusValues[tmpId,0] = 0;		
#endregion
#region #007 Gut:					Bleed inducing finisher, attemps to knock down opponent on second hit.
tmpId++;
attackNames[tmpId] = "Gut"
attackTypes[tmpId] = 4;
attackAnimations[tmpId] = sprPlayerBodySwordGut;
attackDurations[tmpId] = 2;
attackCooldowns[tmpId] = 0;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackHitStart[tmpId,1] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/8/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,1] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 8*0;
attackMoveDistancesX[tmpId] = 8*2;
attackXOffsets[tmpId] = 8*16;
attackYOffsets[tmpId] = 8*0;
attackWidths[tmpId] = 8*20;
attackHeights[tmpId] = 8*9;
attackDamageTypes[tmpId,0] = 2;
attackDamageModifiers[tmpId,0] = 0.5;
attackStaggerModifiers[tmpId,0] = 2;
attackKnockbacks[tmpId,0] = 0;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;
attackDamageTypes[tmpId,1] = 2;
attackDamageModifiers[tmpId,1] = 0.1;
attackStaggerModifiers[tmpId,1] = 4;
attackKnockbacks[tmpId,1] = 20;
attackStatusTypes[tmpId,1] = 0;
attackStatusValues[tmpId,1] = 130;
#endregion

//class ID lists
//Sword: (0)Slice (1)Burst (2)Smash (3)Gut
swordClassId = 0;

swordCounterId = 0;
swordUpwardsId = 1;
swordDownwardsId = 2;
swordForwardsId = 3;
swordBackwardsId = 4;

swordSize = tmpId
for(var i = 0; i < tmpId+1; i++)
{
	classSwordAttackIDs[i] = i+swordClassId;
}

//AERIAL COMBO VARIABLES
//Attacks:
//1: Sword
//		0: Basic (HAS ALTERNATE ANIMATION)
//		1: Slam

//aerial class ID lists
//Sword: (0)Basic (1)Slam
aerialSwordId = tmpId+1;

#region #008 Slash:					Fast basic strike.
tmpId++;
attackNames[tmpId] = "Slash";								//Name to be displayed in combo editor
attackAnimations[tmpId] = sprPlayerBodySwordAerialSlash;	//body sprite
attackSpecialEffects[tmpId] = "";
attackDurations[tmpId] = 0.2;								//active attack duration (seconds)			//below code looks complex but just place the relevant
attackCooldowns[tmpId] = 0.4;								//cooldown period AFTER duration (seconds)	//FRAMES in between the "/**/"s (collumn index is for multiple hits)
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 0;
attackMoveDistancesX[tmpId] = 0;
attackXOffsets[tmpId] = 8*16;								//distance from player center where center of hitbox will be along X axis (8*<distance in pixels>)
attackYOffsets[tmpId] = 8*-6;								//distance from player center where center of hitbox will be along Y axis (8*<distance in pixels>)
attackWidths[tmpId] = 8*30;									//width of hit box about box center (8*<width in pixels>)
attackHeights[tmpId] = 8*18;									//height of hit box about box center (8*<height in pixels>)
attackDamageTypes[tmpId,0] = 0;								//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
attackDamageModifiers[tmpId,0] = 1;							//Damage modifier (multiplicative)
attackStaggerModifiers[tmpId,0] = 1.25;							//Stagger modifier (multiplicative)
attackKnockbacks[tmpId,0] = 12;								//Physics knockback on a heavy stagger attack
attackStatusTypes[tmpId,0] = -1;								//Status Type (-1:None|0:Bleed)
attackStatusValues[tmpId,0] = 0;								//Status Value (NEED BASED ON PLAYER STAT IMPLEMENTATION)
#endregion
#region #009 Slam:					Heavy knockback attack.
tmpId++;
attackNames[tmpId] = "Slam"
attackTypes[tmpId] = 2;
attackAnimations[tmpId] = sprPlayerBodySwordAerialSlam
attackSpecialEffects[tmpId] = "";
attackDurations[tmpId] = 0.6;
attackCooldowns[tmpId] = 0.4;
attackHitStart[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/3/**//sprite_get_number(attackAnimations[tmpId]));
attackHitDuration[tmpId,0] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/2/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveStart[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/1/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDuration[tmpId] = (attackDurations[tmpId]+attackCooldowns[tmpId])*(/**/4/**//sprite_get_number(attackAnimations[tmpId]));
attackMoveDistancesY[tmpId] = 0;
attackMoveDistancesX[tmpId] = 0;
attackXOffsets[tmpId] = 8*8;
attackYOffsets[tmpId] = 8*-8;
attackWidths[tmpId] = 8*40;
attackHeights[tmpId] = 8*30;
attackDamageTypes[tmpId,0] = 1;								
attackDamageModifiers[tmpId,0] = 2.8;					
attackStaggerModifiers[tmpId,0] = 4;			
attackKnockbacks[tmpId,0] = -2;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;	
#endregion

//ACTIVE COMBO VARIABLES; WHACKED IN DEFAULTS, GET RID OF THESE
	//[attack1]-[attack2]-[attack3]
	//[0]-[0]-[0]
	//active class: Fists

	//active combo properties
scr_set_combo(0,5);			//slice
scr_set_combo(1,5);			//slice
scr_set_combo(2,5);			//slice
scr_set_combo(3,6);			//smash

scr_set_class("Sword");

//General uppercut data
uppercutName = "Uppercut";
uppercutType = 1;
uppercutAnimation = sprPlayerBodySwordSlice;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduration
uppercutDuration = 0.3;
uppercutCooldown = 0.1;
uppercutHitStart[0] = (uppercutDuration+uppercutCooldown)*(/**/3/**//sprite_get_number(uppercutAnimation));
uppercutHitDuration[0] = (uppercutDuration+uppercutCooldown)*(/**/2/**//sprite_get_number(uppercutAnimation));
uppercutMoveStart = (uppercutDuration+uppercutCooldown)*(/**/2/**//sprite_get_number(uppercutAnimation));
uppercutMoveDuration = (uppercutDuration+uppercutCooldown)*(/**/1/**//sprite_get_number(uppercutAnimation));
uppercutMoveDistanceY = 8*0;
uppercutMoveDistanceX = 8*6;
uppercutXOffset = 8*16;
uppercutYOffset = 8*-6;
uppercutWidth = 8*30;
uppercutHeight = 8*18;
//uppercutDamageType[0] = 0;						//dictated in scr_player_combo_uppercut()
uppercutDamageModifier[0] = 1;
uppercutStaggerModifier[0] = 1.25;
uppercutKnockback[0] = -1;
uppercutStatusType[0] = -1;
uppercutStatusValue[0] = 0;

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
//GROUND COMBO VARIABLES
//Attack Types:
//	0: non-typical, used for utilities like counter attacks && directional attacks
//	1: all slots
//	2: initial
//	3: middle
//	4: finisher
//Attacks:
//1: Sword
//		0: Slice (Has alternate animation)
//		1: Burst
//		2: Smash
//		3: Gut

//#0 Counter: Counter attack - flows into rest of combo afterwards
var tmpId = 0;
attackNames[tmpId] = "Counter";								//Name to be displayed in combo editor
attackTypes[tmpId] = 0;										//dictates possible slots for editor, key above
attackAnimations[tmpId] = spr_player_counter_body;			//body sprite
attackAnimationWeps[tmpId] = spr_player_burst_weapon;		//weapon sprite
attackAnimationEffects[tmpId] = spr_player_burst_effect;		//effect sprite
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

//#1 Skyward Slice: Upwards attack - slash upwards while jumping, does not (typically) uppercut enemies
tmpId++;
attackNames[tmpId] = "Skyward Slice";
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = spr_player_skywardSlice_body;
attackAnimationWeps[tmpId] = spr_player_slice_weapon;
attackAnimationEffects[tmpId] = spr_player_slice_effect;
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

//#2 Earthen Release: Downwards attack - attack to both sides of player with moderate reach, low damage and high stagger
tmpId++;
attackNames[tmpId] = "Earthen Release"
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = spr_player_earthenRelease_body;
attackAnimationWeps[tmpId] = spr_player_burst_weapon;
attackAnimationEffects[tmpId] = spr_player_burst_effect;
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

//#3 Burst: Forwards attack - flows into rest of combo
tmpId++;
attackNames[tmpId] = "Burst"
attackTypes[tmpId] = 2;
attackAnimations[tmpId] = spr_player_burst_body;
attackAnimationWeps[tmpId] = spr_player_burst_weapon;
attackAnimationEffects[tmpId] = spr_player_burst_effect;
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

//#4 Shove: Backwards attack - slow attack pushing enemy backwards
tmpId++;
attackNames[tmpId] = "Shove";
attackTypes[tmpId] = 0;
attackAnimations[tmpId] = spr_player_shove_body;
attackAnimationWeps[tmpId] = spr_player_slice_weapon;
attackAnimationEffects[tmpId] = spr_player_slice_effect;
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

//#5 Slice: fast basic strike
tmpId++;
attackNames[tmpId] = "Slice";
attackTypes[tmpId] = 1;
attackAnimations[tmpId] = spr_player_slice_body;
attackAnimationWeps[tmpId] = spr_player_slice_weapon;
attackAnimationEffects[tmpId] = spr_player_slice_effect;
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
attackKnockbacks[tmpId,0] = 0;
attackStatusTypes[tmpId,0] = -1;
attackStatusValues[tmpId,0] = 0;				

//#6 Smash: Heavy knockback attack
tmpId++;
attackNames[tmpId] = "Smash"
attackTypes[tmpId] = 4;
attackAnimations[tmpId] = spr_player_smash_body;
attackAnimationWeps[tmpId] = spr_player_smash_weapon;
attackAnimationEffects[tmpId] = spr_player_smash_effect;
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

//#7 Gut: bleed inducing finisher, attemps to knock down opponent on second hit
tmpId++;
attackNames[tmpId] = "Gut"
attackTypes[tmpId] = 4;
attackAnimations[tmpId] = spr_player_gut_body;
attackAnimationWeps[tmpId] = spr_player_gut_weapon;
attackAnimationEffects[tmpId] = spr_player_gut_effect;
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

//#0 Basic
var tmpId = 0;
aerialNames[tmpId] = "Basic";								//Name to be displayed in combo editor
aerialAnimations[tmpId] = spr_player_aerialSlash_body;				//body sprite
aerialAnimationWeps[tmpId] = spr_player_aerialSlash_weapon;		//weapon sprite
aerialAnimationEffects[tmpId] = spr_player_aerialSlash_effect;		//effect sprite
aerialSpecialEffects[tmpId] = "";
aerialDurations[tmpId] = 0.4;								//active attack duration (seconds)			//below code looks complex but just place the relevant
aerialCooldowns[tmpId] = 0.2;								//cooldown period AFTER duration (seconds)	//FRAMES in between the "/**/"s (collumn index is for multiple hits)
aerialHitStart[tmpId,0] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/1/**//sprite_get_number(aerialAnimations[tmpId]));
aerialHitDuration[tmpId,0] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/2/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveStart[tmpId] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/1/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveDuration[tmpId] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/2/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveDistancesY[tmpId] = 8*-4;
aerialMoveDistancesX[tmpId] = 8*4;
aerialXOffsets[tmpId] = 8*16;								//distance from player center where center of hitbox will be along X axis (8*<distance in pixels>)
aerialYOffsets[tmpId] = 8*-6;								//distance from player center where center of hitbox will be along Y axis (8*<distance in pixels>)
aerialWidths[tmpId] = 8*30;									//width of hit box about box center (8*<width in pixels>)
aerialHeights[tmpId] = 8*18;									//height of hit box about box center (8*<height in pixels>)
aerialDamageTypes[tmpId,0] = 0;								//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
aerialDamageModifiers[tmpId,0] = 1;							//Damage modifier (multiplicative)
aerialStaggerModifiers[tmpId,0] = 1.2;							//Stagger modifier (multiplicative)
aerialKnockbacks[tmpId,0] = 0;								//Physics knockback on a heavy stagger attack
aerialStatusTypes[tmpId,0] = -1;								//Status Type (-1:None|0:Bleed)
aerialStatusValues[tmpId,0] = 0;								//Status Value (NEED BASED ON PLAYER STAT IMPLEMENTATION)

//#1 Slam
tmpId++;
aerialNames[tmpId] = "Slam"
aerialTypes[tmpId] = 2;
aerialAnimations[tmpId] = spr_player_aerialFinish_body;
aerialAnimationWeps[tmpId] = spr_player_aerialFinish_weapon;
aerialAnimationEffects[tmpId] = spr_player_aerialFinish_effect;
aerialSpecialEffects[tmpId] = "";
aerialDurations[tmpId] = 0.6;
aerialCooldowns[tmpId] = 0.4;
aerialHitStart[tmpId,0] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/3/**//sprite_get_number(aerialAnimations[tmpId]));
aerialHitDuration[tmpId,0] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/2/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveStart[tmpId] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/1/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveDuration[tmpId] = (aerialDurations[tmpId]+aerialCooldowns[tmpId])*(/**/4/**//sprite_get_number(aerialAnimations[tmpId]));
aerialMoveDistancesY[tmpId] = 8*-4;
aerialMoveDistancesX[tmpId] = 8*4;
aerialXOffsets[tmpId] = 8*8;
aerialYOffsets[tmpId] = 8*-8;
aerialWidths[tmpId] = 8*40;
aerialHeights[tmpId] = 8*30;
aerialDamageTypes[tmpId,0] = 1;								
aerialDamageModifiers[tmpId,0] = 2.8;					
aerialStaggerModifiers[tmpId,0] = 4;			
aerialKnockbacks[tmpId,0] = -2;
aerialStatusTypes[tmpId,0] = -1;
aerialStatusValues[tmpId,0] = 0;	

//aerial class ID lists
//Sword: (0)Basic (1)Slam
aerialSwordId = 0;

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
offhandUppercutSprites[tmpId] = spr_player_crossbow_uppercut_body;
offhandHoldingSprites[tmpId] = noone;
offhandAerialSprites[tmpId] = spr_player_crossbow_aerial_body;
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
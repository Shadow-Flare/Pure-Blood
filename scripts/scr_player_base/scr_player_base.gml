#region do things
phaseTimer++;
subPhaseTimer++;

	//lock On facing
if canAct
{
	if lockOnType == lockOn.hard
	{
		var facingPrev = facing;
		facing = lockOnDir;
		if facing != facingPrev scr_player_base_subPhaseDeterminer();
	}
	else if sign(moveH) != 0 facing = sign(moveH)
}

if facing == 0 facing = 1;

	//Sub states
	#region sub States

//to idle/walking/running
switch subPhase
{
	case subState.idle:
			//step code
		//no step
			//Sprite
		update_sprite(sprPlayerBodyDefaultIdle,1);
			//xSpd
		xSpd -= xSpd/3;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walking:
			//step code
		//no step (yet)
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodyDefaultWalking,newImageSpeed);
			//xSpd
		xSpd = facing*PlayerStats.moveSpeed/2;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walkingBackwards:
			//step code
		//no step (yet)
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodyDefaultWalkingBackwards,newImageSpeed);
			//xSpd
		xSpd = -facing*PlayerStats.moveSpeed/2;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.running:
			//step code
		var ind = floor(image_index)
		if (ind == 0 || ind == 4) 
		{
			if canStep {scr_step_effect(groundTypes.stone); canStep = false;}
		}
		else canStep = true;
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodyDefaultRunning,newImageSpeed);
			//xSpd
		xSpd = facing*PlayerStats.moveSpeed;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.airborne:
		if vPhase = vState.grounded
		{
			jumpNum = 0;
			glideTimer = 0;
			canGlide = true;
			subPhase = subState.landing;
			subPhaseTimer = 0;
			if moveH != 0 scr_player_base_subPhaseDeterminer();
		}
			//Sprite
		update_sprite(sprPlayerBodyDefaultAirborne,0);
		if ySpd < 0 image_index = 0;
		else image_index = 1;
			//xSpd
		if moveH != 0 && abs(xSpd) < PlayerStats.moveSpeed xSpd = clamp(xSpd+moveH*PlayerStats.moveSpeed/15,-PlayerStats.moveSpeed,PlayerStats.moveSpeed);
		else xSpd -= xSpd/16;
			//ySpd
		if vPhase = vState.jumping && (!InputManager.aInputHeld || !canAct) ySpd -= ySpd/8;
		break;
		
	case subState.landing:
		if subPhaseTimer == 1 scr_land_effect(groundTypes.stone);
		if subPhaseTimer >= round(landingDuration*room_speed)
		{
			scr_player_base_subPhaseDeterminer();
		}
		if moveH != 0 || vPhase != vState.grounded scr_player_base_subPhaseDeterminer();
			//Sprite
		update_sprite(sprPlayerBodyDefaultLanding,-landingDuration);
			//xSpd
		xSpd -= xSpd/4;
		break;
}
	
	#endregion

#endregion

#region change state
	//Use Item
	if InputManager.ltInputHeld && (InputManager.dLInputHeld || InputManager.dUInputHeld || InputManager.dRInputHeld || InputManager.dDInputHeld)
	{
		if InputManager.dLInputHeld usedItemSlotIndex = 0;
		else if InputManager.dUInputHeld usedItemSlotIndex = 1;
		else if InputManager.dRInputHeld usedItemSlotIndex = 2;
		else if InputManager.dDInputHeld usedItemSlotIndex = 3;
		
		var cache = ItemCache.equipment[? equipmentSlot.item];
		usedItemIndex = cache[| usedItemSlotIndex];
		
		if usedItemIndex != noone
		{
			scr_player_use_item(usedItemIndex);
		
			phase = state.itemUse;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
		}
	}
	//Jumping
	else if aInputQueue
	{
		reset_queue();
		if !(moveV >= 0.7 && onPlatform)
		{
			if vPhase == vState.grounded
			{
				vPhase = vState.jumping;
				ySpd = -PlayerStats.jumpPow;
				jumpNum++;
			}
			else if jumpNum < scr_player_ability_get(abilityType.movement,movementAbility.double_jump,playerAbilityStats.numberActivated)+1 && abs(ySpd) <= 2
			{
				vPhase = vState.jumping;
				ySpd = -PlayerStats.jumpPow*0.85;
				jumpNum++;
			}
		}
		else
		{
			dropThroughPlatforms = true;
			ySpd = 0.5;
		}
	}
	
	//glide
	else if InputManager.aInputHeld && scr_player_ability_get(abilityType.movement,movementAbility.glide,playerAbilityStats.numberActivated) == 1 && canGlide && canAct
	{
		var prev = ySpd;
		ySpd = min(ySpd,0);
		if prev != ySpd glideTimer++
		if glideTimer >= round(glideDuration*room_speed)
		{
			glideTimer = 0;
			canGlide = 0;
		}
	}

	//to defensive action/interaction
	else if bInputQueue && vPhase == vState.grounded
	{
		reset_queue();
		if interactionInstance == noone
		{
			if moveH == 0
			{
				phase = state.blocking;
				phaseTimer = 0;
				subPhase = subState.pre;
				subPhaseTimer = 0;
			}
			else if canMoveDefend
			{
				facing = sign(moveH);
				phase = state.dodging;
				phaseTimer = 0;
				subPhase = subState.performing;
				subPhaseTimer = 0;
			}
		}
		else
		{
			var TEMPinteractPositionCorrectX = interactionInstance.interactPositionCorrectX;
			var TEMPinteractPositionCorrectFacing = interactionInstance.interactPositionCorrectFacing;
			
			var TEMPcurrentInteractionInstance = interactionInstance;
			var TEMPinteractSprite = interactionInstance.interactSprite;
			var TEMPinteractAnimDuration = interactionInstance.interactAnimDuration;
			var TEMPinteractUseDuration = interactionInstance.interactUseDuration;
			var TEMPinteractScript = interactionInstance.interactScript;
			
			if TEMPinteractPositionCorrectX == noone || TEMPinteractPositionCorrectFacing == noone || TEMPinteractSprite == noone || TEMPinteractAnimDuration == noone || TEMPinteractUseDuration == noone //|| TEMPinteractScript == noone	//script not mandatory, the other variables are
			{
				interactionInstance.used = true;
			}
			else
			{
				isPuppet = true;
				scr_puppetCommand_add(id,puppetCommand.interact,false,false,TEMPinteractSprite,TEMPinteractAnimDuration,TEMPinteractUseDuration,TEMPinteractScript,TEMPcurrentInteractionInstance);
				scr_puppetCommand_add(id,puppetCommand.moveTo,false,false,false,TEMPinteractPositionCorrectX,TEMPinteractPositionCorrectFacing,noone,noone);
			}
		}
	}
	
	//to attacking
	else if xInputQueue
	{
		reset_queue();
		if attackHardCooldownTimer == -1
		{
			attackNum = 0;
			//initial data & tranistion
			if lockOnType != lockOn.off && distance_to_object(lockOnTarget) <= attackGroundTrackDistance facing = lockOnDir;
			else if moveH != 0 facing = sign(moveH);
			phase = state.attacking;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
			switch vPhase
			{
				case vState.grounded:
					//perform attack based on directional inputs
						//standing
					if moveH == 0 && moveV == 0
					{
						scr_player_beginAttack(attack_get_id(attackNum,vState.grounded));
						vChangeBreak = true;
					}
					else if abs(moveV) >= abs(moveH)
					{	
						//Upwards
						if sign(moveV) == -1 
						{
							scr_player_beginAttack(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.uniqueAttack));
							vChangeBreak = false;
						}
						//Downwards
						else 
						{
							scr_player_beginAttack(class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.downwards));
							vChangeBreak = true;
						}
					}
					else
					{
						//Forwards/horizontal
						if lockOnType != lockOn.hard || sign(moveH) == lockOnDir
						{
							scr_player_beginAttack(class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.forwards));
							vChangeBreak = true;
						}
						//Backwards
						else
						{
							scr_player_beginAttack(class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.backwards));
							vChangeBreak = false;
						}
					}
					break;
				case vState.midAir:
				case vState.jumping:
					vPhase = vState.midAir;
					scr_player_beginAttack(attack_get_id(attackNum,vState.midAir));
					if lockOnType != lockOn.off && abs(lockOnTarget.x-x) <= attackTrackXDistance && abs(lockOnTarget.y-y) <= attackTrackYDistance
					{
						var dirToPlayer = sign(x-lockOnTarget.x);
						var enemyBBoxWidth = lockOnTarget.bbox_right-lockOnTarget.bbox_left;
						aerialTargetX = lockOnTarget.x+dirToPlayer*(enemyBBoxWidth/2+10);
						aerialTargetY = lockOnTarget.y;
					}
					else
					{
						aerialTargetX = -4;
						aerialTargetY = -4;	
					}
					if aerialTargetX == -4 && aerialTargetY == -4 ySpd = aerialAttackVertBoost;
					else facing = lockOnDir;
					break;
			}
		}
	}
	
	//to Offhand
	else if yInputQueue && offhandHardCooldownTimer == -1
	{
		offhandCooldownTimer = 0; //switch on
		phase = state.offhand;
		phaseTimer = 0;
		subPhase = subState.pre;
		subPhaseTimer = 0;
		reset_queue();
	}
	
	//to Ability
	else if InputManager.rbInput && can_use_ability() && canAct
	{
		if !GameManager.thereisnospoon with statCache mp = clamp(mp-activeAbility_get_stat(currentOffhandActivatableID,activeAbilityStats.manaCost),0,mpMax);
		phase = state.ability;
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
#endregion
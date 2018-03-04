#region do things
phaseTimer++;
subPhaseTimer++;

	//lock On facing
if lockOnType = lockOn.hard
{
	facing = lockOnDir
}
else if sign(moveH) != 0 facing = sign(moveH)

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
			scr_land_effect(groundTypes.stone);
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
	//Jumping
	if aInputQueue
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
		else dropThroughPlatforms = true;
	}
	
	//glide
	if InputManager.aInputHeld && scr_player_ability_get(abilityType.movement,movementAbility.glide,playerAbilityStats.numberActivated) == 1 && canGlide && canAct
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

	//to blocking/interaction
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
				phased = 1;
				phase = state.dodging;
				phaseTimer = 0;
				subPhase = subState.performing;
				subPhaseTimer = 0;
			}
		}
		else
		{
			interactionInstance.used = true;
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
					scr_player_beginAttack(attack_get_id(attackNum,vState.midAir));
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
	
	////to Ability
	//else if InputManager.rbInput && can_use_ability() && canAct
	//{
	//	phase = state.ability;
	//	phaseTimer = 0;
	//	subPhase = subState.none;
	//	subPhaseTimer = 0;
	//}
#endregion
//get needed data
var IE = instance_exists(inputManager)
if IE var moveH = inputManager.moveInputH;
else var moveH = 0;
if IE var moveV = inputManager.moveInputV;
else var moveV = 0;
if IE && inputManager.xInput xInputQueue = 1;
if IE && inputManager.yInput yInputQueue = 1;
if IE && inputManager.aInput aInputQueue = 1;
if IE && inputManager.bInput bInputQueue = 1;

#region do things
phaseTimer++;
subPhaseTimer++;

	//lock On facing
if hardLockOn
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
			//Sprite
		update_sprite(sprPlayerBodySwordIdle,1);
			//xSpd
		xSpd -= xSpd/4;
			//ySpd
		ySpd += global.g;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walking:
			//Sprite
		var newImageSpeed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		update_sprite(sprPlayerBodySwordWalking,newImageSpeed);
			//xSpd
		xSpd = facing*moveSpeed/2;
			//ySpd
		ySpd += global.g;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walkingBackwards:
			//Sprite
		var newImageSpeed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		update_sprite(sprPlayerBodySwordWalkingBackwards,newImageSpeed);
			//xSpd
		xSpd = -facing*moveSpeed/2;
			//ySpd
		ySpd += global.g;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.running:
			//Sprite
		var newImageSpeed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		update_sprite(sprPlayerBodySwordRunning,newImageSpeed);
			//xSpd
		xSpd = facing*moveSpeed;
			//ySpd
		ySpd += global.g;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.airborne:
		if vPhase = vState.grounded
		{
			jumpNum = 0;
			subPhase = subState.landing;
			subPhaseTimer = 0;
			if moveH != 0 scr_player_base_subPhaseDeterminer();
		}
			//Sprite
		update_sprite(sprPlayerBodySwordAirborne,0);
		if ySpd < 0 image_index = 0;
		else image_index = 1;
			//xSpd
		if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed,moveSpeed);
		else xSpd -= xSpd/20;
			//ySpd
		if vPhase = vState.jumping && !inputManager.aInputHeld ySpd -= ySpd/8;
		if ySpd < maxFallSpeed ySpd+=global.g;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
		
	case subState.landing:
		if subPhaseTimer >= round(landingDuration*room_speed)
		{
			scr_player_base_subPhaseDeterminer();
		}
		if moveH != 0 || vPhase != vState.grounded scr_player_base_subPhaseDeterminer();
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordLanding)/landingDuration;
		update_sprite(sprPlayerBodySwordLanding,newImageSpeed);
			//xSpd
		xSpd -= xSpd/4;
			//ySpd
		ySpd += global.g;
		break;
}
	
#endregion

#endregion

#region change state
	//to hit reactions
		//not done yet

	//to dying
	if hp <= 0
	{
		phase = state.dying;
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
	
	//Jumping
	else if aInputQueue
	{
		reset_queue();
		if vPhase == vState.grounded
		{
			vPhase = vState.jumping;
			ySpd = -jumpPow;
			jumpNum++;
		}
	}

	//to blocking
	else if bInputQueue && vPhase == vState.grounded
	{
		reset_queue();
		if moveH == 0
		{
			phase = state.blocking;
			phaseTimer = 0;
			subPhase = subState.pre;
			subPhaseTimer = 0;
		}
		else
		{
			phase = state.dodging;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
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
			phase = state.attacking;
			phaseTimer = 0;
			subPhase = subState.performing;
			subPhaseTimer = 0;
			switch vPhase
			{
				case vState.grounded:
					//perform attack based on directional inputs
						//standing
					if moveH == 0 && moveV == 0 scr_player_combo();
					else if abs(moveV) >= abs(moveH)
					{	
						//Upwards
						if sign(moveV) == -1 scr_player_combo_ext(obj_comboCache.activeUpwardsId);
						//Downwards
						else scr_player_combo_ext(obj_comboCache.activeDownwardsId);
					}
					else
					{
						//Forwards/horizontal
						if !hardLockOn || sign(moveH) == lockOnDir scr_player_combo_ext(obj_comboCache.activeForwardsId);
						//Backwards
						else scr_player_combo_ext(obj_comboCache.activeBackwardsId);
					}
					break;
				case vState.midAir:
				case vState.jumping:
					if lockOnTarget != noone && distance_to_object(lockOnTarget) <= aerialTrackDistance
					{
						aerialTargetX = lockOnTarget.x;
						aerialTargetY = lockOnTarget.y;
					}
					else
					{
						aerialTargetX = -4;
						aerialTargetY = -4;	
					}
					var aerialAttackId = obj_comboCache.activeAerialID // + 0
					scr_player_combo_ext(aerialAttackId);
					if aerialTargetX == -4 && aerialTargetY == -4 ySpd = aerialAttackVertBoost;
					else facing = lockOnDir;
					break;
			}
		}
	}
	
	//to Offhand
	else if IE && inputManager.yInput
	{
		phase = state.offhand;
		phaseTimer = 0;
		subPhase = subState.pre;
		subPhaseTimer = 0;
		reset_queue();
	}
	
	//to Ability
	else if IE && inputManager.rbInput && can_use_ability()
	{
		phase = state.ability;
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
#endregion

	//addional properties
image_xscale = facing;
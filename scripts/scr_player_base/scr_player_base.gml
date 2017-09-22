//get needed data
var IE = instance_exists(obj_inputManager)
if IE var moveH = obj_inputManager.moveInputH;
else var moveH = 0;
if IE var moveV = obj_inputManager.moveInputV;
else var moveV = 0;

#region do things

	//lock On facing
if hardLockOn
{
	facing = lockOnDir
}
if facing == 0 facing = 1;

	//properties
image_xscale = facing;
#region properties by subPhase

switch subPhase
{
	case subState.idle:
		if sprite_index != spr_player_idle_body
		{
			sprite_index = spr_player_idle_body;
			image_index = 0
			image_speed = 1;
		}
		xSpd -= xSpd/4;
		ySpd += global.g;
		break;
				
	case subState.walking:
		if sprite_index != spr_player_walking_body
		{
			sprite_index = spr_player_walking_body;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
		xSpd = facing*moveSpeed/2;
		ySpd += global.g;
		break;
		
	case subState.walkingBackwards:
		if sprite_index != spr_player_walkingBackwards_body
		{
			sprite_index = spr_player_walkingBackwards_body;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
		xSpd = -facing*moveSpeed/2;
		ySpd += global.g;
		break;
		
	case subState.running:
		if sprite_index != spr_player_run_body
		{
			sprite_index = spr_player_run_body;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
		xSpd = facing*moveSpeed;
		ySpd += global.g;
		break;
		
	case subState.airborne:
		if sprite_index != spr_player_airborne_body
		{
			sprite_index = spr_player_airborne_body;
			image_index = 0
			image_speed = 1;
		}
			//xSPd
		if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed,moveSpeed);
		else xSpd -= xSpd/20;
			//ySpd
		if ySpd < maxFallSpeed ySpd+=global.g;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
		
	case subState.landing:
		if sprite_index != spr_player_landing_body
		{
			sprite_index = spr_player_landing_body;
			image_index = 0
			image_speed = sprite_get_number(sprite_index)/landingDuration;
		}
		xSpd -= xSpd/4;
		ySpd += global.g;
		break;
}

#endregion

#endregion

#region sub States

//to idle/walking/running
switch subPhase
{
	case subState.idle:
	case subState.walking:
	case subState.walkingBackwards:
	case subState.running:
		scr_player_base_subPhaseDeterminer();
		break;
	case subState.airborne:
		if vPhase = vState.grounded
		{
			subPhase = subState.landing;
		}
		break;
	case subState.landing:
		phaseTimer++;
		if phaseTimer >= round(landingDuration*room_speed)
		{
			scr_player_base_subPhaseDeterminer();
		}
		break;
}
	
#endregion

#region change state	
	//to hit reactions
		//not done yet

	//to dying
	if hp <= 0
	{
		phase = state.dying;
		subPhase = subState.none;
		phaseTimer = 0;
	}
	
	//Jumping
	else if (IE && obj_inputManager.aInput) && vPhase == vState.grounded
	{
		ySpd = -jumpPow;
		jumpNum++;
	}

	//to blocking
	else if (IE && obj_inputManager.bInput) && vPhase == vState.grounded
	{
		if moveH == 0
		{
			phase = state.blocking;
			subPhase = subState.none;
			phaseTimer = 0;
		}
		else
		{
			phase = state.dodging;
			subPhase = subState.none;
			phaseTimer = 0;
		}
	}
	
	//to attacking
	else if IE && obj_inputManager.xInput
	{
		attackNum = 1;
		phaseTimer = 0;
		xInputQueue = 0;
		yInputQueue = 0;
		bInputQueue = 0;
		switch vPhase
		{
			case vState.grounded:
				//initial data & tranistion
				phase = state.attacking;
				subPhase = subState.performing;
				//perform attack based on directional inputs
					//standing
				if moveH == 0 && moveV == 0 scr_player_combo();
				else if moveV >= moveH
				{	
					//Upwards
					if sign(moveV) == -1 scr_player_combo_ext(1);
					//Downwards
					else scr_player_combo_ext(2);
				}
				else if moveH >= moveV
				{
					//Forwards/horizontal
					if !hardLockOn || sign(moveH) == lockOnDir scr_player_combo_ext(3);
					//Backwards
					else scr_player_combo_ext(4);
				}
				break;
			case vState.midAir:
				phase = state.aerialAttacking;
				subPhase = subState.performing;
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
				scr_player_aerial(0);
				ySpd = -4;
				break;
		}
	}
	
	//to Offhand
	else if IE && obj_inputManager.yInput
	{
		phase = state.offhand;
		subPhase = subState.none;
		phaseTimer = 0;
	}
	
	//to Ability
	else if IE && obj_inputManager.rbInput
	{
		phase = state.ability;
		subPhase = subState.none;
		phaseTimer = 0;
	}
#endregion
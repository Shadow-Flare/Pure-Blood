//get needed data
var IE = instance_exists(obj_inputManager)
if IE var moveH = obj_inputManager.moveInputH;
else var moveH = 0;
if IE var moveV = obj_inputManager.moveInputV;
else var moveV = 0;

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

	//determine sub states
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
			subPhaseTimer = 0;
			if moveH != 0 || vPhase == vState.midAir scr_player_base_subPhaseDeterminer();
		}
		break;
	case subState.landing:
		if subPhaseTimer >= round(landingDuration*room_speed)
		{
			scr_player_base_subPhaseDeterminer();
		}
		if moveH != 0 || vPhase == vState.midAir scr_player_base_subPhaseDeterminer();
		break;
}
	
#endregion

	//properties
image_xscale = facing;
#region properties by subPhase

switch subPhase
{
	case subState.idle:
			//Sprite
		if sprite_index != spr_player_idle_body
		{
			sprite_index = spr_player_idle_body;
			weaponSpriteIndex = spr_player_idle_weapon;
			image_index = 0
			image_speed = 1;
		}
			//xSpd
		xSpd -= xSpd/4;
			//ySpd
		ySpd += global.g;
		break;
				
	case subState.walking:
			//Sprite
		if sprite_index != spr_player_walking_body
		{
			sprite_index = spr_player_walking_body;
			weaponSpriteIndex = spr_player_walking_weapon;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
			//xSpd
		xSpd = facing*moveSpeed/2;
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.walkingBackwards:
			//Sprite
		if sprite_index != spr_player_walkingBackwards_body
		{
			sprite_index = spr_player_walkingBackwards_body;
			weaponSpriteIndex = spr_player_walkingBackwards_weapon;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
			//xSpd
		xSpd = -facing*moveSpeed/2;
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.running:
			//Sprite
		if sprite_index != spr_player_run_body
		{
			sprite_index = spr_player_run_body;
			weaponSpriteIndex = spr_player_run_weapon;
			image_index = 0
			image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
		}
			//xSpd
		xSpd = facing*moveSpeed;
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.airborne:
			//Sprite
		if sprite_index != spr_player_airborne_body
		{
			weaponSpriteIndex = spr_player_airborne_weapon;
			sprite_index = spr_player_airborne_body;
			image_speed = 0;
		}
		if ySpd < 0 image_index = 0;
		else image_index = 1;
			//xSPd
		if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed,moveSpeed);
		else xSpd -= xSpd/20;
			//ySpd
		if ySpd < maxFallSpeed ySpd+=global.g;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		break;
		
	case subState.landing:
			//Sprite
		if sprite_index != spr_player_landing_body
		{
			sprite_index = spr_player_landing_body;
			weaponSpriteIndex = spr_player_landing_weapon;
			image_index = 0
			image_speed = sprite_get_number(sprite_index)/landingDuration;
		}
			//xSpd
		xSpd -= xSpd/4;
			//ySpd
		ySpd += global.g;
		break;
}
effectSpriteIndex = noone;

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
			phaseTimer = 0;
			subPhase = subState.none;
			subPhaseTimer = 0;
		}
		else
		{
			phase = state.dodging;
			phaseTimer = 0;
			subPhase = subState.none;
			subPhaseTimer = 0;
		}
	}
	
	//to attacking
	else if IE && obj_inputManager.xInput
	{
		attackNum = 0;
		aInputQueue = 0;
		xInputQueue = 0;
		yInputQueue = 0;
		bInputQueue = 0;
		switch vPhase
		{
			case vState.grounded:
				//initial data & tranistion
				phase = state.attacking;
				phaseTimer = 0;
				subPhase = subState.performing;
				subPhaseTimer = 0;
				//perform attack based on directional inputs
					//standing
				if moveH == 0 && moveV == 0 scr_player_combo();
				else if abs(moveV) >= abs(moveH)
				{	
					//Upwards
					if sign(moveV) == -1 scr_player_combo_ext(1);
					//Downwards
					else scr_player_combo_ext(2);
				}
				else
				{
					//Forwards/horizontal
					if !hardLockOn || sign(moveH) == lockOnDir scr_player_combo_ext(3);
					//Backwards
					else scr_player_combo_ext(4);
				}
				break;
			case vState.midAir:
				phase = state.aerialAttacking;
				phaseTimer = 0;
				subPhase = subState.performing;
				subPhaseTimer = 0;
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
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
	
	//to Ability
	else if IE && obj_inputManager.rbInput
	{
		phase = state.ability;
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
#endregion
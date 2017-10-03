//get needed data
var IE = instance_exists(InputManager)
if IE var moveH = InputManager.moveInputH;
else var moveH = 0;
if IE var moveV = InputManager.moveInputV;
else var moveV = 0;
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

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
			//Sprite
		update_sprite(sprPlayerBodySwordIdle,1);
			//xSpd
		xSpd -= xSpd/4;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walking:
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodySwordWalking,newImageSpeed);
			//xSpd
		xSpd = facing*PlayerStats.moveSpeed/2;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.walkingBackwards:
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodySwordWalkingBackwards,newImageSpeed);
			//xSpd
		xSpd = -facing*PlayerStats.moveSpeed/2;
		scr_player_base_subPhaseDeterminer();
		break;
		
	case subState.running:
			//Sprite
		var newImageSpeed = (PlayerStats.moveSpeed/PlayerStats.defaultMoveSpeed);
		update_sprite(sprPlayerBodySwordRunning,newImageSpeed);
			//xSpd
		xSpd = facing*PlayerStats.moveSpeed;
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
		if moveH != 0 xSpd = clamp(xSpd+moveH*PlayerStats.moveSpeed/15,-PlayerStats.moveSpeed,PlayerStats.moveSpeed);
		else xSpd -= xSpd/20;
			//ySpd
		if vPhase = vState.jumping && !InputManager.aInputHeld ySpd -= ySpd/8;
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
		break;
}
	
#endregion

#endregion

#region change state
	//to hit reactions
		//not done yet
	
	//Jumping
	if aInputQueue
	{
		reset_queue();
		if vPhase == vState.grounded
		{
			vPhase = vState.jumping;
			ySpd = -PlayerStats.jumpPow;
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
			if !place_meeting(x+dodgeDistance,y,obj_actor_parent) phased = 1;
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
			if lockOnType != lockOn.off && distance_to_object(lockOnTarget) <= attackTrackDistance facing = lockOnDir;
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
					if moveH == 0 && moveV == 0 scr_player_combo(PlayerStats.activeComboIDs[attackNum]);
					else if abs(moveV) >= abs(moveH)
					{	
						//Upwards
						if sign(moveV) == -1 scr_player_combo(PlayerStats.activeUpwardsID);
						//Downwards
						else scr_player_combo(PlayerStats.activeDownwardsID);
					}
					else
					{
						//Forwards/horizontal
						if lockOnType != lockOn.hard || sign(moveH) == lockOnDir
						{
							if !place_meeting(x+ComboCache.attackMoveDistancesX[? PlayerStats.activeForwardsID],y,obj_actor_parent) phased = 1;
							scr_player_combo(PlayerStats.activeForwardsID);
						}
						//Backwards
						else scr_player_combo(PlayerStats.activeBackwardsID);
					}
					break;
				case vState.midAir:
				case vState.jumping:
					if lockOnType != lockOn.off && distance_to_object(lockOnTarget) <= attackTrackDistance 
					{
						aerialTargetX = lockOnTarget.x;
						aerialTargetY = lockOnTarget.y;
					}
					else
					{
						aerialTargetX = -4;
						aerialTargetY = -4;	
					}
					scr_player_combo(PlayerStats.activeAerialComboIDs[attackNum]);
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
	else if IE && InputManager.rbInput && can_use_ability()
	{
		phase = state.ability;
		phaseTimer = 0;
		subPhase = subState.none;
		subPhaseTimer = 0;
	}
#endregion

	//addional properties
image_xscale = facing;
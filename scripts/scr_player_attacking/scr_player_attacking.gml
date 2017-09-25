//get needed data
var IE = instance_exists(inputManager)
if IE && inputManager.xInput xInputQueue = 1;
if IE && inputManager.yInput yInputQueue = 1;
if IE && inputManager.aInput aInputQueue = 1;
if IE && inputManager.bInput bInputQueue = 1;

#region do things
phaseTimer++;
subPhaseTimer++;

	//properties
if comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimation == sprPlayerBodySwordSlice 
{
	attackAnimation = sprPlayerBodySwordSlice2;
}
else if comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimation == sprPlayerBodySwordAerialSlash
{
	attackAnimation = sprPlayerBodySwordAerialSlash2;
}
var newImageSpeed = sprite_get_number(attackAnimation)/(attackDuration+attackCooldown)
update_sprite(attackAnimation,newImageSpeed);

switch vPhase
{
	case vState.grounded:
			//xspd
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
		}
		else xSpd -= xSpd/4;
			//ySpd
		ySpd += global.g;
		break;

	case vState.jumping:
	case vState.midAir:
			//xspd
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			if aerialTargetX != -4 && aerialTargetY != -4 xSpd = (aerialTargetX-x)/8;
			else xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
		}
		else xSpd -= xSpd/4;
			//ySpd
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			if aerialTargetX != -4 && aerialTargetY != -4 ySpd = (aerialTargetY-y)/8;
			else ySpd = attackMoveDistanceY/((attackMoveDuration)*room_speed);
		}
		else ySpd += global.g/4;
		break;
}

#endregion

#region change states & substates
	switch subPhase
	{
		case subState.performing:
			if subPhaseTimer >= round(attackDuration*room_speed)
			{
				subPhase = subState.post;
				subPhaseTimer = 0;
			}
			break;
		case subState.post:
			switch vPhase
			{
				case vState.grounded:
					#region ground attack
						//keep attacking? (ground combo)
					if xInputQueue && attackNum != comboSize-1 && effect.hasHit
					{
						with obj_player_attack_effect instance_destroy();
						attackNum++;
						reset_queue();
						scr_player_combo();
						phaseTimer = 0;							//reset for properties
						subPhase = subState.performing;
						subPhaseTimer = 0;
					}
						//perform uppercut? (mid ground combo using weapon)
					else if yInputQueue && attackNum < comboSize-2 && effect.hasHit
					{
						with obj_player_attack_effect instance_destroy();
						attackNum++;
						reset_queue();
						scr_player_combo_uppercut();
						phaseTimer = 0;							//reset for properties
						subPhase = subState.performing;
						subPhaseTimer = 0;
					}
						//jump? (mid ground combo/subsequent jump)
					else if aInputQueue
					{
						with obj_player_attack_effect instance_destroy();		
						ySpd = -jumpPow;
						jumpNum++;
						phase = state.base;
						phaseTimer = 0;
						attackNum = 0;
						scr_player_base_subPhaseDeterminer();
					}
						//end
					else if subPhaseTimer >= round(attackCooldown*room_speed)
					{
						with obj_player_attack_effect instance_destroy();
						phase = state.base;
						phaseTimer = 0;
						if attackName != "Uppercut" attackHardCooldownTimer = 0; //switch on
						attackName = noone;
						attackNum = 0;
						scr_player_base_subPhaseDeterminer();
					}
					#endregion
					break;
			
				case vState.jumping:
				case vState.midAir:
					#region air attack
					if xInputQueue && attackNum != aerialComboSize-1 && effect.hasHit
					{
						with obj_player_attack_effect instance_destroy();
						if lockOnTarget != noone && distance_to_object(lockOnTarget) <= aerialTrackDistance && lockOnTarget.phase != "dying" //this will get changed as enemy code gets changed
						{
							aerialTargetX = lockOnTarget.x;
							aerialTargetY = lockOnTarget.y;
						}
						else
						{
							aerialTargetX = -4;
							aerialTargetY = -4;	
						}
						attackNum++;
						aInputQueue = 0;
						xInputQueue = 0;
						yInputQueue = 0;
						bInputQueue = 0;
						if attackNum == aerialComboSize-1 var aerialAttackId = obj_comboCache.activeAerialID + 1; // + 0
						else var aerialAttackId = obj_comboCache.activeAerialID;
						scr_player_combo_ext(aerialAttackId);
						phaseTimer = 0;							//reset for properties
						subPhase = subState.performing;
						subPhaseTimer = 0;
						if aerialTargetX == -4 && aerialTargetY == -4 ySpd = aerialAttackVertBoost;
						else facing = lockOnDir
					}
						//end
					else if subPhaseTimer >= round(attackCooldown*room_speed)
					{
						with obj_player_attack_effect instance_destroy();
						phase = state.base;
						phaseTimer = 0;
						attackName = noone;
						attackNum = 0;
						attackHardCooldownTimer = 0; //switch on
						if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) vPhase = vState.grounded;
						scr_player_base_subPhaseDeterminer();
					}
					#endregion
					break;
			}
			break;
	}
#endregion

	//addional properties
image_xscale = facing;
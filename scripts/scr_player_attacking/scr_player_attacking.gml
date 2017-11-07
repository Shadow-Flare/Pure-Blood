//get needed data
if InputManager.xInput xInputQueue = 1;
if InputManager.yInput yInputQueue = 1;
if InputManager.aInput aInputQueue = 1;
if InputManager.bInput bInputQueue = 1;

#region do things
phaseTimer++;
subPhaseTimer++;
	
	//get combo size data
var wepClass = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type);
var groundComboSize = PlayerStats.GCS[? wepClass];
var groundFinisherSize = PlayerStats.GFS[? wepClass];
var aerialComboSize = PlayerStats.ACS[? wepClass];
var aerialFinisherSize = PlayerStats.AFS[? wepClass];

	//sprite
		//check if alt, if it is use alternative sprite
var comboType = noone
switch vPhase
{
	case vState.grounded:
		comboType = weaponClassStats.groundComboDefault;
		break;
	case vState.jumping:
	case vState.midAir:
		comboType = weaponClassStats.aerialComboDefault;
		break;
}
var compareID = class_get_stat(wepClass,comboType);
if vPhase = vState.grounded var comboSizeToCheck = groundComboSize;
else comboSizeToCheck = aerialComboSize;
var animToUse = attackAnimation;
if attackID == compareID && comboSizeToCheck%2 == attackNum%2 && attackNum < comboSizeToCheck
{
	animToUse = asset_get_index(sprite_get_name(animToUse)+"Alt");
}
		//update sprite
update_sprite(animToUse,-(attackDuration+attackCooldown));

	//attack Effect
for(var i = 0; i < ds_list_size(ComboCache.attackHitStarts[? attackID]); i++)
{
	if phaseTimer == round(ds_list_find_value(ComboCache.attackHitStarts[? attackID], i)*room_speed)
	{
		scr_player_createAttackEffect(attackID,i,true);
	}
}

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
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			ySpd = attackMoveDistanceY/((attackMoveDuration)*room_speed);
		}
		break;

	case vState.jumping:
	case vState.midAir:
			//xspd
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			if aerialTargetX != -4
			{
				xSpd = (aerialTargetX-x)/8;
			}
			else xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
		}
		else xSpd -= xSpd/4;
			//ySpd
		if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
		{
			if aerialTargetY != -4 
			{
				ySpd = (aerialTargetY-y)/8;
			}
			else ySpd = attackMoveDistanceY/((attackMoveDuration)*room_speed);
		}
		else
		{
			ySpd -= GameManager.grav*(3/4); //1/4 G
			ySpd = clamp(ySpd,-aerialYSpdCap,aerialYSpdCap);
		}
		break;
}

#endregion

#region change states & substates
	if lastVState != vPhase
	{
		aerialTargetX = -4;
		aerialTargetY = -4;	
		hasDeflected = false;
		phased = 0;
		//with objPlayerAttackEffect instance_destroy();
		phase = state.base;
		phaseTimer = 0;
		attackNum = -1;
		scr_player_base_subPhaseDeterminer();
	}
	else
	{
					//get deflected
		if hasDeflected
		{
			hasDeflected = false;
			phase = state.hitReaction;
			phaseTimer = 0;
			subPhase = subState.deflected;
			subPhaseTimer = 0;
		}
		else switch subPhase
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
						if xInputQueue && attackNum+1 != groundComboSize+groundFinisherSize
						{
							switch lockOnType
							{
								case lockOn.soft: if distance_to_object(lockOnTarget) <= attackGroundTrackDistance facing = lockOnDir; break;
								case lockOn.hard: facing = lockOnDir; break;							
							}
							phased = 0;
							//with objPlayerAttackEffect instance_destroy();
							attackNum++;
							reset_queue();
							scr_player_beginAttack(attack_get_id(attackNum,vState.grounded));
							phaseTimer = 0;							//reset for properties
							subPhase = subState.performing;
							subPhaseTimer = 0;
						}
							//perform uppercut? (mid ground combo using weapon)
						else if yInputQueue && attackNum+1 < groundComboSize+groundFinisherSize-1
						{
							switch lockOnType
							{
								case lockOn.soft: if distance_to_object(lockOnTarget) <= attackGroundTrackDistance facing = lockOnDir; break;
								case lockOn.hard: facing = lockOnDir; break;							
							}
							phased = 0;
							//with objPlayerAttackEffect instance_destroy();
							attackNum++;
							reset_queue();
							scr_player_beginAttack(-1);
							phaseTimer = 0;							//reset for properties
							subPhase = subState.performing;
							subPhaseTimer = 0;
						}
							//jump? (mid ground combo/subsequent jump)
						else if aInputQueue
						{
							phased = 0;
							//with objPlayerAttackEffect instance_destroy();		
							ySpd = -PlayerStats.jumpPow;
							jumpNum++;
							phase = state.base;
							phaseTimer = 0;
							attackNum = -1;
							scr_player_base_subPhaseDeterminer();
						}
							//end
						else if subPhaseTimer >= round(attackCooldown*room_speed)
						{							
							aerialTargetX = -4;
							aerialTargetY = -4;	
							hasDeflected = false;
							phased = 0;
							//with objPlayerAttackEffect instance_destroy();
							phase = state.base;
							phaseTimer = 0;
							if attackName != "Uppercut" attackHardCooldownTimer = 0; //switch on
							attackName = noone;
							attackNum = -1;
							scr_player_base_subPhaseDeterminer();
						}
						#endregion
						break;
			
					case vState.jumping:
					case vState.midAir:
						#region air attack
							//keep aerial attacking?
						if xInputQueue && attackNum+1 != aerialComboSize+aerialFinisherSize //&& effect.hasHit
						{
							//with objPlayerAttackEffect instance_destroy();
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
							attackNum++;
							aInputQueue = 0;
							xInputQueue = 0;
							yInputQueue = 0;
							bInputQueue = 0;
							scr_player_beginAttack(attack_get_id(attackNum,vState.midAir));
							phaseTimer = 0;							//reset for properties
							subPhase = subState.performing;
							subPhaseTimer = 0;
							if aerialTargetX == -4 && aerialTargetY == -4 ySpd = aerialAttackVertBoost;
							else facing = lockOnDir
						}
							//end
						else if subPhaseTimer >= round(attackCooldown*room_speed)
						{
							hasDeflected = false;
							//with objPlayerAttackEffect instance_destroy();
							aerialTargetX = -4;
							aerialTargetY = -4;	
							phase = state.base;
							phaseTimer = 0;
							attackName = noone;
							attackNum = -1;
							attackHardCooldownTimer = 0; //switch on
							if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) vPhase = vState.grounded;
							scr_player_base_subPhaseDeterminer();
						}
						#endregion
						break;
				}
				break;
		}
	}
#endregion
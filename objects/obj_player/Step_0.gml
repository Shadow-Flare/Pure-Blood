//Initialize enums (MOVE TO CONTROLLER CREATE)
enum state {base, attacking, offhand, ability, dying, blocking, dodging};
enum vState {grounded, midAir, jumping};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, blocking, reaction};

//Initials
IE = instance_exists(inputManager)

#region lock-ons
//soft lockon
if (softLockOn||hardLockOn) && !instance_exists(lockOnTarget)
{
	softLockOn = 0;
	hardLockOn = 0;
	lockOnTarget = noone;
}

if IE
{
	if inputManager.rsInput && softLockOn {softLockOn = 0 hardLockOn = 1;}
	else if inputManager.rsInput && hardLockOn {hardLockOn = 0;}
}

if !hardLockOn
{
	var minDist = -1;
	lockOnTarget = noone;
	for (var i = 0; i < instance_number(obj_enemy_parent); i++)
	{
		var posTarget = instance_find(obj_enemy_parent,i);
		var tmpDist = distance_to_object(posTarget)
		if (tmpDist < minDist || minDist == -1) && tmpDist < softLockRange && posTarget.phase != "dying"
		{
			minDist = tmpDist;
			lockOnTarget = posTarget;
		}
	}
	if minDist != -1 softLockOn = 1;
	else softLockOn = 0;
}
else
{
	if distance_to_object(lockOnTarget) > hardLockRange || lockOnTarget.phase == "dying"
	{
		lockOnTarget = noone;
		hardLockOn = 0;
	}
}

if hardLockOn || softLockOn
{
	lockOnDir = sign(lockOnTarget.x-x);
	if lockOnDir == 0 lockOnDir = 1;
}

if gamepad_is_connected(0)
{
	//target switch
	if hardLockOn
	{
		if IE
		{
			var h = inputManager.targetInputH;
			var v = inputManager.targetInputV;
		}
		else
		{
			h = 0;
			v = 0;
		}
		if canChangeTarget && !(h==0&&v==0)
		{
			var minDist = -1;
			if h <= 0 && abs(h)>=abs(v) {var maxAngle = 225; var minAngle = 135;}
			else if h > 0 && abs(h)>=abs(v) {var maxAngle = 45; var minAngle = 315;}
			else if v < 0 && abs(v)>=abs(h) {var maxAngle = 135; var minAngle = 45;}
			else if v >= 0 && abs(v)>= abs(h) {var maxAngle = 315; var minAngle = 225;}
			with obj_enemy_parent
			{
				var searchAngle = point_direction(other.lockOnTarget.x,other.lockOnTarget.y,x,y)
				if other.lockOnTarget != id && ((searchAngle > minAngle && searchAngle < maxAngle)||(minAngle == 315 && (searchAngle < 45 || minAngle > 315))) && (distance_to_object(other.lockOnTarget)<minDist||minDist==-1) && distance_to_object(other) < other.hardLockRange
				{
					minDist = distance_to_object(other.lockOnTarget);
					other.potentialId = id;
				}
			}
			if minDist != -1
			{
				lockOnTarget = potentialId;
				canChangeTarget = 0;
			}
		}
	}
	if !canChangeTarget
	{
		if !IE || (inputManager.targetInput==0&&inputManager.targetInputV==0) canChangeTarget = 1;
	}
}
else
{
	if hardLockOn && IE && inputManager.keyboardTargetChangeInput
	{
		var stopIt = 0;
		if !variable_instance_exists(id,"targetList") targetList = [];
		with obj_enemy_parent
		{
			if distance_to_object(other) <= other.hardLockRange
			{
				for (var i = 0; i < array_length_1d(other.targetList); i++)
				{
					if other.targetList[i] == id
					{
						if id == other.lockOnTarget other.lockOnIndex = i
						stopIt = 1;
					}
				}
				if !stopIt
				{
					var newIndex = array_length_1d(other.targetList);
					other.targetList[newIndex] = id;		
					if id == other.lockOnTarget other.lockOnIndex = newIndex;
				}
			}
		}
		lockOnIndex++;
		if lockOnIndex >= array_length_1d(other.targetList)lockOnIndex = 0;
		lockOnTarget = targetList[lockOnIndex]
	}
}
#endregion

#region passives
//this section will change somewhat to reflect the 
//needed code. Though at times multiple passive
//codes may be needed.

	//targets (only ropeshot atm, stuff will probably be added)
ropeShotTarget = noone;
switch obj_comboCache.activeOffhandActivatableID
{
		//rope shot
	case 0:
		var nearestRopeShotTarget = instance_nearest(x,y,obj_grapple_parent);
		if distance_to_object(nearestRopeShotTarget) <= ropeShotTargetRange	ropeShotTarget = nearestRopeShotTarget;
		break
}

if attackHardCooldownTimer != -1
{
	attackHardCooldownTimer++
	if attackHardCooldownTimer >= round(attackHardCooldown*room_speed)
	{
		attackHardCooldownTimer = -1; //switch off
	}
}

#endregion

#region State mechanisms
switch vPhase
{
	case vState.grounded:
		if !(place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) && phase != state.attacking vPhase = vState.midAir;
		break;
	case vState.midAir:
		if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) && phase != state.attacking vPhase = vState.grounded;
		break;
	case vState.jumping:
		if (place_meeting(x,y+1,obj_block_parent)&&!place_meeting(x,y,obj_block_parent)) vPhase = vState.grounded;
		if ySpd >= 0 vPhase = vState.midAir;
		break;
}

switch phase
{
	case state.base:
		scr_player_base();
		break;
	case state.attacking:
		scr_player_attacking();
		break;
	case state.offhand:
		scr_player_offhand();
		break;
	case state.blocking:
		scr_player_blocking();
		break;
	case state.dodging:
		scr_player_dodging();
		break;
	case state.ability:
		scr_player_ability();
		break;
}
#endregion

scr_move_with_collisions();

#region old stuff
if global.g = "im a nerd" //just so i can utilize the #regions
{
#region step startup
//on ground check
onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent))) && place_free(x,y);
	#region prev
onGroundPrev = onGround;
phasePrev = phase;
xPrev = x;
yPrev = y;
xSpdPrev = xSpd;
ySpdPrev = ySpd;
	#endregion
	#region HP & MP regen/clamp
mp += 0.5/room_speed;
hp += 0.15/room_speed;
mp = clamp(mp,0,global.mpMax);
hp = clamp(hp,0,global.hpMax);
	#endregion
#endregion

#region Controller inputs
if gamepad_is_connected(0)
{
	gamepad_set_axis_deadzone(0,0.3);
	//Left stick axis'
	global.moveInput = gamepad_axis_value(0, gp_axislh);
	global.moveInputV = gamepad_axis_value(0, gp_axislv);
	
	//Right stick axis'
	global.targetInput = gamepad_axis_value(0, gp_axisrh);
	global.targetInputV = gamepad_axis_value(0, gp_axisrv);
	
	//face buttons
	global.aInput = gamepad_button_check_pressed(0,gp_face1);
	global.bInput = gamepad_button_check_pressed(0,gp_face2);
	global.xInput = gamepad_button_check_pressed(0,gp_face3);
	global.yInput = gamepad_button_check_pressed(0,gp_face4);
	global.aInputHeld = gamepad_button_check(0,gp_face1);
	global.bInputHeld = gamepad_button_check(0,gp_face2);
	global.xInputHeld = gamepad_button_check(0,gp_face3);
	global.yInputHeld = gamepad_button_check(0,gp_face4);
	
	//shoulder buttons
	global.rbInput = gamepad_button_check_pressed(0,gp_shoulderr);
	global.lbInput = gamepad_button_check_pressed(0,gp_shoulderl);
	global.rtInput = gamepad_button_check_pressed(0,gp_shoulderrb);
	global.ltInput = gamepad_button_check_pressed(0,gp_shoulderlb);
	global.rbInputHeld = gamepad_button_check(0,gp_shoulderr);
	global.lbInputHeld = gamepad_button_check(0,gp_shoulderl);
	global.rtInputHeld = gamepad_button_check(0,gp_shoulderrb);
	global.ltInputHeld = gamepad_button_check(0,gp_shoulderlb);
	
	//D-Pad
	global.dLInput = gamepad_button_check_pressed(0,gp_padl);
	global.dRInput = gamepad_button_check_pressed(0,gp_padr);
	global.dUInput = gamepad_button_check_pressed(0,gp_padu);
	global.dDInput = gamepad_button_check_pressed(0,gp_padd);
	global.dLInputHeld = gamepad_button_check(0,gp_padl);
	global.dRInputHeld = gamepad_button_check(0,gp_padr);
	global.dUInputHeld = gamepad_button_check(0,gp_padu);
	global.dDInputHeld = gamepad_button_check(0,gp_padd);
	
	//Stick presses
	global.rsInput = gamepad_button_check_pressed(0,gp_stickr);
	global.rsInputHeld = gamepad_button_check(0,gp_stickr);
	
	global.startInput = gamepad_button_check_pressed(0,gp_start);
}

// Keyboard inputs
else
{
	//Left stick/movement
	if keyboard_check(vk_left) && keyboard_check(vk_right) global.moveInput = 0;
	else if keyboard_check(vk_left) global.moveInput = -1;
	else if keyboard_check(vk_right) global.moveInput = 1;
	else global.moveInput = 0;

	if keyboard_check(vk_up) && keyboard_check(vk_down) global.moveInputV = 0;
	else if keyboard_check(vk_up) global.moveInputV = -1;
	else if keyboard_check(vk_down) global.moveInputV = 1;
	else global.moveInputV = 0;
	
	//simulated right stick/movement
	global.keyboardTargetChangeInput = keyboard_check_pressed(vk_tab);

	//Face buttons
	global.aInput = keyboard_check_pressed(ord("Z"));
	global.xInput = keyboard_check_pressed(ord("X"));
	global.bInput = keyboard_check_pressed(ord("C"));
	global.yInput = keyboard_check_pressed(ord("V"));
	global.aInputHeld = keyboard_check(ord("Z"));
	global.xInputHeld = keyboard_check(ord("X"));
	global.bInputHeld = keyboard_check(ord("C"));
	global.yInputHeld = keyboard_check(ord("V"));
	
	//Shoulder buttons
	global.rbInput = keyboard_check_pressed(ord("G"));
	global.lbInput = keyboard_check_pressed(ord("B"));
	global.rtInput = keyboard_check_pressed(ord("H"));
	global.ltInput = keyboard_check_pressed(ord("N"));
	global.rbInputHeld = keyboard_check(ord("G"));
	global.lbInputHeld = keyboard_check(ord("B"));
	global.rtInputHeld = keyboard_check(ord("H"));
	global.ltInputHeld = keyboard_check(ord("N"));
	
	//D-Pad
	global.dLInput = keyboard_check_pressed(ord("A"));
	global.dRInput = keyboard_check_pressed(ord("D"));
	global.dUInput = keyboard_check_pressed(ord("W"));
	global.dDInput = keyboard_check_pressed(ord("S"));
	global.dLInputHeld = keyboard_check(ord("A"));
	global.dRInputHeld = keyboard_check(ord("D"));
	global.dUInputHeld = keyboard_check(ord("W"));
	global.dDInputHeld = keyboard_check(ord("S"));
	
	//Stick presses
	global.rsInput = keyboard_check_pressed(vk_lcontrol);
	global.rsInputHeld = keyboard_check(vk_lcontrol);
	
	//Other
	global.startInput = keyboard_check_pressed(ord("F"));
}

//pause
if global.startInput
{
	pauseing = 1;
}
#endregion

#region lock-ons
//soft lockon
if (softLockOn||hardLockOn) && !instance_exists(lockOnTarget)
{
	softLockOn = 0;
	hardLockOn = 0;
	lockOnTarget = noone;
}

if global.rsInput && softLockOn {softLockOn = 0 hardLockOn = 1;}
else if global.rsInput && hardLockOn {hardLockOn = 0;}

if !hardLockOn
{
	var minDist = -1;
	lockOnTarget = noone;
	for (var i = 0; i < instance_number(obj_enemy_parent); i++)
	{
		var posTarget = instance_find(obj_enemy_parent,i);
		var tmpDist = distance_to_object(posTarget)
		if (tmpDist < minDist || minDist == -1) && tmpDist < softLockRange && posTarget.phase != "dying"
		{
			minDist = tmpDist;
			lockOnTarget = posTarget;
		}
	}
	if minDist != -1 softLockOn = 1;
	else softLockOn = 0;
}
else
{
	if distance_to_object(lockOnTarget) > hardLockRange || lockOnTarget.phase == "dying"
	{
		lockOnTarget = noone;
		hardLockOn = 0;
	}
}

if hardLockOn || softLockOn
{
	lockOnDir = sign(lockOnTarget.x-x);
	if lockOnDir == 0 lockOnDir = 1;
}

if gamepad_is_connected(0)
{
	//target switch
	if hardLockOn
	{
		var h = global.targetInput;
		var v = global.targetInputV;
		if canChangeTarget && !(h==0&&v==0)
		{
			var minDist = -1;
			if h <= 0 && abs(h)>=abs(v) {var maxAngle = 225; var minAngle = 135;}
			else if h > 0 && abs(h)>=abs(v) {var maxAngle = 45; var minAngle = 315;}
			else if v < 0 && abs(v)>=abs(h) {var maxAngle = 135; var minAngle = 45;}
			else if v >= 0 && abs(v)>= abs(h) {var maxAngle = 315; var minAngle = 225;}
			with obj_enemy_parent
			{
				var searchAngle = point_direction(other.lockOnTarget.x,other.lockOnTarget.y,x,y)
				if other.lockOnTarget != id && ((searchAngle > minAngle && searchAngle < maxAngle)||(minAngle == 315 && (searchAngle < 45 || minAngle > 315))) && (distance_to_object(other.lockOnTarget)<minDist||minDist==-1) && distance_to_object(other) < other.hardLockRange
				{
					minDist = distance_to_object(other.lockOnTarget);
					other.potentialId = id;
				}
			}
			if minDist != -1
			{
				lockOnTarget = potentialId;
				canChangeTarget = 0;
			}
		}
	}
	if !canChangeTarget
	{
		if (global.targetInput==0&&global.targetInputV==0) canChangeTarget = 1;
	}
}
else
{
	if hardLockOn && global.keyboardTargetChangeInput
	{
		var stopIt = 0;
		if !variable_instance_exists(id,"targetList") targetList = [];
		with obj_enemy_parent
		{
			if distance_to_object(other) <= other.hardLockRange
			{
				for (var i = 0; i < array_length_1d(other.targetList); i++)
				{
					if other.targetList[i] == id
					{
						if id == other.lockOnTarget other.lockOnIndex = i
						stopIt = 1;
					}
				}
				if !stopIt
				{
					var newIndex = array_length_1d(other.targetList);
					other.targetList[newIndex] = id;		
					if id == other.lockOnTarget other.lockOnIndex = newIndex;
				}
			}
		}
		lockOnIndex++;
		if lockOnIndex >= array_length_1d(other.targetList)lockOnIndex = 0;
		lockOnTarget = targetList[lockOnIndex]
	}
}
#endregion

#region Combat
	#region Offhand
	//setup
	if attackNum = 0 && global.yInput && onGround && phase != "hooked" && phase != "offhand" && phase != "attacking" && phase != "blocking" && phase != "dodging" && phase != "dying" && phase != "staggered" && phase != "misc"
	{
		//Ground
		preOffhand = 1;
		offhandTimer = 0;
	}
	else if attackNum = 0 && global.yInput && !onGround && phase != "hooked" && phase != "offhand" && phase != "attacking" && phase != "blocking" && phase != "dodging" && phase != "dying" && phase != "staggered" && phase != "misc"
	{
		//Aerial
		phase = "offhand";
		subPhase = "aerial";
		ySpd = -4;
		quickfireTimer =0;
	}
	else if attackNum = 0 && global.yInput && (phase == "hooked" && subPhase == "stop") && phase != "offhand" && phase != "attacking" && phase != "blocking" && phase != "dodging" && phase != "dying" && phase != "staggered" && phase != "misc"
	{
		//Hooked
		preOffhand = 1;
		offhandTimer = 0;
	}

	//if (phase != phasePrev && phase != "idle" && phase != "walking" && phase != "running") preOffhand = 0;

	//determiner (if not canceled)
	if preOffhand
	{
		switch global.activeOffhandID
		{
			case 0:
				preOffhand = 0;
				if phase == "hooked" subPhase = "hookedOffhandDrawing";
				else subPhase = "offhandDrawing";
				phase = "offhand";
				break;
			case 1:
				offhandTimer++;
				if !global.yInputHeld
				{
					preOffhand = 0;
					if phase == "hooked" subPhase = "hookedQuickfire";
					else subPhase = "quickfire"
					phase = "offhand";
					quickfireTimer = 0;
				}
				else if offhandTimer >= room_speed*0.5
				{
					preOffhand = 0;
					if phase == "hooked" subPhase = "hookedHolding";
					else subPhase = "holding"
					phase = "offhand";
				}
				break;
		}
	}

	//crossbow Drawing
	if phase == "offhand" && (subPhase == "offhandDrawing" || subPhase == "hookedOffhandDrawing")
	{
		offhandTimer++;
		if offhandTimer = round(room_speed*crossbowDrawDuration)
		{
			if facing == 1 aimDir = 0;
			else aimDir = 180;
			armAngle = aimDir;
			if subPhase == "offhandDrawing" subPhase = "offhandDrawn"
			else subPhase = "hookedOffhandDrawn"
			offhandTimer = 0;
			skipFireRate = 1;
			offhandWillFire = 0;
			checkIfHolding = 1;
			recoil = 0;
		}
	}
	//crossbow drawn
	if phase == "offhand" && (subPhase == "offhandDrawn" || subPhase == "hookedOffhandDrawn")
	{
		offhandTimer++;
		if global.yInput && !offhandWillFire  {offhandTimer = 0; checkIfHolding = 1;}
		if checkIfHolding
		{
			if !global.yInputHeld
			{
				checkIfHolding = 0;
				offhandWillFire = 1;
			}
			if offhandTimer = round(room_speed*0.4)
			{
				checkIfHolding = 0;
				if subPhase == "hookedOffhandDrawn" subPhase = "hookedHoldingDrawn"
				else subPhase = "holdingDrawn";
			}
		}
		if offhandTimer = round(room_speed*crossbowFireRate)||skipFireRate recoil = 0;
		if offhandWillFire && !checkIfHolding && (offhandTimer = round(room_speed*crossbowFireRate)||skipFireRate)
		{
			recoil = 1;
			skipFireRate = 0;
			offhandWillFire = 0;
			offhandTimer = 0;
			if mp >= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID]
			{
				mp -= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID];
				var w = 0;
			}
			else var w = 1;
			var SUBID = global.activeOffhandSubtypeID;
			if softLockOn||hardLockOn facing = lockOnDir;
			var projectileXStrt = x+facing*13*8;
			var projectileYStrt = y-7*8;
			if (hardLockOn || softLockOn) aimDir = point_direction(projectileXStrt,projectileYStrt,lockOnTarget.x,lockOnTarget.y)
			else if facing == 1 aimDir = 0;
			else if facing == -1 aimDir = 180;
			var qD = aimDir+random_range(-2,2);
			var spd = 80;
			with instance_create_depth(projectileXStrt,projectileYStrt,depth,global.offhandBaseProjectiles[global.activeOffhandID])
			{
				wiff = w;
				caster = other;
				subId = SUBID;
				xSpd = spd*dcos(qD);
				ySpd = -spd*dsin(qD);
				hitType = global.offhandSubtypeDamageTypes[subId];
				hitDamage = global.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
				hitStagger = global.offhandSubtypeStaggerModifiers[subId];								//^^
				hitKnockback = global.offhandSubtypeKnockbacks[subId];
				statusType = global.offhandSubtypeStatusTypes[subId];
				statusValue = global.offhandSubtypeStatusValues[subId];
			}
		}
		if offhandTimer = round(room_speed*crossbowHolsterDelay)
		{
			if subPhase == "hookedOffhandDrawn" subPhase = "hookedOffhandHolster"
			else subPhase = "offhandHolster";
			offhandTimer = 0;
		}
	}
	if phase = "offhand" && (subPhase == "offhandHolster" || subPhase = "hookedOffhandHolster")
	{
		offhandTimer++;
		if offhandTimer == round(room_speed*crossbowDrawDuration)
		{
			if subPhase = "offhandHolster"
			{
				phase = "idle";
				subPhase = "";
			}
			else if subPhase = "hookedOffhandHolster"
			{
				phase = "hooked";
				subPhase = "stop"
			}
		}
	}

	//quickfire & ending
	if phase == "offhand" && (subPhase == "quickfire" || subPhase == "hookedQuickfire")
	{
		quickfireTimer++;
		if quickfireTimer = room_speed*0.3
		{
			if global.activeOffhandID = 0 || global.activeOffhandID = 1		//Crossbow || Spells
			{	
				if mp >= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID]
				{
					mp -= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID];
					var w = 0;
				}
				else var w = 1;
			
				var SUBID = global.activeOffhandSubtypeID;
			
				if softLockOn||hardLockOn facing = lockOnDir;
			
				var projectileXStrt = x+facing*12*8;
				if global.activeOffhandID = 1
				{
					var projectileYStrt = y-0*8;
					if (hardLockOn || softLockOn) quickfireDir = point_direction(projectileXStrt,projectileYStrt,lockOnTarget.x,lockOnTarget.y)
					else if facing == 1 quickfireDir = 0;
					else if facing == -1 quickfireDir = 180;
					var qD = quickfireDir;
					var spd = 50;
				}
				with instance_create_depth(projectileXStrt,projectileYStrt,depth,global.offhandBaseProjectiles[global.activeOffhandID])
				{
					wiff = w;
					caster = other;
					subId = SUBID;
					xSpd = spd*dcos(qD);
					ySpd = -spd*dsin(qD);
					hitType = global.offhandSubtypeDamageTypes[subId];
					hitDamage = global.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
					hitStagger = global.offhandSubtypeStaggerModifiers[subId];								//^^
					hitKnockback = global.offhandSubtypeKnockbacks[subId];
					statusType = global.offhandSubtypeStatusTypes[subId];
					statusValue = global.offhandSubtypeStatusValues[subId];
				}
				xSpd -= facing*4;			//recoil
			}
		}
		if quickfireTimer >= room_speed*0.5
		{
			if subPhase = "hookedQuickfire"
			{
				phase = "hooked"
				subPhase = "stop"
			}
			else
			{
				phase = "idle";
				subPhase = "";
			}
		}
	}

	//holding aim & release
	if phase == "offhand" && (subPhase == "holding" || subPhase == "hookedHolding" || subPhase == "holdingDrawn" || subPhase == "hookedHoldingDrawn")
	{			
		var h = global.moveInput;
		var v = global.moveInputV;
		aimDir = point_direction(0,0,h,v)
		if !(h==0&&v==0)
		{
			if aimDir < 90 || aimDir > 270 facing = 1;
			else facing = -1;
		}
		else
		{
			if (hardLockOn || softLockOn) aimDir = point_direction(x,y,lockOnTarget.x,lockOnTarget.y)
			else if facing == 1 aimDir = 0;
			else if facing == -1 aimDir = 180;
		}
		if !global.yInputHeld
		{
			if subPhase = "hookedHolding"
			{
				phase = "hooked"
				subPhase = "stop"
			}
			else if subPhase = "holding"
			{
				phase = "idle";
				subPhase = "";
			}
			else if subPhase = "holdingDrawn"
			{
				subPhase = "offhandDrawn";
				offhandTimer = 0;
			}
			else if subPhase = "hookedHoldingDrawn"
			{
				subPhase = "hookedOffhandDrawn";
				offhandTimer = 0;
			}
		
			if mp >= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID]
			{
				mp -= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID];
				var w = 0;
			}
			else var w = 1;
			var SUBID = global.activeOffhandSubtypeID;
			var aD = other.aimDir;
		
			if global.activeOffhandID = 0
			{
				var spd = 80;
			}
			else if global.activeOffhandID = 1
			{
				var spd = 50;
			}
			with instance_create_depth(x,y,depth,global.offhandBaseProjectiles[global.activeOffhandID])
			{
				wiff = w;
				caster = other;
				subId = SUBID;
				xSpd = spd*dcos(aD);
				ySpd = -spd*dsin(aD);
				hitType = global.offhandSubtypeDamageTypes[subId];
				hitDamage = global.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
				hitStagger = global.offhandSubtypeStaggerModifiers[subId];								//^^
				hitKnockback = global.offhandSubtypeKnockbacks[subId];
				statusType = global.offhandSubtypeStatusTypes[subId];
				statusValue = global.offhandSubtypeStatusValues[subId];
			}
		}
	}

	//mid Combo uppercut
	if phase == "offhand" && subPhase == "uppercut"
	{
		uppercutTimer++;
		if uppercutTimer >= attackDuration*room_speed
		{
			phase = "idle";
			subPhase = "";
			///FOLLOW UP CODE GOES HERE!!!
		}
		if uppercutTimer >= (attackDuration+attackCooldown)*room_speed
		{
			phase = "idle";
			subPhase = "";
		}
	}

	//aerial quickfire & ending
	if phase == "offhand" && subPhase == "aerial"
	{
		quickfireTimer++;
		if quickfireTimer = room_speed*0.3
		{
			if global.activeOffhandID = 0 || global.activeOffhandID = 1		//Crossbow || Spells
			{	
				if mp >= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID]
				{
					mp -= global.offhandSubtypeManaCosts[global.activeOffhandSubtypeID];
					var w = 0;
				}
				else var w = 1;
			
				var SUBID = global.activeOffhandSubtypeID;
			
				if softLockOn||hardLockOn facing = lockOnDir;
			
				var projectileXStrt = x+facing*13*8;
				if global.activeOffhandID = 0
				{
					var projectileYStrt = y-7*8;
					if (hardLockOn || softLockOn) quickfireDir = point_direction(projectileXStrt,projectileYStrt,lockOnTarget.x,lockOnTarget.y)
					else if facing == 1 quickfireDir = 0;
					else if facing == -1 quickfireDir = 180;
					var qD = quickfireDir+random_range(-2,2);
					var spd = 80;
				}
				else if global.activeOffhandID = 1
				{
					var projectileYStrt = y-0*8;
					if (hardLockOn || softLockOn) quickfireDir = point_direction(projectileXStrt,projectileYStrt,lockOnTarget.x,lockOnTarget.y)
					else if facing == 1 quickfireDir = 0;
					else if facing == -1 quickfireDir = 180;
					var qD = quickfireDir;
					var spd = 50;
				}
				with instance_create_depth(projectileXStrt,projectileYStrt,depth,global.offhandBaseProjectiles[global.activeOffhandID])
				{
					wiff = w;
					caster = other;
					subId = SUBID;
					xSpd = spd*dcos(qD);
					ySpd = -spd*dsin(qD);
					hitType = global.offhandSubtypeDamageTypes[subId];
					hitDamage = global.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
					hitStagger = global.offhandSubtypeStaggerModifiers[subId];								//^^
					hitKnockback = global.offhandSubtypeKnockbacks[subId];
					statusType = global.offhandSubtypeStatusTypes[subId];
					statusValue = global.offhandSubtypeStatusValues[subId];
				}
				xSpd -= facing*4;			//recoil
			}
		}
		if quickfireTimer >= room_speed*0.5
		{
			phase = "idle";
			subPhase = "";
		}
	}
	#endregion
	#region Weapon
	//deflect
	if phase == "attacking" && deflected
	{
		deflected = 0;
		phase = "staggered";
		subPhase = "deflected";
		staggerTimer = 0;
		attackTimer = 0;
		timerState = 0;
		attackNum = 0;
		xSpd = -5*facing;
	}

	//aerial attack timer
	if !canAerialAttack
	{
		canAerialAttackTimer++
		if canAerialAttackTimer >= round(room_speed*aerialAttackDelay) canAerialAttack = 1;
	}
	//aerial target reset
	if !(phase == "attacking" && subPhase == "aerial")
	{
		aerialTargetX = -4;
		aerialTargetY = -4;	
	}

	//Attacking(weapon)
		//timer
	if timerState && phase == "attacking"
	{
		attackTimer++;
		if global.xInput
		{
			xInputQueue = 1;
			yInputQueue = 0;
		}
		else if global.yInput
		{
			xInputQueue = 0;
			yInputQueue = 1;	
		}
		if attackTimer >= attackDuration*room_speed && attackTimer < floor((attackDuration+attackCooldown)*room_speed)
		{
			//Ground
				//keep weapon attacking?
			if subPhase == "ground" && xInputQueue && attackNum != array_length_1d(global.activeComboIDs) && effect.hasHit
			{
				with obj_player_attack_effect instance_destroy();
				scr_player_combo();
				attackTimer = 0;
				timerState = 1;
				xInputQueue = 0;
				attackNum++;
				image_index = 0;
			}
				//offhand attack?
			else if subPhase == "ground" && yInputQueue && attackNum != array_length_1d(global.activeComboIDs)
			{
				with obj_player_attack_effect instance_destroy();
				attackTimer = 0;
				timerState = 0;
				yInputQueue = 0;
				uppercutTarget = noone;
				uppercutTimer = 0;
				doAStopIt = 0;
				attackNum = 0;
				phase = "offhand";
				subPhase = "uppercut";
				image_index = 0;
			}
				//airborne
			else if subPhase == "aerial" && xInputQueue && attackNum != aerialComboSize && effect.hasHit
			{
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
				with obj_player_attack_effect instance_destroy();
				if attackNum != aerialComboSize - 1 scr_player_aerial(0);
				else scr_player_aerial(1);
				attackTimer = 0;
				timerState = 1;
				xInputQueue = 0;
				attackNum++;
				image_index = 0;
			}
		}
		if attackTimer == floor((attackDuration+attackCooldown)*room_speed)
		{
			phase = "idle"
			attackNum = 0;
			timerState = 0;
			attackTimer = 0;
		}
	}
		//end if onGround state changes
	else if timerState && phase == "attacking" && subPhase != "upwards" && onGround != onGroundPrev
	{
		phase = "idle"
		attackNum = 0;
		timerState = 0;
		attackTimer = 0;
	}
		//Ground attacking
	else if global.xInput && phase != "airborne" && phase != "offhand" && phase != "blocking" && phase != "dodging" && phase != "dying" && phase != "staggered" && phase != "misc" && phase != "hooked"
	{
			//standing still
		if global.moveInput = 0 && global.moveInputV = 0
		{
			phase = "attacking";
			subPhase = "ground";
			scr_player_combo();
			onGroundPrev = 1;
			attackTimer = 0;
			xInputQueue = 0;
			yInputQueue = 0;
			timerState = 1;
			attackNum+=1;
		}
			//Upwards
		else if global.moveInputV < 0 && abs(global.moveInputV) > abs(global.moveInput)
		{
			phase = "attacking";
			subPhase = "upwards";
			scr_player_combo_ext(1);
			onGroundPrev = 1;
			attackTimer = 0;
			xInputQueue = 0;
			yInputQueue = 0;
			timerState = 1;
			attackNum+=1;
		}
			//Downwards
		else if global.moveInputV > 0 && abs(global.moveInputV) > abs(global.moveInput)
		{
			phase = "attacking";
			subPhase = "ground";
			scr_player_combo_ext(2);
			onGroundPrev = 1;
			attackTimer = 0;
			xInputQueue = 0;
			yInputQueue = 0;
			timerState = 1;
			attackNum+=1;
		}
			//Forwards
		else if ((hardLockOn && sign(global.moveInput) == facing) || (!hardLockOn && global.moveInput != 0)) && abs(global.moveInput) > abs(global.moveInputV)
		{
			phase = "attacking";
			subPhase = "ground";
			scr_player_combo_ext(3);
			onGroundPrev = 1;
			attackTimer = 0;
			xInputQueue = 0;
			yInputQueue = 0;
			timerState = 1;
			attackNum+=1;
		}
			//Backwards
		else if (hardLockOn && sign(global.moveInput) == -facing && abs(global.moveInput) > abs(global.moveInputV))
		{
			phase = "attacking";
			subPhase = "ground";
			scr_player_combo_ext(4);
			onGroundPrev = 1;
			attackTimer = 0;
			xInputQueue = 0;
			yInputQueue = 0;
			timerState = 1;
			attackNum+=1;
		}
	}
		//Counter attacking
	else if global.xInput && (phase == "blocking" && subPhase == "reaction")
	{
		if lockOnTarget != noone facing = lockOnDir;
		phase = "attacking";
		subPhase = "ground";
		scr_player_combo_ext(0);
		onGroundPrev = 1;
		attackTimer = 0;
		xInputQueue = 0;
		yInputQueue = 0;
		timerState = 1;
		attackNum+=1;
	}
		//Aerial attacking
	else if global.xInput && phase == "airborne" && canAerialAttack
	{
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
		phase = "attacking";
		subPhase = "aerial";
		scr_player_aerial(0);
		if lockOnTarget != noone attackTarget = lockOnTarget;
		onGroundPrev = 0;
		attackTimer = 0;
		canAerialAttack = 0;
		canAerialAttackTimer = 0;
		xInputQueue = 0;
		yInputQueue = 0;
		timerState = 1;
		attackNum+=1;
		timesAerialAttacked++;
		ySpd = 8-12/(timesAerialAttacked);
	}

	if phase == "attacking" && !instance_exists(obj_player_attack_effect)
	{
		attackNum = 0;
		phase = "misc";
		subPhase = "gutReturn";		//gatta change
		miscDuration = room_speed*1;
		miscTimer = -1;
	}
	if phase == "misc" && subPhase = "gutReturn"
	{
		miscTimer++;
		if miscTimer = floor(miscDuration)
		{
			phase = "idle";
			subPhase = "";
			miscDuration = 0;
			miscTimer = 0;
		}
	}

	if phase != "attacking" && phase != "offhand"
	{
		with obj_player_attack_effect
		{
			if type != "proj" instance_destroy();
		}
	}
	#endregion
	#region Active Ability
	activeId = global.activeOffhandActivatableID;

	//PASSIVES
	if global.offhandActivatableNames[activeId] == "Rope Shot"
	{
		//Determine autotargets
		if !hardLockOn
		{
			hookTarget = noone;
			var distTemp = -1;
			var maxHookSearch = 8*8*16+4;
			for (var i = 0; i < instance_number(obj_grapple_parent); i++)
			{
				var posTarget = instance_find(obj_grapple_parent,i);
				var dist = point_distance(x,y,posTarget.x,posTarget.y);
				if (dist < distTemp || distTemp == -1) && dist < maxHookSearch
				{
					distTemp = dist;
					hookTarget = posTarget;
				}
			}
			if hookTarget != noone
			{
				autoDir = point_direction(x,y,hookTarget.x,hookTarget.y);
				hookTargetType = "mount";
			}
		}
		else
		{
			hookTargetType = "enemy";
			hookTarget = lockOnTarget;
			autoDir = point_direction(x,y,hookTarget.x,hookTarget.y);
		}
	}
	else if global.offhandActivatableNames[activeId] == "Mine"
	{
		//None
	}

	//ACTIVATION
	if global.rbInput && phase != "attacking" && phase != "blocking" && phase != "dodging" && phase != "dying" && phase != "staggered" && phase != "misc"
	{
		switch (global.offhandActivatableNames[activeId])
		{
			case "Rope Shot":
				if !instance_exists(obj_hook)
				{
					//basic initiation
					abilityTimer = 0;
					aimDir = 0;
					if onGround {phase = "ability"; subPhase = "";}
					else if !onGround && hookTarget != noone {phase = "ability"; subPhase = "aerial"; ySpd = -4;}
					else if !onGround && hookTarget == noone {}//cant use message
				}
				break;
			case "Mine":
				abilityTimer = 0;
				phase = "ability";
				subPhase = "";
				break;
			case "Aura":
				abilityTimer = 0;
				phase = "ability";
				subPhase = "";
		}
	}

	//EXECUTION

	if global.offhandActivatableNames[activeId] == "Rope Shot"
	{
		//attack primer Ground
		if phase == "ability" && subPhase = ""
		{
			abilityTimer++;
			if abilityTimer == floor(global.offhandActivatableDurations[activeId]*room_speed)
			{
				//Aiming
				if global.rbInputHeld
				{
					subPhase = "holding";
				}
				else
				{
					with instance_create_depth(x,y,depth,obj_hook)
					{
						if other.hookTarget != noone
						{
							direction = other.autoDir;
							speed = 50;
							caster = other
							defaultSpeed = speed;
							maxDist = 8*8*16;
						}
						else
						{
							if other.facing == 1 direction = 0;
							else direction = 180;
							speed = 50;
							caster = other
							defaultSpeed = speed;
							maxDist = 8*8*16;
						}
					}
				}
			}
			if abilityTimer >= (global.offhandActivatableDurations[activeId]+global.offhandActivatableCooldowns[activeId])*room_speed
			{
				phase = "idle";
				subPhase = "";
			}
		}

		//attack aiming ground
		if phase == "ability" && subPhase = "holding"
		{
			var h = global.moveInput;
			var v = global.moveInputV;
			aimDir = point_direction(0,0,h,v)
			if !(h==0&&v==0)
			{
				if aimDir < 90 || aimDir > 270 facing = 1;
				else facing = -1;
			}
			else if facing == 1 aimDir = 0;
			else if facing == -1 aimDir = 180;
			if !global.rbInputHeld
			{
				subPhase = "";
				abilityTimer = floor(global.offhandActivatableDurations[activeId]*room_speed)
				with instance_create_depth(x,y,depth,obj_hook)
				{
					direction = other.aimDir;
					speed = 30;
					caster = other;
					defaultSpeed = speed;
					maxDist = 8*8*16; //Num*blocksize(px)*pixelSize
				}
			}
		}

		//atack quickFire air
		if phase == "ability" && subPhase == "aerial"
		{
			abilityTimer++;
			if abilityTimer == floor(global.offhandActivatableDurations[activeId]*room_speed/2)
			{
				with instance_create_depth(x,y,depth,obj_hook)
				{
					direction = other.autoDir;
					speed = max(50,distance_to_object(other.hookTarget)/(room_speed*0.2));
					caster = other
					defaultSpeed = speed;
					maxDist = 8*8*16;
				}
			}
			if abilityTimer >= (global.offhandActivatableDurations[activeId]+global.offhandActivatableCooldowns[activeId])*room_speed
			{
				phase = "idle";
				subPhase = "";
			}
		}
	}
	else if global.offhandActivatableNames[activeId] == "Mine"
	{
		if phase == "ability" && subPhase = ""
		{
			abilityTimer++;
			//Use
			if abilityTimer == round(global.offhandActivatableDurations[activeId]*room_speed)
			{
				with instance_create_depth(x+facing*8,y-4,depth-1,obj_player_ability_mine)
				{
					caster = other;
					ySpd = 0;
					xSpd = other.facing*15;	
				}
			}
			//End
			if abilityTimer >= (global.offhandActivatableDurations[activeId]+global.offhandActivatableCooldowns[activeId])*room_speed
			{
				phase = "idle";
				subPhase = "";
			}
		}
	}
	else if global.offhandActivatableNames[activeId] == "Aura"
	{
		if phase == "ability" && subPhase = ""
		{
			abilityTimer++;
			//Use
			if abilityTimer == round(global.offhandActivatableDurations[activeId]*room_speed)
			{
				with instance_create_depth(x+facing*8,y-4,depth+1,obj_player_ability_aura)
				{
					caster = other;
					maxRadius = 35*8;
					ySpd = 0;
					xSpd = 0;
					casterType = "temp";
					caster = other;
					hitOn = 1;
					hasHit = 0;
					hitType = global.offhandSubtypeDamageTypes[global.activeOffhandSubtypeID]
					hitDamage = 2 //CHANGE
					statusType = -1;
					statusValue = 0;
				}
			}
			//End
			if abilityTimer >= (global.offhandActivatableDurations[activeId]+global.offhandActivatableCooldowns[activeId])*room_speed
			{
				phase = "idle";
				subPhase = "";
			}
		}
	}
	#endregion
	#region Defending
	if onGround && (global.bInput || bInputQueue) && phase != "blocking" && phase != "dodging" && phase != "attacking" && phase != "offhand" && phase != "hooked" && phase != "dying" && phase != "staggered" && phase != "misc"
	{
		if global.moveInput == 0
		{
			phase = "blocking";
			subPhase = "";
			blockTimer = 0;
		}
		else if global.moveInput != 0 && canDodge
		{
			dodgeDir = sign(global.moveInput);
			phase = "dodging";
			subPhase = "";
			dodgeTimer = 0;
			canDodge = 0;
			canDodgeTimer = 0;
			if !place_meeting(x+dodgeDistance*dodgeDir,y,obj_enemy_parent)
			{
				phased = 1;
			}
		}
		bInputQueue = 0;
	}
	else if !onGround && (global.bInput || bInputQueue) && phase == "airborne" && global.upgradeHasAerialDodge && canDodge
	{
		if global.moveInput = 0 dodgeDir = facing
		else dodgeDir = sign(global.moveInput);
		phase = "aerialDodging";
		subPhase = "";
		dodgeTimer = 0;
		canDodge = 0;
		canDodgeTimer = 0;
		if !place_meeting(x+dodgeDistance*dodgeDir,y,obj_enemy_parent)
		{
			phased = 1;
		}
		bInputQueue = 0;
	}

	//dodge timer
	if !canDodge
	{
		canDodgeTimer++
		if canDodgeTimer == round(room_speed*dodgeDelay) canDodge = 1;
	}

	if phase == "dodging"
	{
		dodgeTimer++;
		if dodgeTimer == dodgeDuration*room_speed
		{
			subPhase = "end";
		}
		if dodgeTimer == (dodgeDuration+dodgeCooldown)*room_speed
		{
			phased = 0;
			phase = "idle";
			subPhase = "";
			if hardLockOn
			{
				facing = lockOnDir
			}
		}
	}
	else if phase == "aerialDodging"
	{
		dodgeTimer++;
		if dodgeTimer == dodgeDuration*room_speed
		{
			subPhase = "end";
		}
		if dodgeTimer == (dodgeDuration+dodgeCooldown)*room_speed
		{
			phased = 0;
			phase = "idle";
			subPhase = "";
			if hardLockOn
			{
				facing = lockOnDir
			}
		}
	}

	if phase == "blocking"
	{
		blockTimer++;
		if subPhase == "" && blockTimer == blockDuration*room_speed
		{
			subPhase = "end";
		}
		if blockTimer == (blockDuration+blockCooldown)*room_speed
		{
			phase = "idle";
			subPhase = "";
			if lockOnTarget != noone facing = lockOnDir;
		}
	}
	#endregion
	#region Hit Reaction	
//react to hit
if place_meeting(x,y,obj_enemy_attack_effect) && (!(phase == "dying" && subPhase != "flung") && phase != "dodging")
{
	var effNum = instance_number(obj_enemy_attack_effect);
	for (var i = 0; i < effNum; i++)
	{
		effect = instance_find(obj_enemy_attack_effect,i);
		if place_meeting(x,y,effect)
		{
			enemy = effect.caster;
			if effect.hitOn && !effect.hasHit
			{
				effect.hasHit = 1;
				dirNum = sign(x-enemy.x);
				if phase == "blocking" && dirNum == -facing && !effect.pierce
				{
					subPhase = "reaction"
					blockTimer = 0;
					xSpd = 5*dirNum;
					enemy.deflected = 1;
				}
				else
				{
					// audio (make reflective of enemy)
					audio_play_sound(snd_enemy_hit,10,0);
					// stats
					if  isInvulnerable == "Off" scr_hit(effect,effect.hitType,effect.hitDamage,effect.statusType,effect.statusValue,effect.caster);
					//determine phase
					if effect.hitStagger <= toughness reaction = "nothing";
					else if effect.hitStagger <= toughness*2 || effect.hitKnockback == 0 reaction = "stagger";
					else reaction = "fling";
					// effect & phase
					if ((phase == "hooked" || phase == "hookedStop") && (reaction == "stagger" || reaction == "fling")) || subPhase == "flung"
					{
						if reaction == "stagger"
						{
							effect.hitKnockback = max(10,effect.hitKnockback);
							reaction = "fling";
						}
						if phase == "hooked" instance_destroy(obj_hook);
					}
					switch reaction
					{
						case "nothing":
							 //do not change phase
							break;
						case "stagger":
							if subPhase != "flung" && subPhase != "prone"
							{
								phase = "staggered";
								subPhase = "stagger"
								staggerTimer = 0;
								xSpd = 5*dirNum;
							}
							attackTimer = 0;
							timerState = 0;
							attackNum = 0;
							break;
						case "fling":
							phase = "staggered";
							subPhase = "flung"
							attackTimer = 0;
							timerState = 0;
							proneTimer = 0;
							hasLeftGround = 0;
							reactDir = 35;
							hitPow = effect.hitKnockback;
							xSpd = dirNum*hitPow*dcos(reactDir);
							ySpd = -hitPow*dsin(reactDir);
							attackNum = 0;
							break;
					}
				}
			}
		}
	}
}

//staggerTimer
if phase == "staggered" && global.bInput
{
	bInputQueue = 1;
}

if (phase == "staggered" || phase == "dying") && subPhase == "deflected"
{
	staggerTimer++;
	if staggerTimer >= room_speed*deflectedDuration 
	{
		if phase != "dying" phase = "idle";
		subPhase = "";
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "stagger"
{
	staggerTimer++;
	if staggerTimer >= room_speed*staggerDuration 
	{
		if phase != "dying" phase = "idle";
		subPhase = "";
	}
}
else if (phase == "staggered" || phase == "dying") && (subPhase == "flung")
{
	proneTimer++
	if !onGround hasLeftGround = 1;
	if onGround && (proneTimer >= room_speed || hasLeftGround)
	{
		subPhase = "prone";
		deathTimer = 0;
		proneTimer = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "prone"
{
	proneTimer++;
	if proneTimer >= room_speed*proneDuration
	{
		if phase != "dying" subPhase = "recover";
		proneTimer = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "recover"
{
	proneTimer++;
	if proneTimer >= room_speed*proneRecoverDuration
	{
		if phase != "dying" phase = "idle";
		subPhase = ""
		proneTimer = 0;
	}
}

//special effects
if bleedValue == bleedResist
{
	scr_hit_effect_general(hitType,hitColour,60)
	hp -= maxHp*(60/100);
	bleedValue = 0;
}
bleedValue -= 10/room_speed;
bleedValue = clamp(bleedValue,0,100);
	#endregion
#endregion

#region jump
//Jump
	//Reset Stats
if onGround || phase == "hookedStop"
{
	jumpNum = 0;
	hoverTimer = 0;
}

if !onGround && jumpNum == 0 jumpNum = 1;

	//normal jump
if global.aInput && global.moveInputV != 1 && (onGround||(phase == "hooked" && subPhase == "stop")) && phase != "blocking" && phase != "dodging" && phase != "attacking"  && phase != "dying" && phase != "ability" && phase != "offhand" && phase != "staggered" && phase != "misc"
{
	ySpd = -jumpPow;
	jumpNum += 1;
	canHover = 1;
	if phase == "hooked" && subPhase == "stop"
	{
		obj_hook.phase = "returning";
		phase = "airborne";
		subPhase = "";
	}
}
	
	//doublejump
if global.aInput && !onGround && phase != "attacking" && phase != "dying" && jumpNum == 1 && global.upgradeHasDoubleJump
{
	ySpd = -jumpPow;
	jumpNum += 1;
	canHover = 1;
}

	//hover
if ySpd > -3 && ySpd < 3 && gamepad_button_check(0,gp_face1) && global.upgradeHasHover && phase != "dying"
{
	if canHover && hoverTimer < room_speed*1
	{
		hoverTimer++;
		ySpd *= 0.2;
	}
}

	//variable jump
if !onGround && jumpNum != 0 && !global.aInputHeld && sign(ySpd) == -1
{
	ySpd*=0.5;
	canHover = 0;
}
#endregion

#region Dying & Room Transitions
//clamp HP
hp = clamp(hp,0,global.hpMax);

if hp <= 0 && phase != "dying"
{
	phase = "dying";
	if subPhase != "flung" subPhase = "";
	deathTimer = 0;
}
else if phase == "dying" && subPhase != "flung"
{
	deathTimer++;
	if deathTimer == room_speed*deathDuration
	{
		falling = 1;	//later change this all to reflect desired death screen
		transitioning = 1;
	}
}

//Fall
if place_meeting(x,y,obj_fall) && !instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 1;
}

//Room Change
if (place_meeting(x,y,obj_room_transition))&&(!global.spawning)&&!instance_exists(obj_transition_controller)
{
	transitioning = 1;
	falling = 0;
}
#endregion

#region Movement phase determiner
//Basic movement
if phase == "airborne"
{
	if onGround
	{
		phase = "idle";
		subPhase = "landing";
		landingTimer = 0;
		
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);

		pDust1 = part_type_create();
		part_type_sprite(pDust1,spr_dust,1,1,0);
		part_type_size(pDust1,6,6,0.001,0);
		part_type_orientation(pDust1,0,360,0.05,0,0);
		part_type_colour1(pDust1,c_white);
		part_type_alpha2(pDust1,0.1,0);
		part_type_blend(pDust1,1);
		part_type_direction(pDust1,10,25,0,0);
		part_type_speed(pDust1,0.6,1.2,-0.003,0);
		part_type_life(pDust1,70,100);
		pDust2 = part_type_create();
		part_type_sprite(pDust2,spr_dust,1,1,0);
		part_type_size(pDust2,6,6,0.001,0);
		part_type_orientation(pDust2,0,360,0.05,0,0);
		part_type_colour1(pDust2,c_white);
		part_type_alpha2(pDust2,0.1,0);
		part_type_blend(pDust2,1);
		part_type_direction(pDust2,155,170,0,0);
		part_type_speed(pDust2,0.6,1.2,-0.003,0);
		part_type_life(pDust2,70,100);
	
		part_emitter_region(pSys,pEmitter,x+8*8*facing,x-8*8*facing,y+15*8,y+15*8,ps_shape_ellipse,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pDust1,4+abs(fallSpeed)/4);
		part_emitter_burst(pSys,pEmitter,pDust2,4+abs(fallSpeed)/4);
		fallSpeed = 0;
	}
}
if phase == "idle" && subPhase == "landing"
{
	landingTimer++;
	if landingTimer == round(room_speed*landingDuration)
	{
		phase = "idle";
		subPhase = "";
	}
}

if phase != "attacking" && phase != "blocking" && phase != "ability" && phase != "offhand" && phase != "hooked" && phase != "dying" && phase != "staggered" && phase != "dodging" && phase != "aerialDodging" && phase != "misc"
{
	if hardLockOn
	{
		facing = lockOnDir
	}
	if facing == 0 facing = 1;
		//on Ground Horizontal
	if onGround && !(phase == "airborne" && subPhase == "uppercutFollow")
	{
		if abs(global.moveInput) <= 0.3 || !place_free(x+sign(global.moveInput),y)
		{
			if subPhase != "landing"
			{
				phase = "idle";
				subPhase = "";
			}
		}
		else if abs(global.moveInput) <= 0.8
		{
			if !hardLockOn {phase = "walking"; facing = sign(global.moveInput);}
			else if sign(global.moveInput) == lockOnDir phase = "walking";
			else if sign(global.moveInput) == -lockOnDir phase = "walkingBackwards";
		}
		else 
		{	
			if !hardLockOn {phase = "running"; facing = sign(global.moveInput);}
			else if sign(global.moveInput) == lockOnDir phase = "running";
			else if sign(global.moveInput) == -lockOnDir phase = "walkingBackwards";
		}
		timesAerialAttacked = 0;
		if phase != "idle" subPhase = "";
	}
		//not on ground
	else
	{
		phase = "airborne";
		subPhase = "";
		fallSpeed = ySpd;
		if sign(global.moveInput) != 0 facing = sign(global.moveInput);
	}
}
	//move with crossbow still using subMove
if (phase == "offhand" && (subPhase == "offhandDrawing" || subPhase == "offhandDrawn" || subPhase == "offhandHolster")) && phase != "attacking" && phase != "blocking" && phase != "ability" && phase != "hooked" && phase != "dying" && phase != "staggered" && phase != "dodging" && phase != "misc"
{
	if softLockOn || hardLockOn
	{
		facing = lockOnDir
	}
	if facing == 0 facing = 1;
	if onGround
	{
		if abs(global.moveInput) <= 0.3 || !place_free(x+sign(global.moveInput),y)
		{
			subMove = "idle";
		}
		else if abs(global.moveInput) <= 0.8
		{
			if !hardLockOn && !softLockOn {subMove = "walking"; facing = sign(global.moveInput);}
			else if sign(global.moveInput) == lockOnDir subMove = "walking";
			else if sign(global.moveInput) == -lockOnDir subMove = "walkingBackwards";
		}
		else 
		{	
			if !hardLockOn && !softLockOn {subMove = "running"; facing = sign(global.moveInput);}
			else if sign(global.moveInput) == lockOnDir subMove = "running";
			else if sign(global.moveInput) == -lockOnDir subMove = "walkingBackwards";
		}
		timesAerialAttacked = 0;
	}
}
#endregion

#region xSpd, ySpd and move script
	//horizontal
if phase == "idle"
{
	if subPhase == "" xSpd -= xSpd/4;
	else if subPhase == "landing" xSpd -= xSpd/4;
}
else if phase == "walking" xSpd = defaultMoveSpeed*facing/2;
else if phase == "walkingBackwards" xSpd = -defaultMoveSpeed*facing/2;
else if phase == "running" xSpd = defaultMoveSpeed*facing
else if phase == "airborne"
{
	if global.moveInput != 0 facing = sign(global.moveInput);
	if abs(xSpd) <= moveSpeed xSpd += global.moveInput*moveSpeed/15;
	if xSpd !=0 && global.moveInput == 0 
	{
		prevXSpd = xSpd;
		xSpd-=sign(xSpd)*moveSpeed/20
		if sign(xSpd)!=sign(prevXSpd) xSpd = 0;
	}
	if abs(xSpd) > moveSpeed*1.5 xSpd = sign(xSpd)*moveSpeed*1.5;
}
else if phase == "hooked"
{
	//xSpd defined by hook
}
else if phase == "offhand"
{
	if subPhase == "quickfire" xSpd -= xSpd/2;
	else if subPhase == "holding" xSpd -= xSpd/2;
	else if subPhase == "aerial" xSpd -= xSpd/2;
	else if subPhase == "offhandDrawing" || subPhase == "offhandDrawn" || subPhase == "offhandHolster"
	{
		if subMove == "idle" xSpd -= xSpd/3/2;
		else if subMove == "walking" xSpd = defaultMoveSpeed*facing/2/2;
		else if subMove == "walkingBackwards" xSpd = -defaultMoveSpeed*facing/2/2;
		else if subMove == "running" xSpd = defaultMoveSpeed*facing/2
	}
	else if subPhase == "holdingDrawn" xSpd -= xSpd/8;
	else if subPhase == "hookedOffhandDrawing" {}			//determined in hook
	else if subPhase == "hookedOffhandDrawn" {}				//determined in hook
	else if subPhase == "hookedHoldingDrawn" {}				//determined in hook
	else if subPhase == "hookedOffhandHolster" {}			//determined in hook
}
	else if phase == "dodging" xSpd = dodgeDir*(dodgeDistance/(dodgeDuration*room_speed))
	else if phase == "aerialDodging" xSpd = dodgeDir*(dodgeDistance/(dodgeDuration*room_speed))
	else if phase == "blocking"
{
	if subPhase == "" xSpd -= xSpd/2;
	else if subPhase == "reaction" xSpd = xSpd/2;
	else if subPhase == "end" xSpd -= xSpd/2;
}
else if phase == "attacking"
{
	if subPhase == "aerial"
	{
		if attackTimer >= floor(attackMoveStart*room_speed) && attackTimer <= ceil((attackMoveStart+attackMoveDuration)*room_speed)
		{
			if aerialTargetX != -4 && aerialTargetY != -4 xSpd = (aerialTargetX-x)/4
			else xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
		}
		else xSpd -= xSpd/5;
	}
	else
	{
		if attackTimer >= floor(attackMoveStart*room_speed) && attackTimer <= ceil((attackMoveStart+attackMoveDuration)*room_speed)
		{
			xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
		}
		else xSpd -= xSpd/5;
	}
}
else if phase == "ability"
{
	if subPhase == "" xSpd -= xSpd/2;
	else if subPhase == "aiming" xSpd -= xSpd/2;
	else if subPhase == "aerial" xSpd -= xSpd/4;
}
else if phase == "staggered" || phase == "dying"
{
	if subPhase == "" {xSpd -= xSpd/4}
	else if subPhase == "deflected" {xSpd -= xSpd/5;}
	else if subPhase == "stagger" {xSpd -= xSpd/5;}
	else if subPhase == "flung" {} //determined elsewhere
	else if subPhase == "prone" {xSpd -= xSpd/5;}
	else if subPhase == "recover" {if imPrev != image_index xSpd = 8*facing; else xSpd = 0;}
}
else if phase == "misc"
{
	if subPhase == "gutReturn" xSpd = 0;
	else if subPhase == "hookedEnemyPullGround" xSpd -= xSpd/4;
	else if subPhase == "hookedEnemyPullAerial" xSpd -= xSpd/4;
	else xSpd -= xSpd/5;
}

	//vertical
if phase == "attacking" && subPhase == "aerial"
{
	if attackTimer >= floor(attackMoveStart*room_speed) && attackTimer <= ceil((attackMoveStart+attackMoveDuration)*room_speed)
	{
		if aerialTargetX != -4 && aerialTargetY != -4 ySpd = (aerialTargetY-y)/4
		else ySpd = (attackMoveDistanceY/((attackMoveDuration)*room_speed));
	}
	else ySpd += global.g/2
}
else if phase == "aerialDodging" ySpd = 0;
else if (phase == "stagger" || phase == "dying") && subPhase == "flung" ySpd+=global.g/2;
else if phase == "attacking"
{
	if attackTimer >= round(attackMoveStart*room_speed) && attackTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
	{
		ySpd = (attackMoveDistanceY/((attackMoveDuration)*room_speed));
	}
	else ySpd -= ySpd/4;
}
else if phase == "offhand" && subPhase == "aerial"
{
	ySpd += global.g/8;
}
else if phase == "ability" && subPhase == "aerial"
{
	ySpd += global.g/8;
}
else if phase == "hooked"
{
	//most defined in obj_hook
	if subPhase == "enemyPullAerial" ySpd -= ySpd/2;
}
else if phase == "aerialAttacked"
{
	 if ySpd < -2 ySpd+=global.g/2;
	 else if abs(ySpd) <= 2 ySpd  += global.g/16;
	 else ySpd+=global.g;
}
else
{
	if !onGround || sign(global.moveInputV) == 1
	{
		if ySpd < maxFallSpeed ySpd+=global.g;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
	}
}

//run collision checks
scr_move_with_collisions();
#endregion

#region Sprite
//determine sprite
image_xscale = facing;
image_blend = c_white;
image_speed = 1;
imPrev = image_index;
if phase != phasePrev 
{
	image_index = 0;
	image_angle = 0;
}

	 if phase == "idle"	
	 {
		if subPhase == "" sprite_index = spr_player_idle_body;
		else if subPhase == "landing"
		{
			sprite_index = spr_player_landing_body;
			image_speed = sprite_get_number(sprite_index)/landingDuration;
		}
	 }
else if phase == "walking" {sprite_index = spr_player_walking_body; image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;}
else if phase == "walkingBackwards" {sprite_index = spr_player_walkingBackwards_body; image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;}
else if phase == "running" {sprite_index = spr_player_run_body; image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;}
else if phase == "offhand"
{
		 if subPhase == "quickfire" sprite_index = global.offhandQuickfireSprites[global.activeOffhandID];
	else if subPhase == "holding" sprite_index = global.offhandHoldingSprites[global.activeOffhandID];
	else if subPhase == "aerial" sprite_index = global.offhandAerialSprites[global.activeOffhandID];
	
	else if subPhase == "offhandDrawing" {sprite_index = spr_player_crossbow_offhandDrawing_body; image_speed = sprite_get_number(sprite_index)/(crossbowDrawDuration);}
	else if subPhase == "offhandDrawn" && !recoil {sprite_index = spr_player_crossbow_offhandDrawn_body; image_speed = 0}
	else if subPhase == "offhandDrawn" && recoil {sprite_index = spr_player_crossbow_offhandDrawnFire_body;}
	else if subPhase == "offhandHolster" {sprite_index = spr_player_crossbow_offhandHolster_body; image_speed = sprite_get_number(sprite_index)/(crossbowDrawDuration);}
	else if subPhase == "holdingDrawn" {sprite_index = spr_player_crossbow_offhandDrawn_body; image_speed = 0}

	else if subPhase == "hookedOffhandDrawing" {sprite_index = spr_player_crossbow_hookedOffhandDrawing_body; image_speed = sprite_get_number(sprite_index)/(crossbowDrawDuration);}
	else if subPhase == "hookedOffhandDrawn" && !recoil {sprite_index = spr_player_crossbow_hookedOffhandDrawn_body; image_speed = 0}
	else if subPhase == "hookedOffhandDrawn" && recoil {sprite_index = spr_player_crossbow_hookedOffhandDrawnFire_body;}
	else if subPhase == "hookedOffhandHolster" {sprite_index = spr_player_crossbow_hookedOffhandHolster_body1; image_speed = sprite_get_number(sprite_index)/(crossbowDrawDuration);}
	else if subPhase == "hookedHoldingDrawn" {sprite_index = spr_player_crossbow_hookedOffhandDrawn_body; image_speed = 0}
	
	else if subPhase == "uppercut" sprite_index = global.offhandUppercutSprites[global.activeOffhandID];
}
else if phase == "hooked"
{
	 if subPhase == "" sprite_index = spr_player_hooked_body;
else if subPhase == "stop"
	{
		sprite_index = spr_player_hookedStop_body;
		image_speed = defaultImageSpeed;
		if instance_exists(obj_hook)
		{
			if obj_hook.dir >= 180
			{
				image_angle = (obj_hook.dir+270)/2+90;
			}
			else
			{
				image_angle = (-obj_hook.dir+90)/2;
			}
		}
	}
}
else if phase == "dodging" {sprite_index = spr_player_dodging_body; image_speed = sprite_get_number(sprite_index)/(dodgeDuration);}
else if phase == "aerialDodging" {sprite_index = spr_player_aerialDodging_body; image_speed = sprite_get_number(sprite_index)/(dodgeDuration);}
else if phase == "blocking"
{
	 if subPhase == "" sprite_index = spr_player_blocking_body;
else if subPhase == "end" sprite_index = spr_player_blockingEnd_body;
else if subPhase == "reaction" sprite_index = spr_player_blockingReaction_body;
}
else if phase == "airborne"
{
	sprite_index = spr_player_airborne_body;
	image_speed = 0;
	if sign(ySpd) == -1 image_index = 0;
	else if sign(ySpd) == 0 || sign(ySpd) == 1 image_index = 1;
}
else if phase == "staggered"
{
	if subPhase == "deflected" {sprite_index = spr_player_deflected_body;}
	else if subPhase == "stagger" {sprite_index = spr_player_stagger_body; image_speed = sprite_get_number(sprite_index)/(staggerDuration);}
	else if subPhase == "flung" {sprite_index = spr_player_flung_body;}
	else if subPhase == "prone" {sprite_index = spr_player_prone_body; image_index = 0}
	else if subPhase == "recover" {sprite_index = spr_player_prone_body; image_speed = sprite_get_number(sprite_index)/(proneRecoverDuration);}
}
else if phase == "dying"
{
	if subPhase == "" {sprite_index = spr_player_dying_body; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
	else if subPhase == "staggered" {sprite_index = spr_player_stagger_body; image_speed = sprite_get_number(sprite_index)/(staggerDuration);}
	else if subPhase == "flung" {sprite_index = spr_player_flung_body;}
	else if subPhase == "prone" {sprite_index = spr_player_dyingProne_body; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
}
else if phase == "misc"
{
	if subPhase == "gutReturn"
	{
		sprite_index = spr_player_gutReturn_body;
		image_speed = sprite_get_number(sprite_index)/miscDuration;
	}
}
else if phase == "attacking" 
{
	if subPhase == "ground" && comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimation = spr_player_slice_body sprite_index = spr_player_slice2_body;
	else if subPhase == "aerial" && aerialComboSize%2 == attackNum%2 && attackNum != aerialComboSize sprite_index = spr_player_aerialSlash2_body;
	else sprite_index = attackAnimation;
	image_speed = sprite_get_number(sprite_index)/(attackDuration+attackCooldown);
}

if sprite_index == spr_player_run_body && (image_index == 7 || image_index == 3)
{
	pSys = part_system_create();
	part_system_depth(pSys,depth-1);
	pEmitter = part_emitter_create(pSys);

	pDust = part_type_create();
	part_type_sprite(pDust,spr_dust,1,1,0);
	part_type_size(pDust,6,6,0.001,0);
	part_type_orientation(pDust,0,360,0.05,0,0);
	part_type_colour1(pDust,c_white);
	part_type_alpha3(pDust,0.2,0.15,0);
	part_type_blend(pDust,1);
	part_type_direction(pDust,15,165,0,0);
	part_type_speed(pDust,0.3,0.6,-0.003,0);
	part_type_life(pDust,70,100);
	
	part_emitter_region(pSys,pEmitter,x+5*8*facing,x+5*8*facing,y+15*8,y+15*8,ps_shape_ellipse,ps_distr_linear);
	part_emitter_burst(pSys,pEmitter,pDust,2);
}
#endregion

#region Item Pickup
//standard items
for (var i = 0; i < instance_number(obj_item_parent); i++)
{
	item = instance_find(obj_item_parent,i);
	if place_meeting(x,y,item)
	{
		switch item.type
		{
			case "consumable":
				//do things
				switch object_get_name(item.object_index)
				{
					case "obj_item_test":
						
						break;
				}
				//do effect

				//destroy
				instance_destroy(item);
				break;
			case "powerup":
				//do things
				switch object_get_name(item.object_index)
				{
					case "obj_double_jump_item_test":
						global.upgradeHasDoubleJump = 1;
						break;
					case "obj_hover_item_test":
						global.upgradeHasHover = 1;
						break;
					case "obj_aerial_dodge_item_test":
						global.upgradeHasAerialDodge = 1;
						break;
				}
				//do effect
				
				//destory
				instance_destroy(item);
				break;
		}
	}
}
#endregion
}
#endregion
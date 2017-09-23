//get needed data
var IE = instance_exists(inputManager)
if IE && inputManager.xInput xInputQueue = 1;
if IE && inputManager.yInput yInputQueue = 1;
if IE && inputManager.aInput aInputQueue = 1;
if IE && inputManager.bInput bInputQueue = 1;

#region do things
phaseTimer++;
subPhaseTimer++;

	//Sub states
#region sub States

//to idle/walking/running
switch subPhase
{
	case subState.pre:
			//Sprite
		update_sprite(sprPlayerBodySwordCrossbowPre);
		image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.fire:
			//Sprite
		update_sprite(sprPlayerBodySwordCrossbowFire);
		image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.aim:
				//Sprite
		update_sprite(sprPlayerBodySwordCrossbowAim);
		image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.holding:
			//Sprite
		update_sprite(sprPlayerBodySwordCrossbowHolding);
		image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.post:
			//Sprite
		update_sprite(sprPlayerBodySwordCrossbowPost);
		image_speed = (moveSpeed/defaultMoveSpeed)*defaultImageSpeed;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
}
	
#endregion

#endregion

#region change states & substates

switch obj_comboCache.activeOffhandID
{	
	case 0:									//Crossbow
		switch subPhase
		{
			case subState.pre:
				if subPhaseTimer >= round(0.3*room_speed)
				{
					subPhase = subState.holding;
					subPhaseTimer = 0;
				}
				break;
			case subState.fire:
				if subPhaseTimer >= round(0.3*room_speed)
				{
					subPhase = subState.holding;
					subPhaseTimer = 0;
				}
				break;
			case subState.aim:
				var h = inputManager.moveInputH;
				var v = inputManager.moveInputV;
				fireAngle = point_direction(0,0,h,v);
				if !IE || !inputManager.yInputHeld
				{
					scr_player_fireCrossbow(fireAngle);
					subPhase = subState.fire
					subPhaseTimer = 0;
				}
				break;
			case subState.holding:
				if yInputQueue
				{
					yInputQueue = 0;
					if !IE || !inputManager.yInputHeld
					{
						if !hardLockOn && !softLockOn
						{
							if facing == 1 fireAngle = 0;
							else fireAngle = 180
						}
						else fireAngle = darctan((lockOnTarget.y-y)/(lockOnTarget.x-x))
						scr_player_fireCrossbow(fireAngle);
						subPhase = subState.fire;
						subPhaseTimer = 0;
					}
					else if subPhaseTimer == round(0.3*room_speed)
					{
						subPhase = subState.aim;
						subPhaseTimer = 0;
					}
				}
				else if subPhaseTimer == round(0.3*room_speed)
				{
					subPhase = subState.post;
					subPhaseTimer = 0;
				}
				break;
			case subState.post:
				if subPhaseTimer == round(0.3*room_speed)
				{
					phase = state.base;
					phaseTimer = 0;
					attackNum = 0;
					scr_player_base_subPhaseDeterminer();
				}
				break;
		}
		break;
}
	
#endregion

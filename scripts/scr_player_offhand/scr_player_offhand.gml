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

switch obj_comboCache.activeOffhandID
{	
	case 0:	
		switch subPhase
		{
			case subState.pre:
					//Sprite
				update_sprite(sprPlayerBodySwordCrossbowPre);
					//this is commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
				//auxSpriteIndex = sprPlayerAuxSwordCrossbowPre;
				image_speed = sprite_get_number(sprite_index)/(crossbowDurationPre);
					//xSpd
				xSpd = 0
					//ySpd
				ySpd += global.g;
				break;
		
			case subState.fire:
					//Sprite
				update_sprite(sprPlayerBodySwordCrossbowFire);
				auxSpriteIndex = sprPlayerAuxSwordCrossbowFire;
				image_speed = sprite_get_number(sprite_index)/(crossbowDurationFire);
					//xSpd
				xSpd = 0
					//ySpd
				ySpd += global.g;
				break;
		
			case subState.aim:
						//Sprite
				update_sprite(sprPlayerBodySwordCrossbowAim);
				auxSpriteIndex = sprPlayerAuxSwordCrossbowAim;
					//xSpd
				xSpd = 0
					//ySpd
				ySpd += global.g;
				break;
		
			case subState.holding:
					//Sprite
				update_sprite(sprPlayerBodySwordCrossbowHolding);
				auxSpriteIndex = sprPlayerAuxSwordCrossbowHolding;
				image_speed = sprite_get_number(sprite_index)/(crossbowDurationHolding);
					//xSpd
				xSpd = 0
					//ySpd
				ySpd += global.g;
				break;
		
			case subState.post:
					//Sprite
				update_sprite(sprPlayerBodySwordCrossbowPost);
					//these are commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
				//auxSpriteIndex = sprPlayerAuxSwordCrossbowPost;
				image_speed = sprite_get_number(sprite_index)/(crossbowDurationPost);
					//xSpd
				xSpd = 0
					//ySpd
				ySpd += global.g;
				break;
		}
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
				if subPhaseTimer >= round(crossbowDurationPre*room_speed)
				{
					if !IE || !inputManager.yInputHeld yInputQueue = 0;
					if yInputQueue
					{
						yInputQueue = 0;
						if !hardLockOn && !softLockOn offhandFireAngle = (facing==1)? 0:180;
						else {offhandFireAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
						scr_player_fireCrossbow(offhandFireAngle);
						subPhase = subState.fire;
						subPhaseTimer = 0;
					}
					else
					{
						yInputQueue = 0;
						subPhase = subState.aim;
						subPhaseTimer = 0;
					}
				}
				break;
			case subState.fire:
				if subPhaseTimer >= round(crossbowDurationFire*room_speed)
				{
					subPhase = subState.holding;
					subPhaseTimer = 0;
				}
				break;
			case subState.aim:
				var h = inputManager.moveInputH;
				var v = inputManager.moveInputV;
				offhandFireAngle = point_direction(0,0,h,v);
				facing = (offhandFireAngle<90||offhandFireAngle>270)? 1:-1;
				if !IE || !inputManager.yInputHeld
				{
					scr_player_fireCrossbow(offhandFireAngle);
					subPhase = subState.fire
					subPhaseTimer = 0;
				}
				break;
			case subState.holding:
				if yInputQueue
				{
					if !IE || !inputManager.yInputHeld
					{
						yInputQueue = 0;
						if hardLockOn||softLockOn facing = lockOnDir
						if !hardLockOn && !softLockOn offhandFireAngle = (facing==1)? 0:180;
						else {offhandFireAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
						scr_player_fireCrossbow(offhandFireAngle);
						subPhase = subState.fire;
						subPhaseTimer = 0;
					}
					else if subPhaseTimer == round(crossbowDurationHolding*room_speed)
					{
						yInputQueue = 0;
						subPhase = subState.aim;
						subPhaseTimer = 0;
					}
				}
				else if subPhaseTimer == round(crossbowDurationPost*room_speed)
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

	//addional properties
image_xscale = facing;

	//aux sprite data
auxSpriteXOffset = 41;
auxSpriteYOffset = -23;
auxSpriteXScale = 1;
//auxSpriteYScale = 1;			//base
auxSpriteRotation = offhandFireAngle;

if facing == -1
{
	auxSpriteRotation -= 180;
	auxSpriteXScale = -1;
}
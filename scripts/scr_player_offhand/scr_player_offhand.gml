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

phaseTimer++;
subPhaseTimer++;

if hardLockOn || softLockOn facing = lockOnDir;
else if moveH != 0 && vPhase == vState.grounded facing = sign(moveH);

	//Sub states
#region sub States

switch obj_comboCache.activeOffhandID
{	
	case 0:	
		switch vPhase
		{
			case vState.grounded:
				#region ground offhand
				switch subPhase
				{
					case subState.pre:
						if subPhaseTimer >= round(crossbowDurationPre*room_speed)
						{ 
							if IE && inputManager.yInputHeld
							{
								subPhase = subState.aim;
								subPhaseTimer = 0;
							}
							else
							{
								if !hardLockOn && !softLockOn aimAngle = (facing==1)? 0:180;
								else {aimAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y)}
								scr_player_fireCrossbow(aimAngle);
								subPhase = subState.fire;
								subPhaseTimer = 0;
							}
							reset_queue();
						}
							//xSpd
						if moveH != 0 xSpd = moveSpeed/2*sign(moveH);
						else xSpd -= xSpd/4;
							//Sprite
						if sign(moveH) == facing var newSprite = sprPlayerBodySwordCrossbowPreTowards;							
						else if sign(moveH) == -facing var newSprite = sprPlayerBodySwordCrossbowPreAway;	
						else var newSprite = sprPlayerBodySwordCrossbowPre;		
											
						var newImageSpeed = sprite_get_number(newSprite)/(crossbowDurationPre);
						update_sprite(newSprite,newImageSpeed);
							//this is commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
						//auxSpriteIndex = sprPlayerAuxSwordCrossbowPre;
						break;
		
					case subState.fire:
						if subPhaseTimer >= round(crossbowDurationFire*room_speed)
						{
							subPhase = subState.holding;
							subPhaseTimer = 0;
						}
						if !hardLockOn && !softLockOn aimAngle = (facing==1)? 0:180;
						else {aimAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y)}
							//Sprite
						if sign(moveH) == facing var newSprite = sprPlayerBodySwordCrossbowFireTowards;
						else if sign(moveH) == -facing var newSprite = sprPlayerBodySwordCrossbowFireAway;	
						else var newSprite = sprPlayerBodySwordCrossbowFire;
											
						var newImageSpeed = sprite_get_number(newSprite)/(crossbowDurationFire);
						update_sprite(newSprite,newImageSpeed);
						auxSpriteIndex = sprPlayerAuxSwordCrossbowFire;
							//xSpd
						if moveH != 0 xSpd = moveSpeed/2*sign(moveH);
						else xSpd -= xSpd/4;
						break;
		
					case subState.aim:
						var h = inputManager.moveInputH;
						var v = inputManager.moveInputV;
						if !(h==0 && v==0) aimAngle = point_direction(0,0,h,v);
						facing = (aimAngle<90||aimAngle>270)? 1:-1;
						if !IE || !inputManager.yInputHeld
						{
							scr_player_fireCrossbow(aimAngle);
							subPhase = subState.fire
							subPhaseTimer = 0;
						}
							//Sprite
						if sign(moveH) == facing var newSprite = sprPlayerBodySwordCrossbowAimTowards;							
						else if sign(moveH) == -facing var newSprite = sprPlayerBodySwordCrossbowAimAway;	
						else var newSprite = sprPlayerBodySwordCrossbowAim;
											
						update_sprite(newSprite,1);
						auxSpriteIndex = sprPlayerAuxSwordCrossbowAim;
							//xSpd
						xSpd -= xSpd/4;
						break;
		
					case subState.holding:
						if yInputQueue
						{
							if !IE || !inputManager.yInputHeld
							{
								reset_queue();
								if hardLockOn||softLockOn facing = lockOnDir
								if !hardLockOn && !softLockOn aimAngle = (facing==1)? 0:180;
								else {aimAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
								scr_player_fireCrossbow(aimAngle);
								subPhase = subState.fire;
								subPhaseTimer = 0;
							}
							else if subPhaseTimer == round(crossbowDurationHolding*room_speed)
							{
								reset_queue();
								subPhase = subState.aim;
								subPhaseTimer = 0;
							}
						}
						else if subPhaseTimer == round(crossbowDurationPost*room_speed)
						{
							reset_queue();
							subPhase = subState.post;
							subPhaseTimer = 0;
						}
							//Sprite
						if sign(moveH) == facing var newSprite = sprPlayerBodySwordCrossbowHoldingTowards;							
						else if sign(moveH) == -facing var newSprite = sprPlayerBodySwordCrossbowHoldingAway;	
						else var newSprite = sprPlayerBodySwordCrossbowHolding;
											
						var newImageSpeed = sprite_get_number(newSprite)/(crossbowDurationHolding);
						update_sprite(newSprite,newImageSpeed);
						auxSpriteIndex = sprPlayerAuxSwordCrossbowHolding;
							//xSpd
						if moveH != 0 xSpd = moveSpeed/2*sign(moveH);
						else xSpd -= xSpd/4;
						break;
		
					case subState.post:
						if subPhaseTimer == round(0.3*room_speed)
						{
							phase = state.base;
							phaseTimer = 0;
							scr_player_base_subPhaseDeterminer();
						}
							//Sprite
						if sign(moveH) == facing var newSprite = sprPlayerBodySwordCrossbowPostTowards;							
						else if sign(moveH) == -facing var newSprite = sprPlayerBodySwordCrossbowPostAway;	
						else var newSprite = sprPlayerBodySwordCrossbowPost;
											
						var newImageSpeed = sprite_get_number(newSprite)/(crossbowDurationPost);
						update_sprite(newSprite,newImageSpeed);
							//these are commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
						//auxSpriteIndex = sprPlayerAuxSwordCrossbowPost;
							//xSpd
						if moveH != 0 xSpd = moveSpeed/2*sign(moveH);
						else xSpd -= xSpd/4;
						break;
				}
				#endregion
				break;
			case vState.jumping:
			case vState.midAir:
				#region aerial offhand
				switch subPhase
				{
					case subState.pre:
						if subPhaseTimer >= round(crossbowDurationAerialPre*room_speed)
						{
							reset_queue();
							if !hardLockOn && !softLockOn aimAngle = (facing==1)? 0:180;
							else {aimAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
							scr_player_fireCrossbow(aimAngle);
							subPhase = subState.fire;
							subPhaseTimer = 0;
							ySpd = 2*crossbowAerialBounce;
						}
							//Sprite
						var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowAerialPre)/(crossbowDurationAerialPre);
						update_sprite(sprPlayerBodySwordCrossbowAerialPre,newImageSpeed);
							//this is commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
						//auxSpriteIndex = sprPlayerAuxSwordCrossbowPre;
							//xSpd
						if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed/2,moveSpeed/2);
						else xSpd -= xSpd/20;
							//ySpd
						ySpd -= global.g*(1/2);		//1/2 G
						break;
						
					case subState.fire:
						if subPhaseTimer >= round(crossbowDurationAerialFire*room_speed)
						{
								reset_queue();
								subPhase = subState.holding;
								subPhaseTimer = 0;
						}
							//Sprite
						var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowAerialFire)/(crossbowDurationAerialFire);
						update_sprite(sprPlayerBodySwordCrossbowAerialFire,newImageSpeed);
						auxSpriteIndex = sprPlayerAuxSwordCrossbowFire;
						if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed/2,moveSpeed/2);
						else xSpd -= xSpd/20;
							//ySpd
						ySpd -= global.g*(1/4);		//3/4 G
						break;

					case subState.holding:
						if yInputQueue
						{
							reset_queue();
							if !hardLockOn && !softLockOn aimAngle = (facing==1)? 0:180;
							else {aimAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
							scr_player_fireCrossbow(aimAngle);
							subPhase = subState.fire;
							subPhaseTimer = 0;
							ySpd = crossbowAerialBounce;
						}
						else if subPhaseTimer == round(crossbowDurationAerialHolding*room_speed)
						{
							phase = state.base;
							phaseTimer = 0;
							scr_player_base_subPhaseDeterminer();
						}
							//Sprite
						var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowAerialHolding)/(crossbowDurationAerialHolding);
						update_sprite(sprPlayerBodySwordCrossbowAerialHolding,newImageSpeed);
						auxSpriteIndex = sprPlayerAuxSwordCrossbowHolding;
							//xSpd
						if moveH != 0 xSpd = clamp(xSpd+moveH*moveSpeed/15,-moveSpeed/2,moveSpeed/2);
						else xSpd -= xSpd/20;
							//ySpd
						ySpd -= global.g*(1/4);		//3/4 G
						break;
												
				}				
				#endregion
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
auxSpriteRotation = aimAngle;

if facing == -1
{
	auxSpriteRotation -= 180;
	auxSpriteXScale = -1;
}
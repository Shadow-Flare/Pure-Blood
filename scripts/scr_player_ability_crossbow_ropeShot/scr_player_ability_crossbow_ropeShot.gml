if subPhase == subState.none subPhase = subState.pre;

#region ground offhand
switch subPhase
{
	case subState.pre:
		if subPhaseTimer >= round(ropeShotDurationPre*room_speed)
		{
			reset_queue();
			aimAngle = point_direction(x,y,ropeShotTarget[0],ropeShotTarget[1]);
			var RSSpeed = (vPhase = vState.grounded) ? ropeShotSpeedGround:ropeShotSpeedAerial;
			ropeShotID = scr_player_ability_crossbow_ropeShot_fire(aimAngle,RSSpeed);
			subPhase = subState.fire;
			subPhaseTimer = 0;
		}
			//Sprite
		switch vPhase
		{
			case vState.grounded:
				var newSprite = sprPlayerBodyDefaultRopeShotPre;
				break;
			case vState.jumping:
			case vState.midAir:
				var newSprite = sprPlayerBodyDefaultRopeShotAerialPre;
				break;
		}
		update_sprite(newSprite,-ropeShotDurationPre);
			//this is commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
		//auxSpriteIndex = sprPlayerAuxSwordCrossbowPre;
			//xSpd
		xSpd -= xSpd/20;
			//ySpd
		ySpd -= ySpd/2
		break;
						
	case subState.fire:
		if subPhaseTimer >= round(ropeShotDurationFire*room_speed)
		{
				subPhase = subState.holding;
				subPhaseTimer = 0;
		}
			//Sprite
		switch vPhase
		{
			case vState.grounded:
				var newSprite = sprPlayerBodyDefaultRopeShotFire;
				break;
			case vState.jumping:
			case vState.midAir:
				var newSprite = sprPlayerBodyDefaultRopeShotAerialFire;
				break;
		}
		update_sprite(newSprite,-ropeShotDurationPre);
		auxSpriteIndex = sprPlayerAuxDefaultCrossbowFire;
		//xSpd
		xSpd -= xSpd/20;
			//ySpd
		ySpd -= ySpd/2
		break;

	case subState.holding:
		if !instance_exists(ropeShotID) || ropeShotID = noone
		{
			ropeShotID = noone;
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
		else switch ropeShotID.phase
		{
			case ropeshotPhase.shooting:
				//do nothing and wait
				xSpd -= xSpd/4;
				ySpd -= ySpd/4;
				break;
			case ropeshotPhase.returning:
				xSpd -= xSpd/4;
				ySpd -= ySpd/4;
				break;
			case ropeshotPhase.hookedPoint:
				//Move to point, disable when near
				var dir = point_direction(x,y,ropeShotID.x,ropeShotID.y);
				var spd = ropeShotSpeed;
				xSpd = spd*dcos(dir);
				ySpd = -spd*dsin(dir);
				if point_distance(x,y,ropeShotID.x,ropeShotID.y) <= ropeShotHookDistGrapplePoint
				{
					ropeShotID.phase = ropeshotPhase.returning;
					ropeShotID.speed = -ropeShotSpeedAerial*1.2;
					phase = state.base;
					vPhase = vState.jumping;
					jumpNum++;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
				break;
			case ropeshotPhase.hookedSwing:
				//Move about point
					//move dist
				if y > ropeShotID.y ropeShotSwingDist = clamp(ropeShotSwingDist+InputManager.moveInputV/2,ropeShotSwingDistMin,ropeShotSwingDistMax);
				else
				{
					ropeShotSwingDist = min(point_distance(x,y,ropeShotID.x,ropeShotID.y),ropeShotSwingDist);
					ropeShotSwingDist = clamp(ropeShotSwingDist-1,ropeShotSwingDistMin/2,ropeShotSwingDistMax);
				}
				
					//sort out distance
				var dist = point_distance(x,y,ropeShotID.x,ropeShotID.y);
				var desiredDist = ropeShotSwingDist;
				var dir = point_direction(x,y,ropeShotID.x,ropeShotID.y);
				var desiredX = ropeShotID.x-desiredDist*dcos(dir);
				var desiredY = ropeShotID.y+desiredDist*dsin(dir);
				var distToDesired = point_distance(x,y,desiredX,desiredY);
				
				var lengthMove = clamp(PlayerStats.moveSpeed*1.2,0,distToDesired);
				if lengthMove >= 0.2
				{
					if desiredDist>dist dir+=180;
					var endPointX = x+lengthMove*dcos(dir);
					var endPointY = y-lengthMove*dsin(dir);
				}
				else
				{
					var endPointX = desiredX;
					var endPointY = desiredY;
				}
					
					//determine pendulum properties
				var len = point_distance(endPointX,endPointY,ropeShotID.x,ropeShotID.y);
				var ang = point_direction(endPointX,endPointY,ropeShotID.x,ropeShotID.y)-270;
				var angularAcc = (GameManager.grav*dsin(ang))*360/(2*pi*len);
				ropeShotAngularSpeed += angularAcc + InputManager.moveInputH*(1/20);
				ropeShotAngularSpeed *= 0.98;
				ang += ropeShotAngularSpeed;
				desiredX = ropeShotID.x-len*dcos(ang+270);
				desiredY = ropeShotID.y+len*dsin(ang+270);
				
					//finalize speed
				xSpd = desiredX-x;
				ySpd = desiredY-y;
				
				if aInputQueue
				{
					reset_queue();
					vPhase = vState.jumping;
					xSpd += InputManager.moveInputH*PlayerStats.jumpPow/3;
					ySpd = -PlayerStats.jumpPow;
					jumpNum++;
					
					ropeShotID.phase = ropeshotPhase.returning;
					ropeShotID.speed = -ropeShotSpeedAerial*1.2;
					ropeShotID = noone;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}	
				else if vPhase = vState.grounded && ropeShotID.phaseTimer >= round(0.5*room_speed)
				{
					ropeShotID.phase = ropeshotPhase.returning;
					ropeShotID.speed = -ropeShotSpeedAerial*1.2;
					ropeShotID = noone;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
				break;
			case ropeshotPhase.hookedEnemyPull:
				//Move __enemy__ to point, disable when near
				xSpd = 0;
				ySpd = 0;
				var enemy = ropeShotID.mount;
				var dir = point_direction(ropeShotID.x,ropeShotID.y,x,y);
				var spd = PlayerStats.moveSpeed*2.6;
				enemy.phase = state.hitReaction;
				enemy.subPhase = subState.aerialStagger;
				enemy.phaseTimer = 0;
				enemy.subPhaseTimer = 0;
				enemy.isHooked = ropeShotID;
				//enemy.ySpd -= GameManager.grav;		//disable gravity
				if point_distance(x,y,ropeShotID.x,ropeShotID.y) <= ropeShotHookDistGrapplePoint
				{
					enemy.xSpd = 0;
					enemy.ySpd = 0
					enemy.isHooked = noone;
					ropeShotID.phase = ropeshotPhase.returning;
					ropeShotID.speed = -ropeShotSpeedAerial*1.2;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
				break;
			case ropeshotPhase.hookedPlayerPull:
				//Move to point, disable when near
				var dir = point_direction(x,y,ropeShotID.x,ropeShotID.y);
				var spd = PlayerStats.moveSpeed*2.6;
				xSpd = spd*dcos(dir);
				ySpd = -spd*dsin(dir);
				if point_distance(x,y,ropeShotID.x,ropeShotID.y) <= ropeShotHookDistGrapplePoint
				{
					ropeShotID.phase = ropeshotPhase.returning;
					ropeShotID.speed = -ropeShotSpeedAerial*1.2;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
				break;
		}
			//Sprite
		switch vPhase
		{
			case vState.grounded:
				var newSprite = sprPlayerBodyDefaultRopeShotHolding;
				break;
			case vState.jumping:
			case vState.midAir:
				var newSprite = sprPlayerBodyDefaultRopeShotAerialHolding;
				break;
		}
		update_sprite(newSprite,1);
		auxSpriteIndex = sprPlayerAuxDefaultCrossbowHolding;
		break;
												
}		
#endregion
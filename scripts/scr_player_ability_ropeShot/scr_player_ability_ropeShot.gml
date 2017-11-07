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
			scr_player_fireRopeShot(aimAngle,RSSpeed);
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
		if !instance_exists(objRopeShot)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
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
			//xSpd
		xSpd -= xSpd/20;
			//ySpd
		ySpd -= ySpd/2
		break;
												
}		
#endregion
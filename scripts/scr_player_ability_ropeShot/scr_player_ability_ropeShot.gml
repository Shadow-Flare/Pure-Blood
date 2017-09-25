if subPhase == subState.none subPhase = subState.pre;

switch subPhase
{
	case subState.pre:
		if subPhaseTimer >= round(crossbowDurationPre*room_speed)
		{
			if !IE || !inputManager.yInputHeld yInputQueue = 0;
			reset_queue();
			if yInputQueue
			{
				if !hardLockOn && !softLockOn abilityFireAngle = (facing==1)? 0:180;
				else {abilityFireAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
				scr_player_ability_ropeShot_fire(abilityFireAngle);
				subPhase = subState.fire;
				subPhaseTimer = 0;
			}
			else
			{
				subPhase = subState.aim;
				subPhaseTimer = 0;
			}
		}
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowPre)/(crossbowDurationPre);
		update_sprite(sprPlayerBodySwordCrossbowPre,newImageSpeed);
			//this is commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
		//auxSpriteIndex = sprPlayerAuxSwordCrossbowPre;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.fire:
		if subPhaseTimer >= round(crossbowDurationFire*room_speed)
		{
			subPhase = subState.holding;
			subPhaseTimer = 0;
		}
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowFire)/(crossbowDurationFire);
		update_sprite(sprPlayerBodySwordCrossbowFire,newImageSpeed);
		auxSpriteIndex = sprPlayerAuxSwordCrossbowFire;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
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
				//Sprite
		update_sprite(sprPlayerBodySwordCrossbowAim,0);
		auxSpriteIndex = sprPlayerAuxSwordCrossbowAim;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.holding:
		if yInputQueue
		{
			if !IE || !inputManager.yInputHeld
			{
				reset_queue();
				if hardLockOn||softLockOn facing = lockOnDir
				if !hardLockOn && !softLockOn offhandFireAngle = (facing==1)? 0:180;
				else {offhandFireAngle = point_direction(x,y,lockOnTarget.x,lockOnTarget.y); facing = lockOnDir;}
				scr_player_fireCrossbow(offhandFireAngle);
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
			subPhase = subState.post;
			subPhaseTimer = 0;
		}
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowHolding)/(crossbowDurationHolding);
		update_sprite(sprPlayerBodySwordCrossbowHolding,newImageSpeed);
		auxSpriteIndex = sprPlayerAuxSwordCrossbowHolding;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
		
	case subState.post:
		if subPhaseTimer == round(0.3*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
			//Sprite
		newImageSpeed = sprite_get_number(sprPlayerBodySwordCrossbowPost)/(crossbowDurationPost);
		update_sprite(sprPlayerBodySwordCrossbowPost,newImageSpeed);
			//these are commented out because of how the sprites currently work, currently the arm is merged with the body sprite for this subphase
		//auxSpriteIndex = sprPlayerAuxSwordCrossbowPost;
			//xSpd
		xSpd = 0
			//ySpd
		ySpd += global.g;
		break;
}

#region do things
phaseTimer++;
subPhaseTimer++;

	#region subState behavior

	//lock On facing
switch aggroPhase
{
	case enemyAggroState.passive:
		if driveMove != 0 facing = driveMove;
		break;
	case enemyAggroState.attacking:
		facing = sign(target.x-x);
		break;
}

switch subPhase
{
	case subState.idle:
			//sprite
		update_sprite_enemy(sprZombieBodyIdle,1);
			//xspd
		scr_enemy_base_subPhaseDeterminer();
		xSpd-=xSpd/4;
		break;
	case subState.running:
			//sprite
		update_sprite_enemy(sprZombieBodyRunning,1);
			//xspd
		xSpd = facing*statCache.moveSpeed;
		scr_enemy_base_subPhaseDeterminer();
		break;
	case subState.airborne:
		if vPhase = vState.grounded
		{
			jumpNum = 0;
			subPhase = subState.landing;
			subPhaseTimer = 0;
			if driveMove != 0 scr_enemy_base_subPhaseDeterminer();
		}
			//sprite
		update_sprite_enemy(sprZombieBodyAirborne,0);
		if ySpd < 0 image_index = 0;
		else image_index = 1;
			//xSpd
		if driveMove != 0 xSpd = clamp(xSpd+driveMove*statCache.moveSpeed/15,-statCache.moveSpeed,statCache.moveSpeed);
		else xSpd -= xSpd/20;
		break;
	case subState.landing:
		if subPhaseTimer >= round(landingDuration*room_speed)
		{
			scr_enemy_base_subPhaseDeterminer();
		}
		if vPhase != vState.grounded scr_enemy_base_subPhaseDeterminer();
			//Sprite
		var newImageSprite = sprZombieBodyLanding;
		var newImageSpeed = sprite_get_number(newImageSprite)/landingDuration;
		update_sprite_enemy(newImageSprite,newImageSpeed);
			//xSpd
		xSpd -= xSpd/4;
		break;
}

	#endregion

#endregion

#region change state
	//Jumping
	if driveJump
	{
		reset_drives();
		if vPhase == vState.grounded
		{
			vPhase = vState.jumping;
			ySpd = -statCache.jumpPow;
			jumpNum++;
		}
	}
	
	//to action
	else if driveAction != 0 && vPhase = vState.grounded
	{
		if actionHardCooldownTimer == -1
		{
			//initial data & tranistion
			switch driveAction
			{
				case 1:
					phase = state.action1;
					break;
				case 2:
					phase = state.action2;
					break;
				case 3:
					phase = state.action3;
					break;
				case 4:
					phase = state.action4;
					break;
				case 5:
					phase = state.action5;
					break;
			}
			actionHardCooldownTimer = 0;
			subPhase = subState.actionSub1;
			phaseTimer = 0;
			subPhaseTimer = 0;
			reset_drives();
		}
	}

#endregion
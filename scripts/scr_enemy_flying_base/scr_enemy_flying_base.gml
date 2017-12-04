phaseTimer++;
subPhaseTimer++;

	//speed factor declare
var speedFactor = 0;

switch subPhase
{
	case subState.idle:
			//transition
		scr_enemy_flying_base_subPhaseDeterminer();
		if abs(xTarget-x) >= 8 facing = sign(xTarget-x);
			//speed factor
		speedFactor = 0.5;
			//sprite
		update_sprite_enemy(sprBASEBodyIdle,1)
		break;
	case subState.running:
			//transition
		scr_enemy_flying_base_subPhaseDeterminer();
		if abs(xTarget-x) >= 8 facing = sign(xTarget-x);
			//speed factor
		speedFactor = 1;
			//sprite
		update_sprite_enemy(sprBASEBodyRunning,1)
		break
}

//transitions
	//to action
	if driveAction != 0
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
			driveAction = 0;
			actionHardCooldownTimer = 0;
			subPhase = subState.actionSub1;
			phaseTimer = 0;
			subPhaseTimer = 0;
			reset_drives();
		}
	}
	
	//movement
		//gravity canceller
ySpd -= GameManager.grav;
#region non-linear speed (DISABLED)
//var dir = point_direction(x,y,xTarget,yTarget);
//var xAcc = clamp((statCache.moveSpeed*speedFactor)*dcos(dir),-abs(xTarget-x)/2,abs(xTarget-x)/8);
//var yAcc = clamp(-(statCache.moveSpeed*speedFactor)*dsin(dir),-abs(yTarget-y)/2,abs(yTarget-y)/8);
//xSpd += xAcc;
//ySpd += yAcc;
//if point_distance(x,y,xTarget,yTarget) <= 16 xSpd -= xSpd/20;
//ySpd -= ySpd/20;
//var absSpeed = sqrt(power(xSpd,2)+power(ySpd,2));
//var dir = point_direction(0,0,xSpd,ySpd);
//absSpeed = clamp(absSpeed,-statCache.moveSpeed,statCache.moveSpeed);
//xSpd = absSpeed*dcos(dir);
//ySpd = -absSpeed*dsin(dir);
#endregion

#region linear speed
//var dir = point_direction(x,y,xTarget,yTarget);
var MS = statCache.moveSpeed*speedFactor;
xSpd = (xTarget-x)/10;
ySpd = (yTarget-y)/10;
var absSpeed = sqrt(power(xSpd,2)+power(ySpd,2));
var dir = point_direction(0,0,xSpd,ySpd);
var absSpeed = clamp(absSpeed,-MS,MS);
xSpd = absSpeed*dcos(dir);
ySpd = -absSpeed*dsin(dir);
#endregion
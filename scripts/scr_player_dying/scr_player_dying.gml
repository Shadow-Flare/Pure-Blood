//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

if phaseTimer == 0 image_index = 0;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
		if subPhaseTimer >= round(room_speed*deathDuration)
		{
			isDead = true;
			actorType = actorTypes.corpse;
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite(sprPlayerBodyDefaultDying,-deathDuration)
		break;
		
	case subState.flung:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deathDuration)
				{
					isDead = true;
					actorType = actorTypes.corpse;
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite(sprPlayerBodyDefaultDyingProne,-deathDuration)
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite(sprPlayerBodyDefaultFlung,1)
				break
		}
		break;
}
		
#endregion

if isDead
{
	image_alpha -= deathFadeDuration/60;
	if image_alpha <= 0
	{
		//DEATH CODE
	}
}
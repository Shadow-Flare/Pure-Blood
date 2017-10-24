///@arg driveActionOnDeath

driveAction = argument0;

//to on-death action
if driveAction != 0
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
	subPhase = subState.actionSub1;
	phaseTimer = 0;
	subPhaseTimer = 0;
}

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
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		var newImage = sprZombieBodyDying;
		var newImageSpeed = sprite_get_number(newImage)/(deathDuration);
		update_sprite_enemy(newImage,newImageSpeed);
		break;
		
	case subState.flung:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deathDuration)
				{
					isDead = true;
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				var newImage = sprZombieBodyDyingProne;
				var newImageSpeed = sprite_get_number(newImage)/(deathDuration)
				update_sprite_enemy(newImage,newImageSpeed)
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite_enemy(sprZombieBodyFlung,1)
				break
		}
		break;
}
		
#endregion

if isDead
{
	image_speed = 0;
	image_alpha -= 1/(60*deathFadeDuration);
	if image_alpha <= 0
	{
		instance_destroy();
	}
}
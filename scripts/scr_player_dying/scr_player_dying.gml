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
			GameManager.playerDead = true;
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordDying)/(deathDuration)
		update_sprite(sprPlayerBodySwordDying,newImageSpeed)
		break;
		
	case subState.flung:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deathDuration)
				{
					GameManager.playerDead = true;
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				var newImageSpeed = sprite_get_number(sprPlayerBodySwordDyingProne)/(deathDuration)
				update_sprite(sprPlayerBodySwordDyingProne,newImageSpeed)
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite(sprPlayerBodySwordFlung,1)
				break
		}
		break;
}
		
#endregion
	
	//addional properties
image_xscale = facing;
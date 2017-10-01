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
	case subState.staggered:
		if subPhaseTimer >= round(room_speed*staggeredDuration)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		var newImageSpeed = sprite_get_number(sprPlayerBodySwordStagger)/(staggeredDuration)
		update_sprite(sprPlayerBodySwordStagger,newImageSpeed)
		break;
		
	case subState.flung:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*proneDuration)
				{
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				var newImageSpeed = sprite_get_number(sprPlayerBodySwordProne)/(proneDuration)
				update_sprite(sprPlayerBodySwordProne,newImageSpeed)
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
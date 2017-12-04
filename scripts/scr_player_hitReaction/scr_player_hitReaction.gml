//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

if subPhaseTimer == 0 baseSpriteIndex = -4;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.staggered:
		if subPhaseTimer >= round(room_speed*staggeredDuration)
		{
			phased = false;
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite(sprPlayerBodyDefaultStagger,-staggeredDuration)
		break;
		
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				subPhase = subState.stunned;
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite(sprPlayerBodyDefaultAerialStagger,1)
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//xSpd
				xSpd -= xSpd/80;
					//Sprite
				update_sprite(sprPlayerBodyDefaultAerialStagger,1)
				break
		}
		break;
	case subState.deflected:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deflectDuration)
				{
					phased = false;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite(sprPlayerBodyDefaultDeflect,-deflectDuration)
				break;
			case vState.jumping:
			case vState.midAir:
				if subPhaseTimer >= round(room_speed*deflectDuration)
				{
					phased = false;
					phase = state.base;
					phaseTimer = 0;
					scr_player_base_subPhaseDeterminer();
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite(sprPlayerBodyDefaultAerialDeflect,-deflectDuration)
				break;
		}
		break;
	case subState.stunned:
		if subPhaseTimer >= round(room_speed*stunnedDuration)
		{
			phased = false;
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite(sprPlayerBodyDefaultStunned,-stunnedDuration)
		break;
}
		
#endregion

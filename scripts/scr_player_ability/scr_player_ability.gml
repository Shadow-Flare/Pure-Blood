//get needed data
var IE = instance_exists(InputManager)
if IE && InputManager.xInput xInputQueue = 1;
if IE && InputManager.yInput yInputQueue = 1;
if IE && InputManager.aInput aInputQueue = 1;
if IE && InputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch ComboCache.activeOffhandActivatableID
{
	//rope shot
	case 0:
		scr_player_ability_ropeShot();
		break;
}
		
#endregion
	
	//addional properties
image_xscale = facing;
//get needed data
var IE = instance_exists(inputManager)
if IE && inputManager.xInput xInputQueue = 1;
if IE && inputManager.yInput yInputQueue = 1;
if IE && inputManager.aInput aInputQueue = 1;
if IE && inputManager.bInput bInputQueue = 1;

phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch obj_comboCache.activeOffhandActivatableID
{
	//rope shot
	case 0:
		scr_player_ability_ropeShot();
		break;
}
		
#endregion
	
	//addional properties
image_xscale = facing;
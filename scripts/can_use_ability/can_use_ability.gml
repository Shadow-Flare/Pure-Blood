//fill this with conditions for every activatable, these factor in mainly targets and mana
switch obj_comboCache.activeOffhandActivatableID
{
		//rope shot
	case 0:
		if ropeShotTarget != noone return true;
		break;
}
return false;
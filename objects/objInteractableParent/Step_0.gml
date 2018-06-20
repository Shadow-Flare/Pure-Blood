playerCanUse = false;
if usable && instance_exists(objPlayer) && abs(x-objPlayer.x) <= useRange && abs(y-objPlayer.y) <= useRange*2 && objPlayer.canAct
{
	playerCanUse = true;
}
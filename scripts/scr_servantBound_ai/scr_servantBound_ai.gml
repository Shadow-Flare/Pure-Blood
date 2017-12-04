with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

if hasBeenHit && lastHitType == 3
{
	driveAction = 1;
	lastHitType = -1;
}

hasBeenHit = false;

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}
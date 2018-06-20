with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

if lastHitTypes[| damageType.fire]
{
	driveAction = 1;
}

hasBeenHit = false;

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}
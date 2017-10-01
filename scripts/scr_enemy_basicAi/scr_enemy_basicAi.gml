//@description scr_enemy_aggroScan(aggroReset?)

//reset target
if argument0 target = noone

if target == noone
{
	var posTarget = instance_nearest(x,y,objPlayer);
	var xSearchDist = (x-posTarget.x);
	var ySearchDist = (y-posTarget.y);
	var searchDist = sqrt(power(xSearchDist,2)+power(ySearchDist,2));
	if searchDist <= aggroRange && posTarget.phase != "dying"
	{
		target = posTarget;
	}
}

//platfromAI
if target != noone && target.y+(target.bbox_bottom-target.bbox_top)/2-32 > y+(bbox_bottom-bbox_top)/2 && (phase == "idle" || phase == "walking" || (phase == "attack2" && subPhase == "walking"))
{
	dropThroughPlatforms = 1;
}
else
{
	dropThroughPlatforms = 0;
}

//attack delay
if !canAttack
{
	canAttackTimer++
	if canAttackTimer == round(room_speed*0.5) {canAttack = 1; canAttackTimer = 0;}
}
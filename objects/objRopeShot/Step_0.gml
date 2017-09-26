if place_meeting(x,y,obj_grapple_parent) && phase == "shooting"
{
	mount = instance_place(x,y,obj_grapple_parent);
	x = mount.x;
	y = mount.y;
	phase = "hooked";
	speed = 0;
	if mount.object_index = obj_grapple_swing hookDist = 240*2.5;
	else if mount.object_index = obj_grapple_mount hookDist = 240;
	if point_distance(caster.x,caster.y,x,y) > hookDist pullDir = 1;
	else if point_distance(caster.x,caster.y,x,y) <= hookDist pullDir = -1;
}
else if place_meeting(x,y,obj_enemy_parent) && instance_place(x,y,obj_enemy_parent).phase != "dying" && phase == "shooting"
{
	mount = instance_place(x,y,obj_enemy_parent);
	x = mount.x;
	y = mount.y;
	if mount.hookWeight == 0 phase = "hookedEnemyPull";
	else if mount.hookWeight == 1 phase = "hookedEnemyTravel";
	speed = 0;
}
else if (point_distance(initialX,initialY,x,y) >= maxDist || !place_free(x,y)) && phase == "shooting"
{
	phase = "returning";
	speed = -2*defaultSpeed;
}

if phase == "returning"
{
	direction = point_direction(caster.x,caster.y,x,y)
	speed = -defaultSpeed;
	if place_meeting(x,y,caster)
	{
		instance_destroy();
	}
}

if phase == "hooked"
{
	if (pullDir == 1 && point_distance(caster.x,caster.y,x,y)-caster.hookedSpeed > hookDist)
	 ||(pullDir == -1 && point_distance(caster.x,caster.y,x,y)+caster.hookedSpeed < hookDist)
	{
		phase = "hooked";
		moveDir = point_direction(caster.x,caster.y,x,y);
	}
	else
	{
		phase = "hookedStop";
		while point_distance(caster.x,caster.y,x,y) > hookDist
		{
			moveDir = point_direction(caster.x,caster.y,x,y);
			caster.x += dcos(moveDir);
			caster.y += -dsin(moveDir);
		}
		caster.xSpd = 0;
		caster.ySpd = 0;
		aSpd = 0;
	}
	if xPrev == floor(caster.x) && yPrev == floor(caster.y)
	{
		phase = "hookedStop";
		aSpd = 0;
	}
	xPrev = floor(caster.x);
	yPrev = floor(caster.y);
}

if phase == "hookedStop"
{
	//friction Stats
	accRatio = 2.25;
	accSinRatio = 1.5;
	spdFrictionRatio = 1;
	moveInputRatio = 0.8;
	maxASpd = 240/room_speed;
	//movements
	dir = point_direction(x,y,caster.x,caster.y);
	aAcc = dsin(abs(dir-270)/accSinRatio)*accRatio*(360/hookDist);
	if dir < 90 || dir > 270 aAcc *= -1;
	aSpd += aAcc;
	aSpd -= aSpd/(30/spdFrictionRatio);
	dir2 = dir+aSpd;
	dx = x+round(hookDist*dcos(dir2));
	dy = y-round(hookDist*dsin(dir2));

	if dir > 180 && (abs(dir-270) < 10 || sign(global.moveInput) = sign(dir-270))
	{
		aSpd += ceil(global.moveInput)*moveInputRatio*0.2;
	}
	if abs(aSpd) > maxASpd aSpd = sign(aSpd)*maxASpd;
	
	caster.xSpd = dx-caster.x;
	caster.ySpd = dy-caster.y;
	
	if caster.onGround aSpd = 0;
	with caster
	{
		hookDistMove = floor(global.moveInputV*8);
		shiftX = (sign(hookDistMove)*dcos(other.dir));
		shiftY = (sign(hookDistMove)*dsin(other.dir));
		moved = 0;
		while place_free(x+shiftX,y-shiftY) && moved <= abs(hookDistMove)
		{
			other.hookDist += sign(hookDistMove);
			moved++;
		}
		if moved <= abs(hookDistMove) other.aSpd = 0;	
	}
	if hookDist < 240 hookDist = 240;
	else if hookDist > maxDist hookDist = maxDist;
}

if phase == "hookedEnemyPull"
{
	x = mount.x;
	y = mount.y;
	mount.phase = "hooked";
	var enemySpeed = 30
	var enemyDestX = caster.x + sign(mount.x-caster.x)*8*16;
	var enemyDestY = caster.y;
	var enemyDestDir = point_direction(mount.x,mount.y,enemyDestX,enemyDestY);
	var enemyXSpd = enemySpeed*dcos(enemyDestDir);
	var enemyYSpd = -enemySpeed*dsin(enemyDestDir);
	var enemyDistAfterMove = point_distance(mount.x+enemyXSpd,mount.y+enemyYSpd,enemyDestX,enemyDestY);
	if enemyDistAfterMove > enemySpeed {mount.xSpd = enemyXSpd; mount.ySpd = enemyYSpd;}
	else
	{
		mount.x = enemyDestX;
		mount.y = enemyDestY;
		phase = "returning";
		if caster.onGround
		{
			mount.phase = "stagger";
			mount.staggerTimer = 0;
			mount.xSpd = 0;
			mount.ySpd = 0;
		}
		else
		{
			mount.phase = "aerialAttacked";
			mount.aerialAttackedTimer = 0;
			mount.xSpd = 0;
			mount.ySpd = -4;
		}
	}
}
//move if not free
var safeCheckDist = 32;
//nonsolid
with obj_block_nonSolid solid = 1

					//this is awful and should be changed
if !place_free(x,y)
{
	for(var i = 0; i < safeCheckDist; i++)
	{
		for(var j = 0; j < safeCheckDist; j++)
		{
			     if place_free(x+i,y+j) {x+=i; y+=j; safeCheckDist = 0;}
			else if place_free(x+i,y-j) {x+=i; y-=j; safeCheckDist = 0;}
			else if place_free(x-i,y+j) {x-=i; y+=j; safeCheckDist = 0;}
			else if place_free(x-i,y-j) {x-=i; y-=j; safeCheckDist = 0;}
		}
	}
}

//do V collision check
if(!place_free(x,y+ySpd))
{
	if place_free(x,floor(y)) y = floor(y);
	while(place_free(x,y+sign(ySpd))) y+=sign(ySpd);
	ySpd = 0;
}

y+=ySpd;

// do H collision check
if place_meeting(x+xSpd,y,objActorParent) && !phased
{
	var othActor = instance_place(x+xSpd,y,objActorParent);
	if !othActor.phased
	{
		var dirToOther = sign(othActor.x-x);
		while place_meeting(x+xSpd,y,othActor) xSpd-=dirToOther/10;
		if abs(xSpd) > statCache.moveSpeed xSpd = sign(xSpd)*statCache.moveSpeed;
	}
}

if(!place_free(x+xSpd,y))
{
	while(place_free(x+sign(xSpd)/10,y)) x+=sign(xSpd)/10;
	xSpd = 0;
}

x+=xSpd

with obj_block_nonSolid solid = 0;
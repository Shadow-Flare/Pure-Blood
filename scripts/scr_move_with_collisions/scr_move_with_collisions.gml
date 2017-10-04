//move if not free
var safeCheckDist = 64;
//nonsolid
with obj_block_nonSolid solid = 1

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
	while(place_free(x,y+sign(ySpd))) y+=sign(ySpd);
	ySpd = 0;
}

y+=ySpd;

// do H collision check
if (place_meeting(x,y,objActorParent)&&(!instance_place(x,y,objActorParent).phased && !phased))
{
	dirNum = sign(x-instance_place(x,y,objActorParent).x);
	if phase != "flung" && phase != "dyingFlung"
	{
		if object_index == objPlayer xSpd = PlayerStats.moveSpeed*dirNum*1;
		else xSpd = moveSpeed*dirNum*1;
	}
}
	
if !place_free(x+xSpd,y)||(place_meeting(x+xSpd,y,objActorParent)&&(!instance_place(x+xSpd,y,objActorParent).phased&&!phased))
{
	var resetX = 1;
	if !place_free(x+xSpd,y) && place_free(x+xSpd,y-8) {while!place_free(x+xSpd,y) y-=1; resetX = 0;}
	else if abs(xSpd) >= 1 while(place_free(x+sign(xSpd),y)&&!place_meeting(x+sign(xSpd),y,objActorParent)) x+=sign(xSpd);
	if (place_meeting(x,y,objActorParent))
	{
		dirNum = sign(x-instance_place(x,y,objActorParent).x);
		if sign(xSpd) != dirNum
		{
			if object_index == objPlayer xSpd = dirNum*PlayerStats.moveSpeed;
			else xSpd = moveSpeed*dirNum*1;
		}
		resetX = 0;
	}
	if resetX xSpd = 0
}

x+=xSpd

with obj_block_nonSolid solid = 0;
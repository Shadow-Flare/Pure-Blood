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
	while(place_free(x,y+sign(ySpd)/10)) y+=sign(ySpd)/10;
	ySpd = 0;
}

y+=ySpd;

// do H collision check
if place_meeting(x+xSpd,y,objActorParent) && !phased
{
	var othActor = instance_place(x+xSpd,y,objActorParent);
	if !othActor.phased
	{
		var dirToOther = sign(x-othActor.x);
		if object_index == objPlayer var ms = PlayerStats.moveSpeed;
		else var ms = moveSpeed;
		while place_meeting(x+xSpd*10,y,objActorParent) && xSpd <= ms {xSpd+=dirToOther/10; othActor.xSpd-=dirToOther/10;}
	}
}

if(!place_free(x+xSpd,y))
{
	while(place_free(x+sign(xSpd)/10,y)) x+=sign(xSpd)/10;
	xSpd = 0;
}

x+=xSpd

with obj_block_nonSolid solid = 0;
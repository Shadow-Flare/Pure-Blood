#region move if not free
var safeCheckDist = 32;
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
#endregion

//nonsolid
	//nonSolid blocks
with obj_block_nonSolid solid = true;

//push alteration
if place_meeting(x,y,objActorParent) && !phased && pushable
{
	othActor = instance_place(x,y,objActorParent);
	if !othActor.phased
	{
		//pushXSpd -= pushXSpd*(1/16);
		//pushYSpd -= pushYSpd*(1/16);
	}
	else
	{
		pushXSpd = 0;
		pushYSpd = 0;
	}
}
else
{
	pushXSpd = 0;
	pushYSpd = 0;
}

#region buffers and compiled speed
if object_index = objPlayer
{
	if ropeShotAngularSpeed == 0
	{
		xSpd += xSpdBuffer;
		ySpd += ySpdBuffer;
		pushXSpd += pushXSpdBuffer;
		pushYSpd += pushYSpdBuffer;
		envXSpd += envXSpdBuffer;
		envYSpd += envYSpdBuffer;

		xSpdBuffer = xSpd % 1/6;
		ySpdBuffer = ySpd % 1/6;
		pushXSpdBuffer = pushXSpd % 1/6;
		pushYSpdBuffer = pushYSpd % 1/6;
		envXSpdBuffer = envXSpd % 1/6;
		envYSpdBuffer = envYSpd % 1/6;

		xSpd -= xSpdBuffer;
		ySpd -= ySpdBuffer;
		pushXSpd -= pushXSpdBuffer;
		pushYSpd -= pushYSpdBuffer;
		envXSpd -= envXSpdBuffer;
		envYSpd -= envYSpdBuffer;

		x = round(x*6)/6;
		y = round(y*6)/6;
	}
	else
	{
		xSpdBuffer = 0;
		ySpdBuffer = 0;
		pushXSpdBuffer = 0;
		pushYSpdBuffer = 0;
		envXSpdBuffer = 0;
		envYSpdBuffer = 0;
	}
}
else
{
	xSpd += xSpdBuffer;
	ySpd += ySpdBuffer;
	pushXSpd += pushXSpdBuffer;
	pushYSpd += pushYSpdBuffer;
	envXSpd += envXSpdBuffer;
	envYSpd += envYSpdBuffer;

	xSpdBuffer = xSpd % 1/6;
	ySpdBuffer = ySpd % 1/6;
	pushXSpdBuffer = pushXSpd % 1/6;
	pushYSpdBuffer = pushYSpd % 1/6;
	envXSpdBuffer = envXSpd % 1/6;
	envYSpdBuffer = envYSpd % 1/6;

	xSpd -= xSpdBuffer;
	ySpd -= ySpdBuffer;
	pushXSpd -= pushXSpdBuffer;
	pushYSpd -= pushYSpdBuffer;
	envXSpd -= envXSpdBuffer;
	envYSpd -= envYSpdBuffer;

	x = round(x*6)/6;
	y = round(y*6)/6;
}

var compiledXSpd = xSpd+envXSpd+pushXSpd;
var compiledYSpd = ySpd+envYSpd+pushYSpd;
var sprHeightDif = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);
#endregion

	//platforms
if !dropThroughPlatforms
{
	with objPlatformParent
	{
		if y > other.y+sprHeightDif solid = true;
	}
}
else 
{
	if onPlatform compiledYSpd += 1;
}

//do V collision check
if !place_free(x,y+compiledYSpd) && place_free(x,y)
{
	if place_free(x,floor(y)) y = floor(y);
	while(place_free(x,y+sign(compiledYSpd))) y+=sign(compiledYSpd)/6;
	ySpd = 0;
	envYSpd = 0;
	pushYSpd = 0;
	if object_index = objPlayer ropeShotAngularSpeed = 0;
	compiledYSpd = 0;
}

compiledYSpd = ySpd+envYSpd+pushYSpd;
y+=compiledYSpd;

with objPlatformParent solid = false;

// do H collision check
	//actors
if !phased
{
	for (var i = 0; i < instance_number(objActorParent); i++)
	{
		var othActor = instance_find(objActorParent,i);
		if place_meeting(x,y,othActor) && pushable == true && !othActor.phased
		{
			var dirToOther = sign(othActor.x-x);
			if dirToOther = 0 dirToOther = irandom(1);
			if dirToOther = 0 dirToOther = -1;

			if place_meeting(x,y,othActor) pushXSpd-=dirToOther*1;
		}
		
		else if place_meeting(x+compiledXSpd,y,othActor) && !othActor.phased
		{
			var dirToOther = sign(othActor.x-x);
			if dirToOther = 0 dirToOther = irandom(1);
			if dirToOther = 0 dirToOther = -1;

			while place_meeting(x+compiledXSpd,y,othActor) 
			{
				if object_index = objPlayer ropeShotAngularSpeed = 0;
				pushXSpd-=dirToOther*(1/6);
				compiledXSpd = xSpd+envXSpd+pushXSpd;
			}
		}
	}
}

	//solids
switch sign(compiledXSpd)
{
	case -1:
		if !place_free(floor(x+compiledXSpd),y)
		{
			if place_free(floor(x),y) x = floor(x);
			while(place_free(x+sign(compiledXSpd),y)) x+=sign(compiledXSpd)/6;
			xSpd = 0;
			envXSpd = 0;
			pushXSpd = 0;
			if object_index = objPlayer ropeShotAngularSpeed = 0
			compiledXSpd = 0;
		}
		break;
	case 1:
		if !place_free(ceil(x+compiledXSpd),y)
		{
			if place_free(ceil(x),y) x = ceil(x);
			while(place_free(x+sign(compiledXSpd),y)) x+=sign(compiledXSpd/6);
			xSpd = 0;
			envXSpd = 0;
			pushXSpd = 0;
			if object_index = objPlayer ropeShotAngularSpeed = 0;
			compiledXSpd = 0;
		}
		break;
}

compiledXSpd = xSpd+envXSpd+pushXSpd;
x+=compiledXSpd;

with obj_block_nonSolid solid = false;
#region move if not free (this kinda sucks)
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

#region push reset
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
#endregion

#region buffers and compiled speed
//if object_index = objPlayer
//{
//	if ropeShotAngularSpeed == 0
//	{
//		xSpd += xSpdBuffer;
//		ySpd += ySpdBuffer;
//		pushXSpd += pushXSpdBuffer;
//		pushYSpd += pushYSpdBuffer;

//		xSpdBuffer = xSpd % 1/6;
//		ySpdBuffer = ySpd % 1/6;
//		pushXSpdBuffer = pushXSpd % 1/6;
//		pushYSpdBuffer = pushYSpd % 1/6;

//		xSpd -= xSpdBuffer;
//		ySpd -= ySpdBuffer;
//		pushXSpd -= pushXSpdBuffer;
//		pushYSpd -= pushYSpdBuffer;
//	}
//	else
//	{
//		xSpdBuffer = 0;
//		ySpdBuffer = 0;
//		pushXSpdBuffer = 0;
//		pushYSpdBuffer = 0;
//	}
//}
//else
//{
//	xSpd += xSpdBuffer;
//	ySpd += ySpdBuffer;
//	pushXSpd += pushXSpdBuffer;
//	pushYSpd += pushYSpdBuffer;

//	xSpdBuffer = xSpd % 1/6;
//	ySpdBuffer = ySpd % 1/6;
//	pushXSpdBuffer = pushXSpd % 1/6;
//	pushYSpdBuffer = pushYSpd % 1/6;

//	xSpd -= xSpdBuffer;
//	ySpd -= ySpdBuffer;
//	pushXSpd -= pushXSpdBuffer;
//	pushYSpd -= pushYSpdBuffer;
//}

//if envXSpd == 0 && envYSpd == 0
//{
//	x = round(x*6)/6;
//	y = round(y*6)/6;
//}
#endregion

var compiledXSpd = xSpd+envXSpd+pushXSpd;
var compiledYSpd = ySpd+envYSpd+pushYSpd;
var sprWidthDifLeft = sprite_get_yoffset(sprite_index)-sprite_get_bbox_left(sprite_index);
var sprWidthDifRight = sprite_get_bbox_right(sprite_index)-sprite_get_yoffset(sprite_index);
var sprHeightDifTop = sprite_get_yoffset(sprite_index)-sprite_get_bbox_top(sprite_index);
var sprHeightDifBottom = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);

xSpdCompPrev = compiledXSpd;
ySpdCompPrev = compiledYSpd;

#region dropThroughPlatforms code
if !dropThroughPlatforms && !flying
{
	with objPlatformParent if isSolid && y > other.y+sprHeightDifBottom 
	{
		solid = true;
	}
}
else 
{
	if onPlatform compiledYSpd += 1;
}
#endregion

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
		if place_meeting(x,y,othActor) && !othActor.phased
		{
			if pushable
			{
				var dirToOther = sign(othActor.x-x);
				if dirToOther = 0 dirToOther = irandom(1);
				if dirToOther = 0 dirToOther = -1;

				if place_meeting(x,y,othActor) pushXSpd-=dirToOther*1;
			}
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
				xSpd = ceil(abs(xSpd)*6)/6*sign(xSpd);
				envXSpd = ceil(abs(envXSpd)*6)/6*sign(envXSpd);
				x = round(x*6)/6;
				compiledXSpd = xSpd+envXSpd+pushXSpd;
			}
			xSpd+=pushXSpd;
			pushXSpd = 0;
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

if object_index != objPlayer
{
	while x-sprWidthDifLeft < 0     {x = floor(x); x++};
	while x+sprWidthDifRight < 0    {x = ceil(x);  x--};
	while y-sprHeightDifTop < 0     {y = floor(y); y++};
	while y+sprHeightDifBottom < 0  {y = ceil(y);  y--};
}

with obj_block_nonSolid solid = false;
//move if not free
var safeCheckDist = 32;
//nonsolid
	//nonSolid blocks
with obj_block_nonSolid solid = true;
var sprHeightDif = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);
with obj_platform_parent
{
	if y > other.y+sprHeightDif solid = true;
}

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
	//change collision condition based on direction
switch sign(ySpd)
{
	case -1:
		if !place_free(x,floor(y+ySpd))
		{
			if place_free(x,floor(y)) y = floor(y);
			while(place_free(x,y+sign(ySpd))) y+=sign(ySpd);
			ySpd = 0;
		}
		break;
	case 1:
		if !place_free(x,ceil(y+ySpd))
		{
			if place_free(x,ceil(y)) y = ceil(y);
			while(place_free(x,y+sign(ySpd))) y+=sign(ySpd);
			ySpd = 0;
		}
		break;
}

y+=ySpd;

	//solids
switch sign(xSpd)
{
	case -1:
		if !place_free(floor(x+xSpd),y)
		{
			if place_free(floor(x),y) x = floor(x);
			while(place_free(x+sign(xSpd),y)) x+=sign(xSpd);
			xSpd = 0;
		}
		break;
	case 1:
		if !place_free(ceil(x+xSpd),y)
		{
			if place_free(ceil(x),y) x = ceil(x);
			while(place_free(x+sign(xSpd),y)) x+=sign(xSpd);
			xSpd = 0;
		}
		break;
}

x+=xSpd

with obj_block_nonSolid solid = false;
with obj_platform_parent solid = false;
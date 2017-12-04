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

var compiledXSpd = xSpd+envXSpd;
var compiledYSpd = ySpd+envYSpd;
var sprHeightDif = sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index);

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
	while(place_free(x,y+sign(compiledYSpd))) y+=sign(compiledYSpd);
	ySpd = 0;
	envYSpd = 0;
	compiledYSpd = 0;
}

y+=compiledYSpd;

with objPlatformParent solid = false;

// do H collision check
	//enemies
if !phased
{
	if place_meeting(x+compiledXSpd,y,objActorParent) 
	{
		var othActor = instance_place(x+compiledXSpd,y,objActorParent);
		if !othActor.phased && !place_meeting(x,y,othActor)
		{
			var dirToOther = sign(othActor.x-x);
			if dirToOther = 0 dirToOther = irandom(1);
			if dirToOther = 0 dirToOther = -1;
			
			if is_enemy(actorType,othActor.actorType)
			{
				while place_meeting(x+compiledXSpd,y,othActor) compiledXSpd-=dirToOther/10;
			}
			else
			{
				var xDistToOther = abs(othActor.x-x);
				while xDistToOther <= 6 compiledXSpd-=dirToOther*1;
			}
		}
	}
	
	if place_meeting(x,y,objActorParent) && pushable == true
	{
		for (var i = 0; i < instance_number(objActorParent); i++)
		{
			var othActor = instance_find(objActorParent,i);
			if !othActor.phased
			{
				var dirToOther = sign(othActor.x-x);
				if dirToOther = 0 dirToOther = irandom(1);
				if dirToOther = 0 dirToOther = -1;
				
				if place_meeting(x,y,othActor)
				{
					if is_enemy(actorType,othActor.actorType)
					{
						if place_meeting(x,y,othActor) compiledXSpd-=dirToOther*1;
					}
					else
					{
						var xDistToOther = abs(othActor.x-x);
						if xDistToOther <= 6 compiledXSpd-=dirToOther*1
					}
				}
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
			while(place_free(x+sign(compiledXSpd),y)) x+=sign(compiledXSpd);
			xSpd = 0;
			envXSpd = 0;
			compiledXSpd = 0;
		}
		break;
	case 1:
		if !place_free(ceil(x+compiledXSpd),y)
		{
			if place_free(ceil(x),y) x = ceil(x);
			while(place_free(x+sign(compiledXSpd),y)) x+=sign(compiledXSpd);
			xSpd = 0;
			envXSpd = 0;
			compiledXSpd = 0;
		}
		break;
}

x+=compiledXSpd

with obj_block_nonSolid solid = false;
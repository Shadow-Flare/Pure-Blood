with obj_actor_parent
{
	if ((object_index != objPlayer && !flying && !dropThroughPlatforms) || (object_index == objPlayer && instance_exists(InputManager) && !(sign(InputManager.moveInputV) == 1 && InputManager.aInput)) && phase != "hooked")
	{
		boxHeight = bbox_bottom-bbox_top;
		boxWidth = bbox_right-bbox_left;
		if (yprevious+boxHeight/2 < other.y) && (ySpd > 0) && (y+boxHeight/2 > other.y) && (x+boxWidth/2 >= other.x) && (x-boxWidth/2 <= other.x+other.sprite_width)
		{
			while place_meeting(x,y,other) y--;
			ySpd = 0;
			onGround = 1;
		}
	}
}
with obj_item_parent
{
	boxHeight = bbox_bottom-bbox_top;
	boxWidth = bbox_right-bbox_left;
	if (yprevious+boxHeight/2 < other.y) && (ySpd > 0) && (y+boxHeight/2 > other.y) && (x+boxWidth/2 >= other.x) && (x-boxWidth/2 <= other.x+other.sprite_width)
	{
		while place_meeting(x,y,other) y--;
		ySpd = 0;
		onGround = 1;
	}
}
/*
if (place_meeting(x, y-1, objPlayer))&&(objPlayer.y+(objPlayer.bbox_bottom-objPlayer.bbox_top)-objPlayer.ySpd<=y-ySpd)||(place_meeting(x,y-1,objPlayer)&&!place_meeting(x,y+y-yprevious+11,objPlayer)&&ySpd >= -GameManager.grav)&&objPlayer.y-objPlayer.yprevious>=0
{
	objPlayer.eleX = x;
	objPlayer.eleBboxTop = bbox_top;
	objPlayer.eleId = id;
	objPlayer.eleYSpd = ySpd;
	//objPlayer.elePhase = phase;
	if phase = "shakey" objPlayer.eleYMod = yMod;
	with objPlayer
	{
		if (!place_free(x,ceil(eleBboxTop-(bbox_bottom-bbox_top))))
		{
			sideNum = sign(x-eleX);
			safeNum = 1;
			for(var i = 1; i <= sprite_width/2; i++)
			{
				if place_free(x+i*sideNum,y)&&!place_meeting(x+i*sideNum,y,eleId)
				{
					x+=i*sideNum;
					break;
				}
				else if place_free(x-i*sideNum,ceil(eleBboxTop-(bbox_bottom-bbox_top)))
				{
					x-=i*sideNum;
					y = ceil(eleBboxTop-(bbox_bottom-bbox_top));
					if ySpd >= -GameManager.grav ySpd = eleYSpd;
					break;
				}
			}
		}
		else
		{
			y = ceil(eleBboxTop-(bbox_bottom-bbox_top)/2);
			if ySpd >= -GameManager.grav ySpd = eleYSpd;
		}
	}
}
*/
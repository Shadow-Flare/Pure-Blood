with obj_actor_parent
{
	if ((object_index != obj_player && !flying && !dropThroughPlatforms) || (object_index == obj_player && instance_exists(obj_inputManager) && !(sign(obj_inputManager.moveInputV) == 1 && obj_inputManager.aInput)) && phase != "hooked")
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
if (place_meeting(x, y-1, obj_player))&&(obj_player.y+(obj_player.bbox_bottom-obj_player.bbox_top)-obj_player.ySpd<=y-ySpd)||(place_meeting(x,y-1,obj_player)&&!place_meeting(x,y+y-yprevious+11,obj_player)&&ySpd >= -global.g)&&obj_player.y-obj_player.yprevious>=0
{
	obj_player.eleX = x;
	obj_player.eleBboxTop = bbox_top;
	obj_player.eleId = id;
	obj_player.eleYSpd = ySpd;
	//obj_player.elePhase = phase;
	if phase = "shakey" obj_player.eleYMod = yMod;
	with obj_player
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
					if ySpd >= -global.g ySpd = eleYSpd;
					break;
				}
			}
		}
		else
		{
			y = ceil(eleBboxTop-(bbox_bottom-bbox_top)/2);
			if ySpd >= -global.g ySpd = eleYSpd;
		}
	}
}
*/
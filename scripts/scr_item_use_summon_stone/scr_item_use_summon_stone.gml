var entity = objShopkeeperTest

with objShopkeeperTest wantsToLeave = true;;
repeat(128)
{
	var tempX = round(other.x+32*other.facing+random_range(-4,4));
	var tempY = round(other.y+random_range(-24,24));
	if place_free(tempX,tempY)
	{
		while place_free(tempX,tempY+1) tempY++;
		var dirToTarget = other.facing*-1;
		var boxWidth = bbox_right-bbox_left;
		if !place_meeting(tempX,tempY,objActorParent) && !place_meeting(tempX,tempY+1,obj_block_nonSolid)
		{
			with instance_create_layer(tempX,tempY,"lay_entities",entity)
			{
				facing = dirToTarget;
				phase = state.emote;
				phaseTimer = 0;
				subPhase = subState.actionSub1;
				subPhaseTimer = 0;
			}
			break;
		}
	}
}
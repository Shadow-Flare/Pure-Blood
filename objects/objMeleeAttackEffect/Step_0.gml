//destroy/reset
if attackDuration != -1
{
	timer++;
		//destroy
	if timer >= round(attackDuration*room_speed)
	{
		instance_destroy();
	}
}
else
{
	if ds_list_size(hitList) != 0
	{
		timer++;
		if timer >= round(hitListResetDuration*room_speed)
		{
			ds_list_clear(hitList);
			timer = 0;
		}
	}
}

//frameData
if frameData != -1
{
	if image_index >= frameData[0] && image_index <= frameData[1] hitOn = true;
	else hitOn = false;
}
else hitOn = true;

//reset hitlist if duration is infinite
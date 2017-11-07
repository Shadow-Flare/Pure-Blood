timer++;

//destroy
if timer == floor((attackDuration)*room_speed)
{
	instance_destroy();
}

//frameData
if frameData != -1
{
	if image_index >= frameData[0] && image_index <= frameData[1] hitOn = true;
	else hitOn = false;
}
else hitOn = true;

//follow caster
if follow
{
	if instance_exists(caster)
	{
		x = caster.x;
		y = caster.y;
	}
	else
	{
		instance_destroy();
	}
}
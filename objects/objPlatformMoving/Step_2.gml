event_inherited();

//light
	//create
if lightID == noone
{
	lightID = instance_create_layer(lightXOffset,lightYOffset,"lay_lights",obj_light_forestBulb);
}

	//tracking
else
{
	lightID.x = x + lightXOffset;
	lightID.y = y + lightYOffset;
}
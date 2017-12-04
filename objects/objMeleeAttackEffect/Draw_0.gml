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

//draw self
draw_self();

//hitBox
if GameManager.hitBoxVisuals 
{
	if hitOn var col = c_red;
	else var col = c_blue;
	draw_hitbox(c_red);
}
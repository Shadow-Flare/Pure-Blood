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

//effect
if boundEffect != noone && initialized event_perform_object(boundEffect,ev_draw,0);

//draw self
draw_self();

//hitBox
if GameManager.hitBoxVisuals || forceDrawBox
{
	if hitOn var col = c_red;
	else var col = c_blue;
	draw_hitbox(c_red);
}
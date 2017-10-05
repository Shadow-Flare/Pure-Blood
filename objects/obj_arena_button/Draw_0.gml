if lightUp
{
	if instance_exists(objPlayer) draw_sprite(spr_b_prompt,floor(timer/4),objPlayer.x,objPlayer.y-192);
}

draw_self();
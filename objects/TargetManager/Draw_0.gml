if instance_exists(objPlayer) with objPlayer
{
	switch lockOnType
	{
		case lockOn.off:
		lockImageTimer = 0;
		break;
		case lockOn.soft:
		lockImageTimer++;
		if instance_exists(lockOnTarget) draw_sprite(spr_soft_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_soft_lock)))),lockOnTarget.x,lockOnTarget.y);				
		break;
		case lockOn.hard:
		lockImageTimer++;
		if instance_exists(lockOnTarget) draw_sprite(spr_hard_lock,floor(lockImageTimer/(room_speed/(1*sprite_get_number(spr_hard_lock)))),lockOnTarget.x,lockOnTarget.y);					
		break;
	}
}

x += (xTo -x)/10;
y += (yTo -y)/10;

camera_set_view_pos(cam,-(camera_get_view_width(cam)/2)+x,-(camera_get_view_height(cam)/2)+y);

switch phase
{
	case cameraState.idle:
		xTo = room_width/2;
		yTo = room_height/2;
		break;
	case cameraState.player:
		if !instance_exists(obj_player) phase = cameraState.idle;
		else
		{
			if !obj_player.hardLockOn
			{
				xTo = obj_player.x
				yTo = obj_player.y
			}
			else
			{
				if instance_exists(follow.lockOnTarget)
				{
					var lockTarget = follow.lockOnTarget;
					xTo = (follow.x*3 + lockTarget.x)/4
					yTo = (follow.y*3 + lockTarget.y)/4
				}
			}
		}
		break;
}

xPos = clamp(camera_get_view_x(cam),0,room_width-camera_get_view_width(cam));
yPos = clamp(camera_get_view_y(cam),0,room_height-camera_get_view_height(cam));

camera_set_view_pos(cam,xPos,yPos);
x += (xTo -x)/10;
y += (yTo -y)/10;

camera_set_view_pos(cam,-(camera_get_view_width(cam)/2)+x,-(camera_get_view_height(cam)/2)+y);

switch phase
{
	case cameraState.idle:
		//do nuffin
		break;
	case cameraState.player:
		if !instance_exists(objPlayer) phase = cameraState.idle;
		else
		{
			if objPlayer.lockOnType == lockOn.hard
			{
				if instance_exists(objPlayer.lockOnTarget)
				{
					var lockTarget = objPlayer.lockOnTarget;
					xTo = (objPlayer.x*3 + lockTarget.x)/4
					yTo = (objPlayer.y*3 + lockTarget.y)/4
				}
			}
			else
			{
				xTo = objPlayer.x
				yTo = objPlayer.y
			}
		}
		break;
}

xPos = clamp(camera_get_view_x(cam),0,room_width-camera_get_view_width(cam));
yPos = clamp(camera_get_view_y(cam),0,room_height-camera_get_view_height(cam));

camera_set_view_pos(cam,xPos,yPos);
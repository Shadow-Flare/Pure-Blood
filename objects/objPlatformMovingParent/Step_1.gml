event_inherited();

if path != noone
{
	if enabledPrev != enabled
	{
		if !enabled
		{
			lastSpeed = path_speed;
			path_speed = 0;
		}
		else
		{
			path_speed = lastSpeed;
		}
	}
	enabledPrev = enabled;

	if enabled
	{
		var len = path_get_length(path);
		if !path_get_closed(path)
		{
			if path_position == 0 || path_position == 1
			{
				if timer == 0
				{
					var switchBool = false;
					if path_position == 1 switchBool = true;
					path_start(path,0,pathEndAction,true);
					if switchBool
					{
						path_position = 1;
						x = path_get_x(path,path_position);
						y = path_get_y(path,path_position);
					}
					//path_speed = 0;
				}
				timer++;
				if timer >= round(pauseDuration*room_speed)
				{
					timer = 0;
					if path_position == 0
					{
						//path_start(path,pathSpeedDefault,pathEndAction,true);
						//path_position = 0;
						path_speed = pathSpeedDefault;
					}
					else
					{
						//path_start(path,-pathSpeedDefault,pathEndAction,true);
						//path_position = 1;
						path_speed = -pathSpeedDefault;
					}
				}
			}
			if path_position*len+path_speed >= len
			{
				path_speed = len-path_position*len;
			}
			if path_position*len+path_speed <= 0
			{
				path_speed = -path_position*len;
			}
		
			xSpdSim = path_get_x(path,(path_position*len+path_speed)/len)-x;
			ySpdSim = path_get_y(path,(path_position*len+path_speed)/len)-y;
		}
		else
		{	
			if path_position == 0 || path_position == 1
			{
				path_speed = 0;
				path_start(path,pathSpeedDefault,pathEndAction,true);
			}
			if path_position*len+path_speed >= len
			{
				path_speed = len-path_position*len;
			}
		
			xSpdSim = path_get_x(path,((path_position*len+path_speed)/len)%1)-x;
			ySpdSim = path_get_y(path,((path_position*len+path_speed)/len)%1)-y;
		}
	}
	else
	{
		xSpdSim = 0;
		ySpdSim = 0;
	}
}
else
{
	if instance_exists(objPlatformPathPoint)
	{
		var point = instance_nearest(x,y,objPlatformPathPoint);
		if point.hasInitialized
		{
			path = PathManager.pathMap[? point.pathID];
			var pointData = path_closest_to_point(path,x,y,10);
			path_start(path,pathSpeedDefault,pathEndAction,true);
			path_position = pointData[2];
		}
	}
}
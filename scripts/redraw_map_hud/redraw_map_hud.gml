surface_set_target(HudManager.hudMapSurf);
	draw_clear_alpha(c_white,0);
	
	var cache = MapManager.map;
	var cellInitialX = surface_get_width(HudManager.hudMapSurf)/2;
	var cellInitialY = surface_get_height(HudManager.hudMapSurf)/2;
	var cellW = HudManager.hudMapCellW;
	var cellH = HudManager.hudMapCellH;
	var cellColour = HudManager.hudMapCellColour;

	var str = room_get_name(room);
	if string_pos("rmRoom",str) != 0
	{
		var coordinates = string_replace(str,"rmRoom","");
		var coordX = int64(string_copy(coordinates,2,3));
		var coordY = int64(string_copy(coordinates,6,3));
		var roomID = cache[# coordX,coordY];
		var cellModX = RoomCache.rmWidths[? roomID]/2;
		var cellModY = RoomCache.rmHeights[? roomID]/2;
		
			//cells
				//fill
		draw_set_colour(cellColour);
		for (var i = -10; i <= 10; i++) 
		{
		    for (var j = -10; j <= 10; j++) 
			{
				var rm = cache[# coordX+i,coordY+j];
			    if rm != 0
				{
					var p1x = cellInitialX+cellW*(i-cellModX);
					var p1y = cellInitialY+cellH*(j-cellModY);
					var p2x = p1x+cellW-1
					var p2y = p1y+cellH-1
					draw_rectangle(p1x,p1y,p2x,p2y,0)
				}
			}
		}
				//border
		draw_set_colour(c_white);
		for (var i = -10; i <= 10; i++) 
		{
		    for (var j = -10; j <= 10; j++) 
			{
				var rm = cache[# coordX+i,coordY+j];
			    if rm != 0
				{		
					for (var dir = 0; dir < 360; dir+=90)
					{
						var lineSprite = noone;
						var p1x = cellInitialX+cellW*(i-cellModX);
						var p1y = cellInitialY+cellH*(j-cellModY);
						var p2x = p1x+cellW
						var p2y = p1y+cellH
						if cache[# coordX+i+dcos(dir),coordY+j-dsin(dir)] != rm lineSprite = sprMapRoomLineSolid;
						switch dir
						{
							case   0: var lineX = p2x-1; var lineY = p1y; break;
							case  90: var lineX = p1x; var lineY = p1y+1; break;
							case 180: var lineX = p1x+1; var lineY = p2y; break;
							case 270: var lineX = p2x; var lineY = p2y-1; break;
						}
						if dir == 0 || dir == 180	{var yScale = cellH/sprite_get_height(lineSprite); var xScale = 1;}
						else						{var yScale = cellW/sprite_get_height(lineSprite); var xScale = 1;}
						if lineSprite != noone draw_sprite_ext(lineSprite,0,lineX,lineY,xScale,yScale,dir,c_white,1);
					}
				}
			}
		}
		
			//border
		draw_set_colour(c_white);
		draw_rectangle(0,0,surface_get_width(HudManager.hudMapSurf)-1,surface_get_height(HudManager.hudMapSurf)-1,1);
	}
surface_reset_target();
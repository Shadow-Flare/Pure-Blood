with MapManager
{
	surface_set_target(mapSurface);
		draw_clear_alpha(c_black,0.0);
			//map
		var cache = map;

		for(var i = 0; i < ds_grid_width(cache); i++)
		{
			for(var j = 0; j < ds_grid_height(cache); j++)
			{
					//cells
						//fill
				draw_set_colour(mapCellColour);
				var rm = cache[# i,j];
				if rm != 0
				{
					var revealCache = RoomCache.rmRevealData[? rm];
					var revealed = revealCache[? noone];
					if revealed
					{
						var p1x = (i-cellStartX)*mapCellW;
						var p1y = (j-cellStartY)*mapCellH;
						var p2x = (i+1-cellStartX)*mapCellW-1;
						var p2y = (j+1-cellStartY)*mapCellH-1;
						draw_rectangle(p1x,p1y,p2x,p2y,0);
					}
				}
			}
		}
				//borders
		for(var i = 0; i < ds_grid_width(cache); i++)
		{
			for(var j = 0; j < ds_grid_height(cache); j++)
			{
				var rm = cache[# i,j];
				if rm != 0
				{
					var revealCache = RoomCache.rmRevealData[? rm];
					var revealed = revealCache[? noone];
					if revealed
					{
						for (var dir = 0; dir < 360; dir+=90)
						{
							var shiftRmX = i+dcos(dir);
							var shiftRmY = j-dsin(dir);
							var shiftRm = cache[# shiftRmX,shiftRmY];
							if shiftRm != rm
							{
								var p1x = (i-cellStartX)*mapCellW;
								var p1y = (j-cellStartY)*mapCellH;
								var p2x = p1x+mapCellW;
								var p2y = p1y+mapCellH;
								var exits = RoomCache.rmExits[? rm];
						
								var lineSprite = sprMapRoomLineSolid;
								for(var k = 0; k < ds_list_size(exits); k++)
								{
									var array = exits[| k];
									if shiftRmX == array[0] && shiftRmY == array[1]
									{
										lineSprite = sprMapRoomLineOpen;
										break;
									}
								}
							
								if lineSprite == sprMapRoomLineOpen
								{
									var revealCache = RoomCache.rmRevealData[? rm];
									if revealCache != undefined
									{
										var secretID = revealCache[? shiftRm];
										if secretID != undefined
										{
											var secretRevealed = WorldCache.environment[? secretID];
											if !secretRevealed
											{
												lineSprite = sprMapRoomLineSolid;
											}
										}
									}
								}
							
								switch dir
								{
									case   0: var lineX = p2x-1; var lineY = p1y; break;
									case  90: var lineX = p1x; var lineY = p1y+1; break;
									case 180: var lineX = p1x+1; var lineY = p2y; break;
									case 270: var lineX = p2x; var lineY = p2y-1; break;
								}
								if dir == 0 || dir == 180	{var yScale = mapCellH/sprite_get_height(lineSprite); var xScale = 1;}
								else						{var yScale = mapCellW/sprite_get_height(lineSprite); var xScale = 1;}
								if lineSprite != noone draw_sprite_ext(lineSprite,0,lineX,lineY,xScale,yScale,dir,merge_colour(c_white,mapCellColour,0.5),1);
							}
						}
					}
				}
			}
		}
		surface_reset_target();
}
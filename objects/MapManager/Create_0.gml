map = ds_grid_create(1000,1000);

rm = 0;
while rm != -1
{
	var str = room_get_name(rm);
	if string_pos("rmRoom",str) != 0
	{
		var coordinates = string_replace(str,"rmRoom","");
		var coordX = int64(string_copy(coordinates,2,3));
		var coordY = int64(string_copy(coordinates,6,3));
		
		var rmWidth = RoomCache.rmWidths[? rm];
		var rmHeight = RoomCache.rmHeights[? rm];
		for (var i = 0; i < rmWidth; ++i)
		{
		    for (var j = 0; j < rmHeight; ++j) 
			{
			    map[# coordX+i,coordY+j] = rm;
			}
		}
	}
	rm = room_next(rm);
}
mapSurface = noone;
mapCellColour = c_blue;

maxCellsX = 175;	//this and the following 3 values should be scaled to the total world size in the end, for now have map show max range possible
maxCellsY = 450;
cellStartX = 75;
cellStartY = 350;

mapCellW = 12;
mapCellH = 8;
draw_set_colour(c_black);
#region Screen Shake care
	draw_rectangle(-11,-11,room_width+11,-1,0);							//U
	draw_rectangle(-11,-11,-1,room_height+11,0);						//L
	draw_rectangle(-11,room_height,room_width+11,room_height+11,0);		//D
	draw_rectangle(room_width,-11,room_width+11,room_height+11,0);		//R
#endregion

#region Cover force data
	if forceX > 0 draw_rectangle(room_width,-forceX,room_width+forceX,room_height+forceX,0);
	if forceX < 0 draw_rectangle(-forceX,-forceX,-1,room_height+forceX,0);;
	if forceY > 0 draw_rectangle(-forceY,room_height,room_width+forceY,room_height+forceY,0);
	if forceY < 0 draw_rectangle(-forceY,-forceY,room_width+forceY,-1,0);
#endregion
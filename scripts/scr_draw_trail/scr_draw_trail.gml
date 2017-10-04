//variables
// vector array target referenced with argument0 due to need for pointers
var ADDNEWPOINT = argument0;
var TRAILNUMBEROFTRAILS = argument1;
var TRAILDURATION = argument2;
var TRAILNUMBEROFPOINTS = argument3;
var TRAILCOLOUR = argument4;
var TRAILSIZERATIO = argument5;
var TRAILVARIANCE = argument6;
var TRAILALPHA = 1;
trailTimer++;

//set points
if floor(trailTimer%((TRAILDURATION*room_speed)/TRAILNUMBEROFPOINTS)) = 0			//shift list and add points if active
{
	for(var i = 0; i < TRAILNUMBEROFTRAILS; i++)
	{
		for(var j = TRAILNUMBEROFPOINTS-1; j > -1; j--)
		{
			if (j != 0) vTrail[i,j] = vTrail[i,j-1]
			else if j = 0
			{
				if ADDNEWPOINT vTrail[i,0] = [x+random_range(-TRAILVARIANCE,+TRAILVARIANCE),y+random_range(-TRAILVARIANCE,TRAILVARIANCE)];
				else vTrail[i,0] = -2;
			}
		}
	}
}

//use points

for(var i = 0; i < TRAILNUMBEROFTRAILS; i++)
{
	TRAILSIZERATIO = argument5;
	TRAILALPHA = 1;
	for (var j = 0; j < TRAILNUMBEROFPOINTS-1; j ++)
	{
		var vector1 = vTrail[i,j];
		var vector2 = vTrail[i,j+1];
		draw_set_alpha(TRAILALPHA);
		if vector1 != -1 && vector1 != -2 && vector2 != -1 && vector2 != -2 draw_line_width_color(vector1[0],vector1[1],vector2[0],vector2[1],TRAILSIZERATIO*0.5,TRAILCOLOUR,TRAILCOLOUR);
		if vector1 == -2 && vector2 != -1 && vector2 != -2 draw_line_width_color(x,y,vector2[0],vector2[1],TRAILSIZERATIO*0.5,TRAILCOLOUR,TRAILCOLOUR);
		TRAILSIZERATIO *= 9/10;
		TRAILALPHA *= 9/10;
	}
}
draw_set_alpha(1);
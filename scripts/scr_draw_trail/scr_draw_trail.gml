///@arg ADDNEWPOINT;
///@arg TRAILNUMBEROFTRAILS;
///@arg TRAILDURATION;
///@arg TRAILNUMBEROFPOINTS;
///@arg TRAILCOLOUR;
///@arg TRAILSIZERATIO;
///@arg TRAILVARIANCE;
///@arg TRAILALPHA;
///@arg TRAILJITTER;
var ADDNEWPOINT = argument0;
var TRAILNUMBEROFTRAILS = argument1;
var TRAILDURATION = argument2;				//seconds
var TRAILNUMBEROFPOINTS = argument3;
var TRAILCOLOUR = argument4;
var TRAILSIZERATIO = argument5;
var TRAILVARIANCE = argument6;
var TRAILALPHA = argument7;
var TRAILJITTER = argument8;
if !variable_instance_exists(id,"trailTimer") trailTimer = 0;
if !variable_instance_exists(id,"vTrail")
{
	vTrail = [];
	for (var i = 0; i < TRAILNUMBEROFTRAILS; i++)
	{
		for (var j = 0; j < TRAILNUMBEROFPOINTS; j++)
		vTrail[i,j] = -1;
	}
}
trailTimer++;

//set points
if floor(trailTimer%((TRAILDURATION*room_speed)/TRAILNUMBEROFPOINTS)) == 0			//shift list and add points if active
{
	for(var i = 0; i < TRAILNUMBEROFTRAILS; i++)
	{
		for(var j = TRAILNUMBEROFPOINTS-1; j > -1; j--)
		{
			if (j != 0) vTrail[i,j] = vTrail[i,j-1]
			else if j = 0
			{
				var angMod = random(360);
				var distMod = random(TRAILVARIANCE);
				if ADDNEWPOINT vTrail[i,0] = [x+distMod*dsin(angMod),y+distMod*dcos(angMod)];
				else vTrail[i,0] = -2;
			}
		}
	}
}

//jitter
if TRAILJITTER != 0
{
	for(var i = 0; i < TRAILNUMBEROFTRAILS; i++)
	{
		for(var j = 0; j < TRAILNUMBEROFPOINTS; j++)
		{
			if (vTrail[i,j] != -1 && vTrail[i,j] != -2) 
			{
				var data = vTrail[i,j];
				data = [data[0]+random_range(-TRAILJITTER/4,TRAILJITTER/4),data[1]+random_range(-TRAILJITTER/4,TRAILJITTER/4)];
				vTrail[i,j] = data;
			}
		}
	}
}

gpu_set_blendmode(bm_add);
//use points
for(var i = 0; i < TRAILNUMBEROFTRAILS; i++)
{
	TRAILSIZERATIO = argument5;
	TRAILALPHA = argument7;
	var TSRInitial = TRAILSIZERATIO;
	var TAInitial = TRAILALPHA;
	for (var j = 0; j < TRAILNUMBEROFPOINTS-1; j ++)
	{
		var vector1 = vTrail[i,j];
		var vector2 = vTrail[i,j+1];
		var lineX1 = undefined;
		var lineY1 = undefined;
		var lineX2 = undefined;
		var lineY2 = undefined;
		if vector1 != -1 && vector1 != -2 && vector2 != -1 && vector2 != -2
		{
			lineX1 = vector1[0];
			lineY1 = vector1[1];
			lineX2 = vector2[0];
			lineY2 = vector2[1];
		}
		else if vector1 == -2 && vector2 != -1 && vector2 != -2 && ADDNEWPOINT
		{
			lineX1 = x;
			lineY1 = y;
			lineX2 = vector2[0];
			lineY2 = vector2[1];
		}
		if lineX1 != undefined
		{
			var angle = point_direction(lineX1,lineY1,lineX2,lineY2);
			var dist = point_distance(lineX1,lineY1,lineX2,lineY2);
			var scale = TRAILSIZERATIO/6
			draw_sprite_ext(sprLightningEnd,0,lineX1,lineY1,scale,scale,angle,TRAILCOLOUR,TRAILALPHA);
			draw_sprite_ext(sprLightningMid,0,lineX1,lineY1,dist,scale,angle,TRAILCOLOUR,TRAILALPHA);
			draw_sprite_ext(sprLightningEnd,0,lineX2,lineY2,-scale,scale,angle,TRAILCOLOUR,TRAILALPHA);
		}
		TRAILSIZERATIO -= TSRInitial/(TRAILNUMBEROFPOINTS-1);
		TRAILALPHA -= TAInitial/(TRAILNUMBEROFPOINTS-1);
	}
}
gpu_set_blendmode(bm_normal);
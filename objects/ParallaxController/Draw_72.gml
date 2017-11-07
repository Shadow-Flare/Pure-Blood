//background
	//bck fill
var scale = 0.25;
var fillScale = 0.25;
draw_sprite_tiled_ext(paraBack,0,0,0,fillScale,fillScale,c_white,1);
	
	//bck layers
for(var i = 0; i < array_length_1d(paraSprites); i++)
{
	var sprS = paraSpeeds[i];
	if sprS <= 1
	{
		var spr = paraSprites[i];
		var sprW = sprite_get_width(spr)*scale;
		var sprH = sprite_get_height(spr)*scale;
		var sprN = sprite_get_number(spr);
		for(var i = 0; i < sprite_get_number(spr); i++)
		{
			for (var j = 0; j < ceil(room_width/sprW); j++)
			{
				var xPos = Camera.xPos*(1-(sprS*i/sprN))+j*sprW;
				var yPos = (-room_height+Camera.yPos+camera_get_view_height(Camera.cam))*(1-(sprS*0.5*i/sprN))+room_height-sprH;
				draw_sprite_ext(spr,i,xPos,yPos,scale,scale,0,c_white,1);
			}
		}
	}
}
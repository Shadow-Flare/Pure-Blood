if rainData != noone
{
	for(var i = 0; i < ds_grid_width(rainData); i++)
	{
		var rX = ds_grid_get(rainData,i,0);
		var rY = ds_grid_get(rainData,i,1);
		draw_sprite_ext(rainSpriteFall,0,rX,rY,rainSize,rainSize,rainAngle,c_white,0.8);
	}
}
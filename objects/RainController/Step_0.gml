rainSoundMod -= rainSoundMod/10;
rScreenCount = 0;

var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam);

audio_emitter_position(sRain,objPlayer.x,objPlayer.y,0);
audio_emitter_falloff(sRain,2600,4000,1)
audio_listener_position(objPlayer.x,objPlayer.y,0);
sRainX = 0;
//sRainY = 0;

if !ds_exists(rainData,ds_type_grid)
{
	rainData = ds_grid_create(0,0);
}
repeat(rainPPS)
{
	ds_grid_resize(rainData,ds_grid_width(rainData)+1,3)
	ds_grid_set(rainData,ds_grid_width(rainData)-1,0,random_range(-room_height*0.5,room_width+room_height*0.5));
	ds_grid_set(rainData,ds_grid_width(rainData)-1,1,-100);
	ds_grid_set(rainData,ds_grid_width(rainData)-1,2,rainSpeed+random_range(-rainSpeedVar,rainSpeedVar))
}
for(var i = 0; i < ds_grid_width(rainData); i++)
{
	ds_grid_add(rainData,i,0,dcos(rainAngle)*ds_grid_get(rainData,i,2));
	ds_grid_add(rainData,i,1,-dsin(rainAngle)*ds_grid_get(rainData,i,2));
	var rX = ds_grid_get(rainData,i,0);
	var rY = ds_grid_get(rainData,i,1);
	if rX>camX && rX<camX+camW && rY>camY && rY<camY+camH
	{
		rainSoundMod++;
		rScreenCount++;
		if rX>objPlayer.x sRainX+=2;
		else sRainX-=2;
	}
	if !place_free(rX,rY)
	{
		part_emitter_region(pRainSys,pRainEmitter,rX,rX,rY,rY,ps_shape_ellipse,ps_distr_linear);
		part_emitter_burst(pRainSys,pRainEmitter,pRain,4);
		ds_grid_set_grid_region(rainData,rainData,i+1,0,ds_grid_width(rainData)-1,2,i,0);
		ds_grid_resize(rainData,ds_grid_width(rainData)-1,3);
	}
	else if rY >= room_height+128
	{
		ds_grid_set_grid_region(rainData,rainData,i+1,0,ds_grid_width(rainData)-1,2,i,0);
		ds_grid_resize(rainData,ds_grid_width(rainData)-1,3);
	}
}

rainSoundModReal += (rainSoundMod-rainSoundModReal)/20;
audio_emitter_gain(sRain,clamp(rainSoundModReal/rainSoundCap,0,1));

sRainX/=(rScreenCount+1)/350;
//sRainY/=(rScreenCount+1)/350;
sRainXReal += (sRainX-sRainXReal)/20;
sRainYReal += (sRainY-sRainYReal)/20;
audio_emitter_position(sRain,objPlayer.x-sRainX,objPlayer.y+sRainY,0);
///@groundType

//audio
var snd = noone;
var typeCache = AudioCache.steppingAudioCache[| argument0];
if ds_list_size(typeCache) != 0
{
	var num = irandom(ds_list_size(typeCache)-1);
	snd = typeCache[| num];
}

audio_play_sound(snd,10,false);

//visual
var partNum = irandom_range(2,3)
var feetX = x;
var feetY = y+(sprite_get_bbox_bottom(sprite_index)-sprite_get_yoffset(sprite_index))
for (var i = 0; i < partNum; i++) with create_effect(false,feetX,feetY,depth-1,sprDust,random_range(0.3,0.7),1,1)
{
	var partDir = random_range(15,60);
	if sign(other.facing) == 1 partDir = 180-partDir;
	var partSpeed = random_range(0.5,2);
	slowdownFactor = 1/8;
	xSpd = partSpeed*dcos(partDir);
	ySpd = -partSpeed*dsin(partDir);
	image_alpha = 0.7;
	image_angle = random(360);
}
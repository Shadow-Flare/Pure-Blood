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
	
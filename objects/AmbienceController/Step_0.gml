#region Ambience
var ambSoundPrev = ambienceSoundID
ambienceSoundID = RoomCache.rmAmbienceAudioData[? room];

if ambienceSoundID != ambSoundPrev 
{
	audio_stop_sound(ambienceAudio);
	ambienceAudio = noone;
}
if ambienceSoundID != undefined && ambienceAudio == noone ambienceAudio = audio_play_sound(ambienceSoundID,10,true);
#endregion

#region initialize music
var musSoundPrev = musicBaseSoundID
var cache = RoomCache.rmMusicData[? room];
var baseID = cache[| 0];
var isLayered = cache[| 1];
musicBaseSoundID = baseID;
musicPeaceSoundID = baseID+1;
musicBattleSoundID = baseID+2;

if musicBaseSoundID != musSoundPrev 
{
	audio_stop_sound(musicBaseAudio);
	audio_stop_sound(musicPeaceAudio);
	audio_stop_sound(musicBattleAudio);
	musicBaseAudio = noone;
	musicPeaceAudio = noone;
	musicBattleAudio = noone;
}
if musicBaseSoundID != undefined && musicBaseAudio == noone
{
	musicBaseAudio = audio_play_sound(musicBaseSoundID,10,true);
	if isLayered
	{
		musicPeaceAudio = audio_play_sound(musicPeaceSoundID,10,true);
		musicBattleAudio = audio_play_sound(musicBattleSoundID,10,true);
	}
}
#endregion
#region update layered music with Game State
if GameManager.battlePhase = battleState.peace
{
	peaceGain = clamp(peaceGain+1/(gainDuration*room_speed),0,1);
	battleGain = clamp(battleGain-1/(gainDuration*room_speed),0,1);
}
else
{
	peaceGain = clamp(peaceGain-1/(gainDuration*room_speed),0,1);
	battleGain = clamp(battleGain+1/(gainDuration*room_speed),0,1);
}

if audio_exists(musicPeaceAudio) && audio_exists(musicBattleAudio)
{
	audio_sound_gain(musicPeaceAudio,peaceGain,0);
	audio_sound_gain(musicBattleAudio,battleGain,0);
}

if !GameManager.musicEnabled
{
	//audio_sound_gain(ambienceAudio,0,0);
	
	audio_sound_gain(musicBaseAudio,0,0);
	audio_sound_gain(musicPeaceAudio,0,0);
	audio_sound_gain(musicBattleAudio,0,0);
}
else
{
	//audio_sound_gain(ambienceAudio,1,0);
	
	audio_sound_gain(musicBaseAudio,1,0);
}
#endregion
event_inherited();

timer++;

if damageTakenPrev != damageTaken || staggerTakenPrev != staggerTaken || knockbackTakenPrev != knockbackTaken
{
	create_effect(false,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),depth-1,absorbSprite,random_range(bbox_top,bbox_bottom),1,1);
	audio_play_sound(absorbSound,10,0);
}

if timer >= round(duration*room_speed)
{
	if hasBeenHit
	{
		with caster 
			with scr_create_attack(other.releaseFrameData,other.releaseFollow,other.releaseDuration,other.releaseType,other.releaseDamageMod*other.damageTaken,max(other.releaseStaggerMod*other.staggerTaken,1.8),other.releaseKnockbackMod*other.knockbackTaken,other.releaseSpecialType,other.releaseSpecialValue,other.releasePierce,other.releaseSprite,other.releaseHitSoundType,other.releaseEffects)
		{
			forceDrawBox = true;
		}
	}
	instance_destroy();
}
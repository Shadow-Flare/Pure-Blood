event_inherited();

if lastHitTypes[| damageType.none] hasBeenHit = true;

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
		takenHitData[? damageData.stagger] *= releaseStaggerMod;
		takenHitData[? damageData.knockback] *= releaseKnockbackMod;
		
		takenHitData[? damageData.slash] *= releaseDamageMod;
		takenHitData[? damageData.pierce] *= releaseDamageMod;
		takenHitData[? damageData.blunt] *= releaseDamageMod;
		takenHitData[? damageData.fire] *= releaseDamageMod;
		takenHitData[? damageData.ice] *= releaseDamageMod;
		takenHitData[? damageData.lightning] *= releaseDamageMod;
		takenHitData[? damageData.arcane] *= releaseDamageMod;
		takenHitData[? damageData.light] *= releaseDamageMod;
		takenHitData[? damageData.dark] *= releaseDamageMod;
		
		with caster 
			with scr_create_attack(other.releaseFrameData,other.releaseFollow,other.releaseDuration,other.takenHitData,other.releasePierce,other.releaseSprite,other.releaseHitSoundType,other.releaseEffects)
		{
			forceDrawBox = true;
		}
	}
	instance_destroy();
}
var reflectDuration = 1.6;
var reflectCastTime = 0.4;

var reflectEffectDuration = 1.0;
var reflectEffectFollow = false;
var reflectEffectSprite = spr_grimoire_reflect;
var reflectEffectDrawBox = true;

var reflectAbsorbSound = noone;
var reflectAbsorbSprite = noone;
var ReflectAbsorbDuration = 0.4;

var reflectReleaseFrameData = -1;
var reflectReleaseDuration = 0.6;
var reflectReleaseEffects = noone;

//all damage data set in effect create

var reflectReleasePierce = 0;
var reflectReleaseFollow = false;
var reflectReleaseHitSoundType = undefined;
var reflectReleaseSprite = spr_grimoire_reflectRelease;
var reflectReleaseDrawBox = true;

if subPhase == subState.none 
{
	subPhase = subState.performing;
	reflectInstance = noone;
}

switch subPhase
{
	case subState.performing:
		if instance_exists(reflectInstance) hitPhase = hitState.dodging;
		if subPhaseTimer == round(reflectCastTime*room_speed)
		{
			#region Create Reflect Effect
			reflectInstance = instance_create_depth(x,y,depth-1,obj_reflect_effect);
			with reflectInstance
			{
				caster = other;
				actorType = other.actorType;
				duration = reflectEffectDuration;
				follow = reflectEffectFollow;
				forceDrawBox = reflectEffectDrawBox;
				sprite_index = reflectEffectSprite;
				image_speed = sprite_get_number(sprite_index)/abs(duration);
				
					//hitData management
				if PlayerStats.currentOffhandIndex == 0 var cache = PlayerStats.weaponOff1DamageDetails;
				else var cache = PlayerStats.weaponOff2DamageDetails;
	
				var magPow = cache[? weaponDamageDetails.arcane] / 150;
				var reflectReleaseDamageMod =  1 + (1+magPow);
				var reflectReleaseStaggerMod = 1.5 + (1+magPow);
				var reflectReleaseKnockbackMod = 0.7 + (1+magPow);
				
					//absorb data
				absorbSound = reflectAbsorbSound;
				absorbSprite = reflectAbsorbSprite;
				absorbDuration = ReflectAbsorbDuration;
				
					//reflect data
				releaseFrameData = reflectReleaseFrameData;
				releaseDuration = reflectReleaseDuration;
				releaseEffects = reflectReleaseEffects;

				releaseDamageMod =  reflectReleaseDamageMod;
				releaseStaggerMod = reflectReleaseStaggerMod;
				releaseKnockbackMod = reflectReleaseKnockbackMod;

				releasePierce = reflectReleasePierce;
				releaseFollow = reflectReleaseFollow;
				releaseHitSoundType = reflectReleaseHitSoundType;
				releaseSprite = reflectReleaseSprite;
				releaseDrawBox = reflectReleaseDrawBox;
			}
			#endregion
		}
		if subPhaseTimer >= round(reflectDuration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer()
		}
			//speed
		xSpd -= xSpd/4;
			//Sprite
		update_sprite(sprPlayerBodyDefaultShrapnelBurst,-reflectDuration)
}		
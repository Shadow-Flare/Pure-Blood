var shrapnelBurstDuration = 0.8;
var shrapnelBurstFireTime = 0.3;
var shrapnelBurstframeData = -1;
var shrapnelBurstattackDuration = 0.6;
var shrapnelBursthitEffects = noone;
var shrapnelBursthitType = damageType.pierce;
var shrapnelBursthitDamage = 1.2 * PlayerStats.magicalPower;
var shrapnelBursthitStagger = 2 * PlayerStats.physicalStagger;
var shrapnelBursthitKnockback = 2.4;
var shrapnelBurststatusType = specialType.none;
var shrapnelBurststatusValue = 0;
var shrapnelBurstpierce = 1;
var shrapnelBurstFollow = false;
var shrapnelBurstHitSoundType = undefined;
var shrapnelBurstSprite = sprShrapnelBurstEffect;
var sprShrapnelBurstForceDrawBox = true;

if subPhase == subState.none subPhase = subState.performing;

#region ground offhand
switch subPhase
{
	case subState.performing:
		if subPhaseTimer == round(shrapnelBurstFireTime*room_speed)
		{
			#region Create Attack Effect
			with instance_create_depth(x,y,depth-1,objMeleeAttackEffect)
			{
				caster = other;
				casterType = other.actorType;
				//get effect properties/collisions
					//STATS
					frameData = shrapnelBurstframeData;
					attackDuration = shrapnelBurstattackDuration;
					hitEffects = shrapnelBursthitEffects;
					hitType = shrapnelBursthitType;
					hitDamage = shrapnelBursthitDamage;
					hitStagger = shrapnelBursthitStagger;
					hitKnockback = shrapnelBursthitKnockback;
					statusType = shrapnelBurststatusType;
					statusValue = shrapnelBurststatusValue;
					pierce = shrapnelBurstpierce;
		
					hitSoundID = noone;
					var hitAudioType = shrapnelBurstHitSoundType;
					if hitAudioType == undefined
					{
							//vvv this will likely need to change
						if attackType = 2 var type = 2;
						else var type = 1;
						var wholeCache = AudioCache.audioHitCache[| type];
						var subtypeCache = wholeCache[| hitType];
						var size = ds_list_size(subtypeCache);
						if size != 0
						{
							var num = irandom_range(0,size-1)
							hitSoundID = subtypeCache[| num]
						}
					}
					else if hitAudioType < 0
					{
						//add misc sounds here
						hitSoundID = noone;
					}
	
				//Set
				timer = 0;
				facing = other.facing;
				follow = shrapnelBurstFollow;

				forceDrawBox = sprShrapnelBurstForceDrawBox;
				sprite_index = shrapnelBurstSprite;
				image_index = 0;
				image_alpha = 1.0;
				image_speed = sprite_get_number(sprite_index)/abs(attackDuration);
				image_xscale = facing;
			}
			#endregion
		}
		if subPhaseTimer >= round(shrapnelBurstDuration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_player_base_subPhaseDeterminer()
		}
			//speed
		xSpd -= xSpd/4;
			//Sprite
		update_sprite(sprPlayerBodyDefaultShrapnelBurst,-shrapnelBurstDuration)
}		
#endregion
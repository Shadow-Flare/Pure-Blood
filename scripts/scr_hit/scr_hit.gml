///@arg source
///@arg audioID
///@arg hitData
///@arg caster
///@arg effects

var source = argument0;
var audioID = argument1;
var hitData = argument2;
var caster = argument3;
var effects = argument4;

image_blend = c_red;
	
	//audio
if audioID != noone && audioID != undefined audio_play_sound(audioID,10,0)
	//damage
var mh = statCache.hpMax;
var ph = statCache.hp;

var slashDam = max(hitData[? damageData.slash]-statCache.damageResistances[damageType.slash],0);
var pierceDam = max(hitData[? damageData.pierce]-statCache.damageResistances[damageType.pierce],0);
var bluntDam = max(hitData[? damageData.blunt]-statCache.damageResistances[damageType.blunt],0);
var fireDam = hitData[? damageData.fire]*statCache.damageResistances[damageType.fire];
var iceDam = hitData[? damageData.ice]*statCache.damageResistances[damageType.ice];
var lightningDam = hitData[? damageData.lightning]*statCache.damageResistances[damageType.lightning];
var arcaneDam = hitData[? damageData.arcane]*statCache.damageResistances[damageType.arcane];
var lightDam = hitData[? damageData.light]*statCache.damageResistances[damageType.light];
var darkDam = hitData[? damageData.dark]*statCache.damageResistances[damageType.dark];
	
var damageTotal = slashDam + pierceDam + bluntDam + fireDam + iceDam + lightningDam + arcaneDam + lightDam + darkDam;
statCache.hp = clamp(statCache.hp-damageTotal,0,mh);

var bleedDam = hitData[? damageData.bleed];
var poisonDam = hitData[? damageData.poison];
	
statCache.specialDamages[specialType.bleed] += bleedDam;
statCache.specialDamages[specialType.poison] += poisonDam

var hpLostRatio = ((ph-statCache.hp)/mh);
var partCount = hpLostRatio*(100*0.50);
var partSpeed = 1+hpLostRatio*(100*0.04);
if instance_exists(caster) var src = caster;
else var src = source;
	//blood pixels
scr_hit_effect_blood(src,statCache.hitEffectType,statCache.hitEffectColour,partCount,partSpeed);
	//Flash
with instance_create_layer(x,y,"lay_lights",objLightHitFlash)
{
	duration = 0.1;
	colour = make_color_rgb(255,150,150);
}
	//roundup hp
statCache.hp = clamp(statCache.hp,0,statCache.hpMax);
		
	//hit effects
if instance_exists(caster) && effects != noone && effects != undefined && ds_exists(effects,ds_type_map)
{
	if effects[? hitEffect.drainHpBase] != undefined || effects[? hitEffect.drainHpScale] != undefined
	{
		var casterStats = caster.statCache;
		var drainPercent = 0;
		if effects[? hitEffect.drainHpBase] != undefined drainPercent += effects[? hitEffect.drainHpBase];
		if effects[? hitEffect.drainHpScale] != undefined drainPercent += effects[? hitEffect.drainHpScale]*casterStats.drainMod;
		var drainValue = round(drainPercent*damageTotal/2)*2;		//drains based on damaeg dealt, not hp removed
		if drainValue <= 1 drainValue = 2;
		repeat(drainValue/2) with instance_create_depth(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),-9000,obj_drain_hp_effect)
		{
			target = caster;
			var angle = random(360);
			var spd = random_range(2,3.5);
			xSpd = spd*dcos(angle);
			ySpd = -spd*dsin(angle);
		}
	}
	if effects[? hitEffect.drainMpBase] != undefined || effects[? hitEffect.drainMpScale] != undefined
	{
			//data
		var casterStats = caster.statCache;
		var drainPercent = 0;
		if effects[? hitEffect.drainMpBase] != undefined drainPercent += effects[? hitEffect.drainMpBase];
		if effects[? hitEffect.drainMpScale] != undefined drainPercent += effects[? hitEffect.drainMpScale]*casterStats.drainMod;
			
			//implicit mana burn
		var pm = statCache.mp;
		statCache.mp = clamp(statCache.mp-damageTotal*drainPercent,0,statCache.mpMax);
		var drainedMp = pm-statCache.mp;	//syphon mana to play based on mp removed (for now), not damage.
				//leftover damage into hp at reduced amount (8 times weaker)
		var drainDif = damageTotal*drainPercent-drainedMp;
		var ph = statCache.hp;
		statCache.hp = clamp(statCache.hp-drainDif/8,0,statCache.hpMax);
		drainedMp += ph-statCache.hp;
			
			//effects
		var drainValue = round(drainedMp/2)*2;
		if drainValue <= 1 drainValue = 2;
		repeat(drainValue/2) with instance_create_depth(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),-9000,obj_drain_mp_effect)
		{
			target = caster;
			var angle = random(360);
			var spd = random_range(2,3.5);
			xSpd = spd*dcos(angle);
			ySpd = -spd*dsin(angle);
		}
	}
}
if scr_player_ability_get(abilityType.support,supportAbility.damage_scan,playerAbilityStats.numberActivated) >= 1 scr_hit_effect_number(x,bbox_top-8,source.mainType,damageTotal);
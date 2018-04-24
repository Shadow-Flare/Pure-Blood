///@arg Angle
var fireAngle = argument0;

#region determine wiff && click
var mCost = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.manaCost)
if GameManager.thereisnospoon mCost = 0;
if PlayerStats.mp >= mCost
{
	PlayerStats.mp -= mCost;
	var w = false;
}
else var w = true;
var ammoItem = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.ammoItem)
if GameManager.thereisnospoon ammoItem = noone;
if ammoItem != noone
{
	var ammoItemCount = scr_player_inventory_get(itemType.item,ammoItem);
	if ammoItemCount != 0 
	{
		scr_player_inventory_manage(itemType.item,ammoItem,-1);
		var click = false;
	}
	else var click = true
}
else var click = false
#endregion

var OFFID = PlayerStats.currentOffhandID;
var SUBID = PlayerStats.currentOffhandSubtypeID;
var qD = fireAngle+random_range(-2,2);
var spd = subtype_get_stat(SUBID,offhandSubtypeStats.projectileSpeed);
var projectileXStrt = x+facing*3+(16*dcos(qD)+facing*(2*dcos(qD+90)));
var projectileYStrt = y-6-(16*dsin(qD)+facing*(2*dsin(qD+90)));
if fireAngle > 90 || fireAngle < 270 projectileYStrt+=2;

if !click with instance_create_depth(projectileXStrt,projectileYStrt,depth,obj_grimoire_projectile)
{
	if !w
	{
			//initial projectile variables
		caster = other;
		casterType = other.actorType; 
		offID = OFFID;
		subID = SUBID;
		xSpd = spd*dcos(qD);
		ySpd = -spd*dsin(qD);
		hitSoundID = noone;			//CHANGE//
		hitEffects = subtype_get_stat(subID,offhandSubtypeStats.effect);
		hitType = subtype_get_stat(subID,offhandSubtypeStats.damType);
		hitDamage = subtype_get_stat(subID,offhandSubtypeStats.damVal);
		hitStagger = subtype_get_stat(subID,offhandSubtypeStats.forVal);
		hitKnockback = subtype_get_stat(subID,offhandSubtypeStats.knockback);
		statusType = subtype_get_stat(subID,offhandSubtypeStats.specType);
		statusValue = subtype_get_stat(subID,offhandSubtypeStats.specVal);
	
		boundEffect = subtype_get_stat(subID,offhandSubtypeStats.boundEffect);
		explodeDuration = subtype_get_stat(subID,offhandSubtypeStats.explodeDuration);
		explodeScale = subtype_get_stat(subID,offhandSubtypeStats.explodeScale);
	
		pierce = false;
	
			//sfx
		//audio_play_sound(snd_crossbow_fire,10,0);
	
			//gfx
		//with create_effect(false,x,y,depth+1,spr_radial_glow,0.3,1/sprite_get_width(spr_radial_glow),0.5/sprite_get_height(spr_radial_glow))
		//{
		//	switch other.hitType
		//	{
		//		case damageType.slash: case damageType.pierce: case damageType.blunt:
		//			image_blend = c_white;
		//			break;
		//		case damageType.fire: image_blend = c_orange; break;
		//		case damageType.ice: image_blend = merge_colour(c_white,c_blue,0.5); break;
		//		case damageType.lightning: image_blend = c_yellow; break;
		//		case damageType.arcane: image_blend = merge_colour(c_white,c_purple,0.5); break;
		//		case damageType.light: image_blend = merge_colour(c_white,c_yellow,0.5); break;
		//		case damageType.dark: image_blend = merge_colour(c_red,c_purple,0.5); break;
		//	}
		
		//	image_angle = qD+90;
		//	alphaAdd = -(1/(room_speed*duration));
		//	xScaleGrowth = 1.2;
		//	yScaleGrowth = 1.2;
		//}
	}
	else //can wiff
	{
			//sfx
			
			//gfx
	}
}
//else	//cant click
//{
//	//audio_play_sound(snd_crossbow_wiff,10,0);
//}
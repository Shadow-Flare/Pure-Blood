///scr_take_damage(attackType,attackPower,specialType,specialPower,caster)
var source = argument0;
var attackType = argument1;
var attackPower = argument2;
var specialType = argument3;
var specialPower = argument4;
var caster = argument5;

hpPrev = hp;
if variable_instance_exists(source,"subId")
{
	if ComboCache.offhandSubtypeNames[source.subId] != "Osmose"
	{
		if attackType != -1 hp -= (100/resistances[attackType])*attackPower;
	}
	else
	{
		if variable_instance_exists(id,"mp")
		{
			if mp >= attackPower
			{
				if attackType != -1 mp -= (100/resistances[attackType])*attackPower;
				statHit = "mp";
			}
			else
			{
				if attackType != -1 hp -= (100/resistances[attackType])*(attackPower/2);
				statHit = "hp";
			}
		}
		else
		{
			if attackType != -1 hp -= (100/resistances[attackType])*(attackPower/2);
			statHit = "hp";
		}
	}
}
else if attackType != -1 hp -= (100/resistances[attackType])*attackPower;

if object_index = objPlayer var mh = PlayerStats.hpmax
else var mh = maxHp
var hpLostPC = (abs(hpPrev-hp)/mh)

if object_index = objPlayer hp = clamp(hp,0,PlayerStats.hpmax)
else hp = clamp(hp,0,maxHp)
if variable_instance_exists(id,"mp")
{
	if object_index = objPlayer mp = clamp(mp,0,global.mpMax)
	else mp = clamp(mp,0,maxMp)
}

if specialType != -1 statusValues[specialType] += (100/statusResistances[specialType])*specialPower;

if source.type == "proj"
{
	if (source.object_index == obj_crossbow_projectile)
	{
		with source
		{
			target = other;
			targetFacingPrev = other.facing;
			relX = x-other.x;
			relY = y-other.y;
		}
	}
	if (source.object_index == obj_spells_projectile)
	{
		if ComboCache.offhandSubtypeNames[source.subId] == "Leech"
		{
			if hitEffectType == "blood"
			{
				var hpLost = hpPrev-hp;
				for (var i = 0; i < hpLost; i++)
				{
					with instance_create_depth(x,y,depth-1,obj_blood_heal)
					{
						dir = random(360);
						spd = random_range(4,6);
						xSpd = spd*dcos(dir);
						ySpd = -spd*dsin(dir);
						normalMoveDuration = random_range(0.4,0.8);
						angularSpeed = random_range(-0.5,0.5);
						imageScale = random_range(1.75,2.25);
						image_yscale = imageScale;
						image_xscale = imageScale;
						image_angle = random(360);
						target = caster;
						lifeTime = 0;
						if other.hitEffectColour == "dark red"
						{
							image_blend = make_color_rgb(random_range(100,150),0,0);
						}
					}
				}
			}
		}
		else if ComboCache.offhandSubtypeNames[source.subId] == "Osmose"
		{
			if statHit = "mp" var statLost = mpPrev-mp;
			else if statHit = "hp" var statLost = hpPrev-hp;
			
			for (var i = 0; i < statLost; i++)
			{
				with instance_create_depth(x,y,depth-1,obj_essence_heal)
				{
					dir = random(360);
					spd = random_range(4,6);
					xSpd = spd*dcos(dir);
					ySpd = -spd*dsin(dir);
					normalMoveDuration = random_range(0.4,0.8);
					angularSpeed = random_range(-0.5,0.5);
					imageScale = random_range(0.75,1.25);
					image_yscale = imageScale;
					image_xscale = imageScale;
					image_angle = random(360);
					target = caster;
					lifeTime = 0;
					image_blend = c_aqua;
				}
			}
		}
	}
}
if object_index = objPlayer var mh = PlayerStats.hpmaxhpmax
else var mh = maxHp
var partCount = hpLostPC*50
var partSpeed = 5+hpLostPC*30
scr_hit_effect(caster,hitEffectType,hitEffectColour,partCount,partSpeed);
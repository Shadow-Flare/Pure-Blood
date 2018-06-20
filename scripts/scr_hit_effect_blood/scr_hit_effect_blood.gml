//get box stats
var enemy = argument0;
var hitEffectType = argument1;
var hitEffectColour = argument2;
var partCount = argument3;
var partAveAngle = argument4;
var partSpeed = argument5;

var Sx = x;
var Sy = y;

if partAveAngle != noone
{
	var dirNum = sign(Sx-enemy.x);
	if dirNum == 1 partAveAngle = 180-partAveAngle;
	partAveAngle += 180;
}
else
{
	partAveAngle = random(360);
}

//base blood info
if hitEffectType = "blood"
{
	randomize()
	var angleVar = random_range(-10,10)
	for (var i = 0; i < random_range(partCount-irandom(2),partCount+irandom(2));i++)
	{
		if hitEffectColour = "dark red" var colour = make_color_rgb(random_range(60,190),32,32);
		var part = instance_create_depth(Sx+random_range(-4,4),Sy+random_range(-4,4),depth+1,obj_blood)
		part.image_blend = colour;
		var theta = partAveAngle+angleVar+random_range(-25,25)
		var spd = random_range(partSpeed/8,partSpeed);
		part.hspeed = spd*dcos(theta);
		part.vspeed = spd*dsin(theta);
		part.image_angle = 0;
		var scale = 1.5;
		part.image_xscale = scale;
		part.image_yscale = scale;
		part.colour = colour;
		part.hoverDuration = random_range(0.1,0.4);
	}
}
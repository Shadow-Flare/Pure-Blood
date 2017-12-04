///@arg x
///@arg y
///@arg sprite
///@arg duration
///@arg angle
///@arg alpha
var xInitial = argument0;
var yInitial = argument1;
var spr = argument2;
var dur = argument3;
var ang = argument4;
var xScale = argument5;
var yScale = argument6;
var alp = argument7;

with instance_create_depth(xInitial,yInitial,depth-1,objEffectGeneral)
{
	sprite_index = spr;
	duration = dur;
	image_angle = ang;
	image_alpha = alp;
	image_xscale = xScale;
	image_yscale = yScale;
	
	follow = false;
}
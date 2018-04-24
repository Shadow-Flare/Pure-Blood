///@arg follow?
///@arg x
///@arg y
///@arg depth
///@arg sprite
///@arg duration
///@arg xScale
///@arg yScale

var createFollow = argument0;
var createX = argument1;
var createY = argument2;
var createDepth = argument3;
var createSprite = argument4;
var createDuration = argument5;
var createXScale = argument6
var createYScale = argument7;

if createSprite == noone return noone;

with instance_create_depth(createX,createY,createDepth,objEffectGeneral)
{
	follow = createFollow;
	caster = other;
	sprite_index = createSprite;
	duration = createDuration;
	image_speed = sprite_get_number(sprite_index)/duration;
	image_xscale = createXScale;
	image_yscale = createYScale;
	return id;
}
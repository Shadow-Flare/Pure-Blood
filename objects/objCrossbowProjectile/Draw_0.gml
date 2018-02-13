//change angle with speed
if hitOn image_angle = point_direction(x-xSpd,y-ySpd,x,y)-90

//trail && effects
scr_draw_trail(hitOn,trailDuration,trailNumberOfTrails,trailNumberOfPoints,trailColour,trailSizeRatio,trailVariance,1,0);
if ComboCache.offhandSubtypeNames[? subId] = "Frozen Bolts"
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_glow,0,x,y,2+sin(lifeTime/40)/2,2+sin(lifeTime/40)/2,0,make_colour_rgb(0,177,255),0.3*image_alpha);
	gpu_set_blendmode(bm_normal);
}
if ComboCache.offhandSubtypeNames[? subId] = "Charged Bolts"
{
	gpu_set_blendmode(bm_add);
	if floor(lifeTime%10) == 0 sinScaleVar = random_range(0,1)
	draw_sprite_ext(spr_glow,0,x,y,2+sin(lifeTime/40)*sinScaleVar,2+sin(lifeTime/40)*sinScaleVar,0,make_colour_rgb(255,193,40),0.3*image_alpha);
	gpu_set_blendmode(bm_normal);
}

//fade out
if lifeTime > room_speed*6
{
	image_alpha = (1-((lifeTime-room_speed*6)/room_speed*2))
}

draw_self();
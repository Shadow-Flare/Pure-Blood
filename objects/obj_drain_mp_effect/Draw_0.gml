scr_draw_trail(true,trailNumberOfTrails,trailDuration,trailNumberOfPoints,trailColour,trailSizeRatio,trailVariance,trailAlpha,trailJitter,trailType);

draw_sprite_ext(sprFireGlow,0,x,y,4/sprite_get_width(sprFireGlow),4/sprite_get_height(sprFireGlow),0,merge_color(c_black,c_purple,0.5),1.0);

draw_self();
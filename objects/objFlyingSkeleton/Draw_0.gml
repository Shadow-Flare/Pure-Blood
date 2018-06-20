//draw self
draw_self();

//hitbox (testing)
if GameManager.actorBoxVisuals draw_hitbox(c_purple);

////target location (testing)
//draw_set_colour(c_green);
//draw_circle(xTarget,yTarget,2,false);
//draw_set_colour(c_white);
//draw_set_font(fnt_small_pixel);
//draw_text_transformed(xTarget-2,yTarget-2,"pha: "+string(phase),1/6,1/6,0);
//draw_text_transformed(xTarget-2,yTarget+2,"sub: "+string(subPhase),1/6,1/6,0);
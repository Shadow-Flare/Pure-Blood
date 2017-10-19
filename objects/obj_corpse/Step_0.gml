//phasePrev = phase;
//onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent)));

////phases
//if !onGround && phase == "idle"
//{
//	phase = "fling"
//	scr_enemy_attack(9999,0,0,16,16,1,damage,stagger,15,-1,0,0);
//}
//else if onGround && phase = "fling"
//{
//	phase = "idle"
//}

////movement
//if !onGround
//{
//	xSpd -= xSpd/90;
//}
//else if onGround
//{
//	xSpd -= xSpd/4;
//}
//ySpd += GameManager.grav*0.75;

//xSpdPrev = xSpd;
//scr_move_with_collisions();
//if (xSpdPrev != 0 && xSpd = 0)||deflected
//{
//	xSpd = -xSpdPrev*0.4;
//	deflected = 0;
//}

//if phasePrev != phase image_index = 0;
//image_xscale = facing;
//if phase == "idle"
//{
//	sprite_index = spr_corpse_idle;
//}
//else if phase == "fling"
//{
//	//sprite_index = spr_corpse_flung;
//}
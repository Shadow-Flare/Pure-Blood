ySpdPrev = ySpd;

onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent))) && place_free(x,y);

if !onGround xSpd -= xSpd/120;
else xSpd -= xSpd/4;

if !onGround ySpd += GameManager.grav*0.75;

scr_actor_moveWithCollisions();

onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent))) && place_free(x,y);

if onGround && ySpd == 0 && abs(ySpdPrev) >= 4
{
	ySpd = clamp(-abs(ySpdPrev)*0.66,-20,0);
}
if ySpd != 0 xSpd -= xSpd/100;
else xSpd -= xSpd/4;
ySpd += GameManager.grav * 0.5;

scr_actor_moveWithCollisions();
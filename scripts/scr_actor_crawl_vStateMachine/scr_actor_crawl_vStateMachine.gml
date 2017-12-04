	//basic for now, may want to implement platform follow later, will be different to gorund actors since it will require checks for all 4 directions. it'll also need tw
xSpd += GameManager.grav*dcos(actorDirection*90);
ySpd += -GameManager.grav*dsin(actorDirection*90);
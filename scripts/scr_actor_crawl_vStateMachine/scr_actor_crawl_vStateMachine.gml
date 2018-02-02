	//basic for now, may want to implement platform follow later, will be different to grund actors since it will require checks for all 4 directions. it'll also need tw
var xDir = dcos(actorDirection*90);
var yDir = -dsin(actorDirection*90);

with obj_block_nonSolid solid = true;

if !place_free(x+xDir,y-yDir)
{
	xSpd += GameManager.grav*xDir;
	ySpd += GameManager.grav*yDir;
}

with obj_block_nonSolid solid = true;
attackType = attackTypes.projectile;

timer = 0;

phase = 0;
hitOn = true;
hasDeflected = false;

initialScale = 1;
gravitySpeed = GameManager.grav;

normalMovementDuration = 0.7

image_xscale = initialScale;
image_yscale = image_xscale;

hitList = ds_list_create();
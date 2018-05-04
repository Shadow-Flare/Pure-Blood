enum projectilePhase {normal, exploding}

xSpd = 0;
ySpd = 0;

effect = noone;
caster = noone;						//must fill
casterType = noone;					//must fill
attackType = attackTypes.projectile;
hitOn = false;
hitList = ds_list_create();
hitData = ds_map_create();
phase = projectilePhase.normal;
phaseTimer = 0;

initialized = false;
boundEffect = noone;
effectEnabled = false;
effectBurst = false;

normalScale = 1
normalDuration = -1;				//seconds, infinite by default. if otherwise desired specify on create.
normalStepScript = noone;			//optional script to run every second.

explodeScale = 4;
explodeDuration = 0.7;				//seconds. This is a default, if want to have a different explode dur specify on creation.
explodeStartScript = noone;			//optional start/end scripts on explosion
explodeEndScript = noone;			//optional start/end scripts on explosion
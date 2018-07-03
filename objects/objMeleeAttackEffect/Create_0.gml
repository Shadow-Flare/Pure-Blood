attackType = attackTypes.melee;
boundEffect = noone;
initialized = false;

forceDrawBox = false;

hitOn = false;
hasHit = false;
follow = false;
frameData = -1;

hitListResetDuration = 1.6;

soundPlayed = false;

hitList = ds_list_create();
hitData = ds_map_create();
hitAngle = noone;

xSpd = 0;
ySpd = 0;
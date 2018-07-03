event_perform_object(obj_hitable,ev_create,0);
event_inherited();

sprite_index = noone;
ID = noone;
initialized = false;

shakeDuration = 0.6;
shakeTimer = 0;
shakeAmount = 1.2;
breakStagger = 6.5;

xInitial = x;
yInitial = y;
xMod = 0;
yMod = 0;
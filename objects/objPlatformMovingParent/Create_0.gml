event_inherited();

path = noone;
enabled = true;
enabledPrev = enabled;

variant = interactableVariant.worldID;		//default, set in create if otherwise

pathSpeedDefault = 1;
pathEndAction = path_action_stop;
pauseDuration = 1.6;

timer = 0;

futurePathSpeed = 0;
futureRestart = false;

delayedExtra = noone;
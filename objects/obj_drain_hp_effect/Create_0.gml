xSpd = 0;
ySpd = 0;

target = noone;

phase = 0	//phase 0 is not chasing, 1 is. 2 is inactive (for the trail effect to persist);
phaseTimer = 0;

nonChaseDuration = 0.35;
nonChaseSpdMod = 0.9;

chaseAngleMod = 90/room_speed;
chaseSpdMod = 1.05;

speedMax = 4;
speedMin = 0.2;

imageAngleAmount = 130/room_speed;
imageAngleMod = random_range(0.5,1)*choose(-1,1);

trailNumberOfTrails = 1;
trailDuration = 0.225;
trailNumberOfPoints = 8;
trailColour = c_red;
trailSizeRatio = 0.6;
trailVariance = 0;
trailAlpha = 1.0;
trailJitter = 0;
trailType = 0;

image_blend = merge_colour(c_red,c_black,0.65);
image_xscale = 1.5;
image_yscale = 1.5;
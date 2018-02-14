lifeTime = irandom(60);
enabled = true;
variance = 8;
iterationsPerSec = 0.75;
colour = make_color_rgb(225,150,100);
radius = 200;
simDepth = 0.6;

maxLightSize = radius+variance;

lightSize = radius;
sizeMod = 0;

occlusionMap = noone;
shadowMap1D = noone;
lifeTime = irandom(60);
enabled = false;

variance = 0;
iterationsPerSec = 0.75;

colourR = 255;
colourG = 255;
colourB = 255;
colour = make_color_rgb(colourR,colourG,colourB);

radius = 200;

maxLightSize = radius+variance;

lightSize = radius;
sizeMod = 0;
showHud = true;
hudFadeDuration = 0.6; //seconds
hudAlpha = 0;

//message feed
messageFeed = ds_list_create();
messageTimers = ds_list_create();
messageTop = 0

messageFadeDuration = 1;
messageShowDuration = 3;
messageDivider = 50;
messageMovePerFrame = 1;

spriteTimer = 0;

//TOP LEFT
topLeftResolutionScale = 4;
topLeftBorder = 10;

hpR1=30;
hpR2=22;
hpA=60;
hpPP=1.1/topLeftResolutionScale;
hpColour = c_green;
hpDamageColour = make_color_rgb(200,0,0);
hpBackColour = c_black;
hpBorder = 2;

hpDamageDisplay = 0;
hpDamageTarget = hpDamageDisplay;
hpDamageDelay = 1;						//seconds
hpDamageDelayTimer = 0;
hpXI=topLeftBorder+hpR1;
hpYI=topLeftBorder+hpR1;

mpXI = hpXI-16;
mpYI = hpYI-hpR2+1;
mpBarHeight = hpR1-hpR2-1;
mpBorder = 2;
mpColour = c_blue;
mpBackColour = c_black;
mpPP = 2/topLeftResolutionScale;

topLeftSurf = noone;
hpSurf = noone;
hpSurfB = noone;
mpSurf = noone;

//Map
hudMapWidth = surface_get_width(application_surface)/8;
hudMapHeight = surface_get_height(application_surface)/8;

hudMapBorderColour = c_white;
hudMapBorderWidth = 2;
hudMapPixelScale = 2;
hudMapDetailScale = 2;

hudMapSurf = noone;
hudMapDetails = surface_create(hudMapWidth,hudMapHeight);

hudMapEnabled = false;
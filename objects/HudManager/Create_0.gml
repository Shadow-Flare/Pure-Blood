showHud = true;
hudFadeDuration = 0.6; //seconds
hudAlpha = 0;

//Damage Numbers
damageNumberSurf = noone;
damageNumbers = ds_list_create();

//message feed
messageFeed = ds_list_create();
messageImages = ds_list_create();
messageTimers = ds_list_create();
messageTop = 0

messageFadeDuration = 1;
messageShowDuration = 3;
messageFont = fnt_alagard;
messageDivider = 50;
messageBorder = 20;
messageMovePerFrame = 1;
messageImageOffsetX = -48;
messageImageOffsetY = -10;
messageImageSizeX = 48;
messageImageSizeY = messageImageSizeX;

spriteTimer = 0;

//TOP LEFT
topLeftResolutionScale = 4;
topLeftBorder = 10;

hpRMax = 40;
hpR1 = 30;
hpR2 = 22;
hpA=60;
hpPP=1.1/topLeftResolutionScale;
hpColour = c_green;
hpDamageColour = make_color_rgb(200,0,0);
hpBackColour = c_black;
hpBorder = 2;
hpAnimTimer = 0;
hpAnimStep = (1.8*room_speed)/sprite_get_number(spr_hp_anim_bar);

hpDamageDisplay = 0;
hpDamageTarget = hpDamageDisplay;
hpDamageDelay = 1;						//seconds
hpDamageDelayTimer = 0;
hpXI=topLeftBorder+hpR1;
hpYI=topLeftBorder+hpR1;

mpXI = hpXI;
mpYI = hpYI-hpR2+1;
mpColour = c_blue;
mpPP = 2/topLeftResolutionScale;
mpAnimTimer = 0;
mpAnimStep = (0.8*room_speed)/sprite_get_number(spr_mp_anim_bar);

topLeftSurf = noone;
hpSurf = noone;
hpSurfA = noone;
hpSurfB = noone;
hpSurfC = noone;
mpSurf = noone;
mpSurfA = noone;

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
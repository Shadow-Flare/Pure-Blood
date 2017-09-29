enum godControllerState {mainMenu, inGame, arena}
phase = godControllerState.mainMenu

application_surface_draw_enable(0);
window_set_fullscreen(1);
window_set_cursor(cr_none);

//old
	global.time = 0;

	//general variables
	player = instance_find(obj_player,0);
	darknessStr = 0;
	dU = -1;
	dD = -1;
	dL = -1;
	dR = -1;
	dUQuickMenu = 0;

	//Console create
	scr_console_create();

	//Lighting: initials
	light = surface_create(1,1);
	shadowType = "basic";

	//fog: initials
	fogLevel = 0;
	fogSpriteNumbers = [0,0,0];
	fogSpriteData = noone
	for (var i = 0; i < 3; i++)
	{
		 fogSurfaces[i] = surface_create(room_width,room_height);
	}

	//blur: initials
	//application_surface_draw_enable(0);
	bloomIntensity = shader_get_uniform(shd_bloom, "intensity");
	bloomblurSize = shader_get_uniform(shd_bloom, "blurSize");


	//Blood: initials
	tiles = surface_create(room_width,room_height);
	blood = surface_create(room_width,room_height);
	bloodyTiles = surface_create(room_width,room_height);
	temp = surface_create(room_width,room_height);

	new = 1;
	global.paused = 0;
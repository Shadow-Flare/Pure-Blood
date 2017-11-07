#region audio cache initializers
	//base
audioHitCache = ds_list_create();
audioHitCache[| 0] = ds_list_create();
audioHitCache[| 1] = ds_list_create();
audioHitCache[| 2] = ds_list_create();

	//light
var cacheLight = audioHitCache[| 0];
cacheLight[| 0] = ds_list_create();			//slash
cacheLight[| 1] = ds_list_create();			//blunt
cacheLight[| 2] = ds_list_create();			//pierce
cacheLight[| 3] = ds_list_create();			//fire
cacheLight[| 4] = ds_list_create();			//ice
cacheLight[| 5] = ds_list_create();			//lightning
cacheLight[| 6] = ds_list_create();			//arcane
cacheLight[| 7] = ds_list_create();			//light
cacheLight[| 8] = ds_list_create();			//dark
cacheLight[| 9] = ds_list_create();			//X damage

	//medium
var cacheMedium = audioHitCache[| 1];
cacheMedium[| 0] = ds_list_create();		//slash
cacheMedium[| 1] = ds_list_create();		//blunt
cacheMedium[| 2] = ds_list_create();		//pierce
cacheMedium[| 3] = ds_list_create();		//fire
cacheMedium[| 4] = ds_list_create();		//ice
cacheMedium[| 5] = ds_list_create();		//lightning
cacheMedium[| 6] = ds_list_create();		//arcane
cacheMedium[| 7] = ds_list_create();		//light
cacheMedium[| 8] = ds_list_create();		//dark
cacheMedium[| 9] = ds_list_create();		//X damage

	//heavy
var cacheHeavy = audioHitCache[| 2];
cacheHeavy[| 0] = ds_list_create();			//slash
cacheHeavy[| 1] = ds_list_create();			//blunt
cacheHeavy[| 2] = ds_list_create();			//pierce
cacheHeavy[| 3] = ds_list_create();			//fire
cacheHeavy[| 4] = ds_list_create();			//ice
cacheHeavy[| 5] = ds_list_create();			//lightning
cacheHeavy[| 6] = ds_list_create();			//arcane
cacheHeavy[| 7] = ds_list_create();			//light
cacheHeavy[| 8] = ds_list_create();			//dark
cacheHeavy[| 9] = ds_list_create();			//X damage

	//slash
		//light
var slashLight = cacheLight[| 0];

		//medium
var slashMedium = cacheMedium[| 0];
slashMedium[| 0] = snd_slash_hit_medium_1;
slashMedium[| 1] = snd_slash_hit_medium_2;

		//heavy
var slashHeavy = cacheHeavy[| 0];
slashHeavy[| 0] = snd_slash_hit_heavy_1;
#endregion

#region stepping cache initializers
steppingAudioCache = ds_list_create();
steppingAudioCache[| 0] = ds_list_create();		//Solid			
steppingAudioCache[| 1] = ds_list_create();		//Grass

var cacheSolid = steppingAudioCache[| 0];
cacheSolid[| 0] = sndStepSolid1;
cacheSolid[| 1] = sndStepSolid2;
cacheSolid[| 2] = sndStepSolid3;
cacheSolid[| 3] = sndStepSolid4;
cacheSolid[| 4] = sndStepSolid5;
cacheSolid[| 5] = sndStepSolid6;
cacheSolid[| 6] = sndStepSolid7;
cacheSolid[| 7] = sndStepSolid8;
cacheSolid[| 8] = sndStepSolid9;
cacheSolid[| 9] = sndStepSolid10;
cacheSolid[| 10] = sndStepSolid11;
cacheSolid[| 11] = sndStepSolid12;
#endregion
#region audio cache initializers
	//base
audioHitCache = ds_list_create();
audioHitCache[| 0] = ds_list_create();
audioHitCache[| 1] = ds_list_create();
audioHitCache[| 2] = ds_list_create();

	//light
var cacheLight = audioHitCache[| 0];
cacheLight[| damageType.slash] = ds_list_create();			//slash
cacheLight[| damageType.blunt] = ds_list_create();			//blunt
cacheLight[| damageType.pierce] = ds_list_create();			//pierce
cacheLight[| damageType.fire] = ds_list_create();			//fire
cacheLight[| damageType.ice] = ds_list_create();			//ice
cacheLight[| damageType.lightning] = ds_list_create();		//lightning
cacheLight[| damageType.arcane] = ds_list_create();			//arcane
cacheLight[| damageType.light] = ds_list_create();			//light
cacheLight[| damageType.dark] = ds_list_create();			//dark
cacheLight[| damageType.pure] = ds_list_create();			//pure

	//medium
var cacheMedium = audioHitCache[| 1];
cacheMedium[| damageType.slash] = ds_list_create();			//slash
cacheMedium[| damageType.blunt] = ds_list_create();			//blunt
cacheMedium[| damageType.pierce] = ds_list_create();		//pierce
cacheMedium[| damageType.fire] = ds_list_create();			//fire
cacheMedium[| damageType.ice] = ds_list_create();			//ice
cacheMedium[| damageType.lightning] = ds_list_create();		//lightning
cacheMedium[| damageType.arcane] = ds_list_create();		//arcane
cacheMedium[| damageType.light] = ds_list_create();			//light
cacheMedium[| damageType.dark] = ds_list_create();			//dark
cacheMedium[| damageType.pure] = ds_list_create();			//pure

	//heavy
var cacheHeavy = audioHitCache[| 2];
cacheHeavy[| damageType.slash] = ds_list_create();			//slash
cacheHeavy[| damageType.blunt] = ds_list_create();			//blunt
cacheHeavy[| damageType.pierce] = ds_list_create();			//pierce
cacheHeavy[| damageType.fire] = ds_list_create();			//fire
cacheHeavy[| damageType.ice] = ds_list_create();			//ice
cacheHeavy[| damageType.lightning] = ds_list_create();		//lightning
cacheHeavy[| damageType.arcane] = ds_list_create();			//arcane
cacheHeavy[| damageType.light] = ds_list_create();			//light
cacheHeavy[| damageType.dark] = ds_list_create();			//dark
cacheHeavy[| damageType.pure] = ds_list_create();			//pure

	//slash
		//light
var slashLight = cacheLight[| 0];

		//medium
var slashMedium = cacheMedium[| damageType.slash];
slashMedium[| 0] = snd_slash_hit_medium_1;
slashMedium[| 1] = snd_slash_hit_medium_2;

		//heavy
var slashHeavy = cacheHeavy[| damageType.slash];
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
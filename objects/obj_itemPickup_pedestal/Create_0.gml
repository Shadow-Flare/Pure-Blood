event_inherited();

usable = true;	//CHANGE THIS, MUST BE DEPENDANT ON WORLD VARIABLE

interactPositionCorrectX = x-image_xscale*16;
interactPositionCorrectFacing = sign(image_xscale);
			
interactSprite = sprPlayerBodyInteractItemPickupPedestal;
interactAnimDuration = 0.9;
interactUseDuration = 0.7;
interactScript = noone;

pedestalImageGap = 0;
pedestalHoverVariance = 1;	//either side
pedestalHoverTimer = 0;

	//these should be defined on creation, otherwise pedestal will be destroyed
itemHeldID = noone;
itemHeldCat = noone;
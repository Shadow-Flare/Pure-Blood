event_inherited();

usable = true;	//CHANGE THIS, MUST BE DEPENDANT ON WORLD VARIABLE

interactPositionCorrectX = x-image_xscale*16;
interactPositionCorrectFacing = sign(image_xscale);
			
interactSprite = sprPlayerBodyInteractItemPickupBasic;
interactAnimDuration = 0.9;
interactUseDuration = 0.7;
interactScript = noone;

	//this list should be filled in creation code using scr_itemPickup_addItem()
itemList = ds_list_create();
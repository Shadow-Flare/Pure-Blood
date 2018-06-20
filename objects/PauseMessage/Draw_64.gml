var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

if !initialized
{
	scr_pauseSplash();
	initialized = true;
		//shut down all object in room save technicals
	instance_deactivate_all(true);
		//Data stores
	instance_activate_object(objCacheParent);
		//Controllers
	instance_activate_object(ParticleController);
	instance_activate_object(GameManager);
	instance_activate_object(InputManager);
	instance_activate_object(EffectsManager);
	instance_activate_object(AmbienceController);
	instance_activate_object(MapManager);
}
else
{
	//darken
	if surface_exists(GameManager.pauseSplash) draw_surface(GameManager.pauseSplash,0,0);
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,1980,1080,0);
	draw_set_alpha(1);

	//get alpha
	var alpha = clamp(timer/(fadeDuration*room_speed),0,1);
	if ending alpha = 1-alpha;

	switch pauseMessagePhase
	{
		case pauseMessageState.pedestalItem:		#region pedestal
			var itemCat = pauseMessageData1;
			var itemID = pauseMessageData2;
				//image
			var image = item_get_data(itemCat,itemID,itemStats.icon);
			if sprite_exists(image)
			{
				var imageX = (pedestalImageCenterX)*surfW-pedestalImageScale*sprite_get_width(image)/2;
				var imageY = (pedestalImageCenterY)*surfH-pedestalImageScale*sprite_get_height(image)/2;
				draw_sprite_ext(image,0,imageX,imageY,pedestalImageScale,pedestalImageScale,0,c_white,alpha);
			}
				//title
			var title = item_get_data(itemCat,itemID,itemStats.name);
			if is_string(title)
			{
				draw_set_font(pedestalTitleFont);
				draw_set_halign(fa_center);
				draw_set_valign(fa_bottom);
					draw_text_colour(pedestalTitleCenterX*surfW,pedestalTitleBottomY*surfH,title,c_white,c_white,c_white,c_white,alpha);
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
			}
				//description
			var desc = item_get_data(itemCat,itemID,itemStats.description);
			if is_string(desc)
			{
				draw_set_font(pedestalDescFont);
				draw_set_halign(fa_center);
					draw_text_ext_colour(pedestalDescCenterX*surfW,pedestalDescStartY*surfH,desc,pedestalDescTextSep*surfH,pedestalDescTextWidth*surfW,c_white,c_white,c_white,c_white,alpha);
				draw_set_halign(fa_left);
			}
		
			break;									#endregion
	}
}
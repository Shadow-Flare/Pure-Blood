var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

draw_set_font(fnt_small_text);

#region inventory interface section
//graphical
	//tabs
for (var i = 0; i < ds_list_size(tabSprites); i++)
{
	var col = c_dkgray;
	var vertPos = inventoryTabY;
	if (i = sX)
	{
		col = c_white;
		vertPos += inventoryTabYSelectMod;
		if (sY == 0) 
		{
			draw_sprite_ext(inventoryTabSelectionSprite,0,surfW*(inventoryTabX+inventoryTabXInc*i),surfH*vertPos,inventoryTabImageScale,inventoryTabImageScale,0,col,1);
		}
	}
	draw_sprite_ext(tabSprites[| i],0,surfW*(inventoryTabX+inventoryTabXInc*i),surfH*vertPos,inventoryTabImageScale,inventoryTabImageScale,0,col,1);
}
	//backing
if !surface_exists(inventoryTextbox1) inventoryTextbox1 = surface_create(surfW,surfH);
surface_set_target(inventoryTextbox1);
	scr_draw_textbox(surfW*inventoryTextbox1X1,surfH*inventoryTextbox1Y1,surfW*inventoryTextbox1X2,surfH*inventoryTextbox1Y2,0,4);
surface_reset_target()

if !surface_exists(inventoryTextbox1Mod) inventoryTextbox1Mod = surface_create(surfW,surfH);
surface_set_target(inventoryTextbox1Mod);
	shader_set(shd_textbox_recolor);
	var shd_newColor = shader_get_uniform(shd_textbox_recolor,"newColor");
	var shd_vertData = shader_get_uniform(shd_textbox_recolor,"vertData");
	shader_set_uniform_f(shd_newColor,inventoryTextbox1Colour[0],inventoryTextbox1Colour[1],inventoryTextbox1Colour[2],1);
	shader_set_uniform_f(shd_vertData,inventoryTextbox1Y1-0.1,inventoryTextbox1Y2+0.1);
		draw_surface(inventoryTextbox1,0,0);
	shader_reset();
surface_reset_target()

draw_surface(inventoryTextbox1Mod,0,0);
	
	//panels
if (selection != tabType.all)
{
	var typeCache = ItemCache.inventory[? selection-1];
	var maxItems = max(ds_map_size(typeCache),1);
	var panelSep = (inventoryPanelYEnd-inventoryPanelYBegin-(sprite_get_height(inventoryPanelSprite)*inventoryPanelScale)/surfH)/(inventoryPanelNum-1);
	for (var i = 0; i < inventoryPanelNum; i++)
	{
		var colMod = 0.25;
		if i < maxItems colMod = 1;
		var blend = make_color_rgb(color_get_red(inventoryPanelBlend)*colMod,color_get_green(inventoryPanelBlend)*colMod,color_get_blue(inventoryPanelBlend)*colMod);
	    draw_sprite_ext(inventoryPanelSprite,0,surfW*inventoryPanelX,surfH*(inventoryPanelYBegin+panelSep*i),inventoryPanelScale,inventoryPanelScale,0,blend,1.0);
		draw_sprite_ext(inventoryPanelNumSprite,0,surfW*inventoryPanelNumX,surfH*(inventoryPanelYBegin+panelSep*i),inventoryPanelScale,inventoryPanelScale,0,blend,1.0);
	}
}
	
	//Individual items
if (selection != tabType.all)
{
	var typeCache = ItemCache.inventory[? selection-1];
	var maxItems = ds_map_size(typeCache);
	if (maxItems == 0)
	{
		var col = c_gray;
		if sY == 1 col = c_white;
		draw_set_colour(col);
		var name = "Nothing";
		var icon = spr_icon_item_TEMPLATE;
		draw_text(surfW*(inventoryListX+inventoryTextXOffset),surfH*(inventoryListY+inventoryTextYOffset),name)
		draw_sprite_ext(icon,0,surfW*inventoryListX,surfH*(inventoryListY),inventoryIconScale,inventoryIconScale,0,col,1);
	}
	else
	{
		var panelSep = (inventoryPanelYEnd-inventoryPanelYBegin-(sprite_get_height(inventoryPanelSprite)*inventoryPanelScale)/surfH)/(inventoryPanelNum-1);
		var itemID = ds_map_find_first(typeCache);
		var count = 0;
		while (itemID != undefined)
		{
			var name = item_get_data(selection-1, itemID, itemStats.name);
			var icon = item_get_data(selection-1, itemID, itemStats.icon);
			var num = scr_player_inventory_get(selection-1, itemID);
			var col = c_gray;
				//item selection emphasis
			if (sY == 1 && count == sExpY)
			{
				var desc = item_get_data(selection-1, itemID, itemStats.description);
				col = c_white;
				draw_set_color(col);
				draw_text_ext(surfW*inventoryDescriptionX,surfH*inventoryDescriptionY, desc, surfH*inventoryDescriptionSep, surfW*inventoryDescriptionWidth);
			}
			
			if (name == undefined)
			{
				name = "UNDEFINED";
			}
			if (icon == undefined)
			{
				icon = spr_icon_item_undefined;
			}
			
			draw_sprite_ext(icon,0,surfW*inventoryListX,surfH*(inventoryListY+(panelSep*count)),inventoryIconScale,inventoryIconScale,0,col,1);
			draw_set_color(col);
			draw_text(surfW*(inventoryListX+inventoryTextXOffset),surfH*(inventoryListY+(panelSep*count)+inventoryTextYOffset),name)
			draw_set_halign(fa_center);
			draw_text(surfW*(inventoryListX+inventoryNumberXOffset),surfH*(inventoryListY+(panelSep*count)+inventoryNumberYOffset),num)
			draw_set_halign(fa_left);
		
			itemID = ds_map_find_next(typeCache,itemID);
			count++;
		}
	}
}
#endregion
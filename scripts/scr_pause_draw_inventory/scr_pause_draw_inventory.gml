var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

#region inventory interface section
	//get data
var maxItems = array_length_1d(slot_options);
var typeCache = ItemCache.item[? selection];
//set
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
	//category
var catName;
switch selection
{
	case inventoryTabType.item:
		catName = "Items";
		break;
	case inventoryTabType.weapon:
		catName = "Weapons";
		break;
	case inventoryTabType.equipment:
		catName = "Equipment";
		break;
	case inventoryTabType.accessory:
		catName = "Accessories";
		break;
	case inventoryTabType.key:
		catName = "Key Items";
		break;
	case inventoryTabType.alchemy:
		catName = "Alchemy";
		break;
}
draw_text(surfW*inventoryCategoryTextX,surfH*inventoryCategoryTextY,catName);
//set
draw_set_font(fnt_small_text);
draw_set_halign(fa_left);
	//tabs
for (var i = 0; i < ds_list_size(inventoryTabSprites); i++)
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
	draw_sprite_ext(inventoryTabSprites[| i],0,surfW*(inventoryTabX+inventoryTabXInc*i),surfH*vertPos,inventoryTabImageScale,inventoryTabImageScale,0,col,1);
}
//scroll bar
scr_draw_scroll_bar(surfW*inventoryScrollBarX, surfH*inventoryScrollBarY1,surfH*inventoryScrollBarY2,inventoryScrollBarType,inventoryScrollBarScale,inventoryScrollBarColour);
//scroll cursor
var scrollYMod = abs(inventoryScrollBarY2-inventoryScrollBarY1-(sprite_get_height(inventoryScrollCursorSprite)*inventoryScrollBarScale/surfH))*(inventoryPanelScroll/(array_length_1d(slot_options)-inventoryPanelNum));
draw_sprite_ext(inventoryScrollCursorSprite,0,surfW*inventoryScrollBarX,surfH*(inventoryScrollBarY1+scrollYMod),inventoryScrollBarScale,inventoryScrollBarScale,0,inventoryScrollCursorColour,1);

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
var panelSep = (inventoryPanelYEnd-inventoryPanelYBegin-(sprite_get_height(inventoryPanelSprite)*inventoryPanelScale)/surfH)/(inventoryPanelNum-1);
for (var i = 0; i < inventoryPanelNum; i++)
{
	var colMod = 0.25;
	if i < maxItems colMod = 1;
	var blend = make_color_rgb(color_get_red(inventoryPanelBlend)*colMod,color_get_green(inventoryPanelBlend)*colMod,color_get_blue(inventoryPanelBlend)*colMod);
	draw_sprite_ext(inventoryPanelSprite,0,surfW*inventoryPanelX,surfH*(inventoryPanelYBegin+panelSep*i),inventoryPanelScale,inventoryPanelScale,0,blend,1.0);
	draw_sprite_ext(inventoryPanelNumSprite,0,surfW*inventoryPanelNumX,surfH*(inventoryPanelYBegin+panelSep*i),inventoryPanelScale,inventoryPanelScale,0,blend,1.0);
}
	
	//Individual items
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
	for (var i = 0; i < min(inventoryPanelNum,maxItems); i++)
	{
		var itemID = slot_options[i+inventoryPanelScroll];
		var name = item_get_data(selection, itemID, itemStats.name);
		var icon = item_get_data(selection, itemID, itemStats.icon);
		var num = scr_player_inventory_get(selection, itemID);
		var col = c_gray;
			//item selection emphasis
		if (sY == 1 && i+inventoryPanelScroll == sExpY)
		{
			var desc = item_get_data(selection, itemID, itemStats.description);
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
			
		draw_sprite_ext(icon,0,surfW*inventoryListX,surfH*(inventoryListY+(panelSep*i)),inventoryIconScale,inventoryIconScale,0,col,1);
		draw_set_color(col);
		draw_text(surfW*(inventoryListX+inventoryTextXOffset),surfH*(inventoryListY+(panelSep*i)+inventoryTextYOffset),name)
		draw_set_halign(fa_center);
		draw_text(surfW*(inventoryListX+inventoryNumberXOffset),surfH*(inventoryListY+(panelSep*i)+inventoryNumberYOffset),num)
		draw_set_halign(fa_left);
	}
}
#endregion
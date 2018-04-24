//inventory interface section
#region get data
var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);
var gridW = ds_grid_width(slot_grid);
var gridH = ds_grid_height(slot_grid);
var typeCache = ItemCache.item[? selection];
#endregion
#region category Title
//set dont and text data
draw_set_font(fnt_alagard);
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
	case inventoryTabType.rune:
		catName = "Runes";
		break;
	case inventoryTabType.key:
		catName = "Key Items";
		break;
	case inventoryTabType.alchemy:
		catName = "Alchemy";
		break;
}
draw_text(surfW*inventoryCategoryTextX,surfH*inventoryCategoryTextY,catName);
#endregion
#region tabs
//set
draw_set_font(fnt_small_text);
//draw
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
#endregion
#region backing & scrollbar
//backings
	//main items
scr_draw_textbox(surfW*inventoryTextbox1X1,surfH*inventoryTextbox1Y1,surfW*inventoryTextbox1X2,surfH*inventoryTextbox1Y2,inventoryTextbox1Type,inventoryTextbox1Scale,inventoryColourScheme);
	//description
scr_draw_textbox(surfW*inventoryTextbox2X1,surfH*inventoryTextbox2Y1,surfW*inventoryTextbox2X2,surfH*inventoryTextbox2Y2,inventoryTextbox2Type,inventoryTextbox2Scale,inventoryColourScheme);
//scroll bar
scr_draw_scroll_bar(surfW*inventoryScrollBarX, surfH*inventoryScrollBarY1,surfH*inventoryScrollBarY2,true,inventoryPanelScroll,gridH-inventoryGridHeight-1,inventoryScrollBarType,inventoryScrollBarScale,inventoryScrollBarColour);
#endregion
#region item slots
var panelSepX = (inventoryPanelXEnd-inventoryPanelXBegin-(sprite_get_width(inventoryPanelSprite)*inventoryPanelScale)/surfW)/(inventoryGridWidth-1);
var panelSepY = (inventoryPanelYEnd-inventoryPanelYBegin-(sprite_get_height(inventoryPanelSprite)*inventoryPanelScale)/surfH)/(inventoryGridHeight-1);
for (var i = 0; i < inventoryGridWidth; i++)
{
	for (var j = 0; j < inventoryGridHeight; j++)
	{
		var blend = merge_colour(inventoryColourScheme,c_black,0.75);
		if (sY == 1 && i == sExpX && j+inventoryPanelScroll == sExpY) blend = inventoryColourScheme;
		draw_sprite_ext(inventoryPanelSprite,0,surfW*(inventoryPanelXBegin+panelSepX*i),surfH*(inventoryPanelYBegin+panelSepY*j),inventoryPanelScale,inventoryPanelScale,0,blend,1.0);
	}
}
#endregion
#region Individual items
for (var i = 0; i < inventoryGridWidth; i++)
{
	for (var j = 0; j < inventoryGridHeight; j++)
	{
		var itemID = slot_grid[# i,j+inventoryPanelScroll];
		var icon = item_get_data(selection, itemID, itemStats.icon);
		var num = scr_player_inventory_get(selection, itemID);
		var col = c_white
		//var col = c_gray;
		//	//item selection emphasis
		//if (sY == 1 && i == sExpX && j+inventoryPanelScroll == sExpY) col = c_white;

		if (icon != undefined)
		{
			var iconXOffset = (sprite_get_width(inventoryPanelSprite)*inventoryPanelScale-sprite_get_width(icon)*inventoryPanelIconScale)/2/surfW;
			var iconYOffset = (sprite_get_height(inventoryPanelSprite)*inventoryPanelScale-sprite_get_height(icon)*inventoryPanelIconScale)/2/surfH;
			draw_sprite_ext(icon,0,surfW*(inventoryPanelXBegin+iconXOffset+panelSepX*i),surfH*(inventoryPanelYBegin+iconYOffset+panelSepY*j),inventoryPanelIconScale,inventoryPanelIconScale,0,col,1);
			draw_sprite_ext(inventoryPanelNumSprite,0,surfW*(inventoryPanelXBegin+inventoryPanelNumXOffset+panelSepX*i),surfH*(inventoryPanelYBegin+inventoryPanelNumYOffset+panelSepY*j),inventoryPanelNumScale,inventoryPanelNumScale,0,c_black,1.0);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_colour(col);
			draw_text(surfW*(inventoryPanelXBegin+inventoryPanelNumXOffset+panelSepX*i),surfH*(inventoryPanelYBegin+inventoryPanelNumYOffset+panelSepY*j),num);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}
	}
}
#endregion
#region Descriptions
switch sY
{
	case 0:
			//nothing for now
		break;
	case 1:
			//get data
		var itemID = slot_grid[# sExpX,sExpY];
		var itemName = item_get_data(selection,itemID,itemStats.name);
		var itemDesc = item_get_data(selection,itemID,itemStats.description);
		if itemName != undefined
		{
				//draw title
			draw_set_font(inventoryItemNameFont);
			draw_set_halign(fa_center);
			draw_set_colour(c_white);
			draw_text(inventoryItemNameX*surfW,inventoryItemNameY*surfH,itemName)
			draw_set_halign(fa_left);
				//draw Description
			draw_set_font(inventoryItemDescriptionFont);
			draw_text_ext(inventoryItemDescriptionX*surfW,inventoryItemDescriptionY*surfH,itemDesc,inventoryItemDescriptionSep*surfH,inventoryItemDescriptionWidth*surfW);
		}
		break;
}
#endregion
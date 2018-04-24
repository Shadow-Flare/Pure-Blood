var surfW = surface_get_width(application_surface);
var surfH = surface_get_height(application_surface);

#region ability interface section
//get data
var maxAbilities = array_length_1d(slot_options);
var typeCache = AbilityCache.ability[? selection];
//set
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
	//category
var catName;
switch selection
{
	case abilityTabType.combat:
		catName = "Combat";
		break;
	case abilityTabType.movement:
		catName = "Movement";
		break;
	case abilityTabType.support:
		catName = "Support";
		break;
}
draw_text(surfW*abilityCategoryTextX,surfH*abilityCategoryTextY,catName);
//set
draw_set_font(fnt_small_text);
draw_set_halign(fa_left);
	//tabs
for (var i = 0; i < ds_list_size(abilityTabSprites); i++)
{
	var col = c_dkgray;
	var vertPos = abilityTabY;
	if (i = sX)
	{
		col = c_white;
		vertPos += abilityTabYSelectMod;
		if (sY == 0) 
		{
			draw_sprite_ext(abilityTabSelectionSprite,0,surfW*(abilityTabX+abilityTabXInc*i),surfH*vertPos,abilityTabImageScale,abilityTabImageScale,0,col,1);
		}
	}
	draw_sprite_ext(abilityTabSprites[| i],0,surfW*(abilityTabX+abilityTabXInc*i),surfH*vertPos,abilityTabImageScale,abilityTabImageScale,0,col,1);
}

//scroll bar
scr_draw_scroll_bar(surfW*abilityScrollBarX, surfH*abilityScrollBarY1,surfH*abilityScrollBarY2,true,abilityPanelScroll,array_length_1d(slot_options)-abilityPanelNum-1,abilityScrollBarType,abilityScrollBarScale,abilityScrollBarColour);

	//backing
scr_draw_textbox(surfW*abilityTextbox1X1,surfH*abilityTextbox1Y1,surfW*abilityTextbox1X2,surfH*abilityTextbox1Y2,abilityTextbox1Type,abilityTextbox1Scale,abilityTextbox1Colour);
	
	//panels
var panelSep = (abilityPanelYEnd-abilityPanelYBegin-(sprite_get_height(abilityPanelSprite)*abilityPanelScale)/surfH)/(abilityPanelNum-1);
for (var i = 0; i < abilityPanelNum; i++)
{
	var colMod = 0.25;
	if i < maxAbilities colMod = 1;
	var blend = make_color_rgb(color_get_red(abilityPanelBlend)*colMod,color_get_green(abilityPanelBlend)*colMod,color_get_blue(abilityPanelBlend)*colMod);
	draw_sprite_ext(abilityPanelSprite,0,surfW*abilityPanelX,surfH*(abilityPanelYBegin+panelSep*i),abilityPanelScale,abilityPanelScale,0,blend,1.0);
	draw_sprite_ext(abilityPanelNumSprite,0,surfW*abilityPanelNumX,surfH*(abilityPanelYBegin+panelSep*i),abilityPanelScale,abilityPanelScale,0,blend,1.0);
}
	
	//Individual abilities
if (maxAbilities == 0)
{
	var col = c_gray;
	if sY == 1 col = c_white;
	draw_set_colour(col);
	var name = "Nothing";
	var icon = spr_icon_ability_undefined;
	draw_text(surfW*(abilityListX+abilityTextXOffset),surfH*(abilityListY+abilityTextYOffset),name)
	draw_sprite_ext(icon,0,surfW*abilityListX,surfH*(abilityListY),abilityIconScale,abilityIconScale,0,col,1);
}
else
{
	for (var i = 0; i < min(abilityPanelNum,maxAbilities); i++)
	{
		var abilityID = slot_options[i+abilityPanelScroll];
		var lastAbilityID = noone;
		var count = 0;
		for (var j = 0; j < array_length_1d(slot_options); j++)
		{
			var temp = slot_options[j];
			if temp == lastAbilityID count++;
			else count = 0;
			if count < scr_player_ability_get(selection, temp, playerAbilityStats.numberActivated)
			{
				var icon = abilityIconActivated;
			}
			else var icon = abilityIconDeactivated;
			if i+abilityPanelScroll == j break;
			lastAbilityID = temp;
		}
		
		var name = ability_get_data(selection, abilityID, abilityStats.name);
		var num = ability_get_data(selection, abilityID, abilityStats.cost);
		var col = c_gray;
			//ability selection emphasis
		if (sY == 1 && i+abilityPanelScroll == sExpY)
		{
			col = c_white;
			draw_set_color(col);
		}
			
		if (name == undefined)
		{
			name = "UNDEFINED";
		}
		if (icon == undefined)
		{
			icon = spr_icon_ability_undefined;
		}
			
		draw_sprite_ext(icon,0,surfW*abilityListX,surfH*(abilityListY+(panelSep*i)),abilityIconScale,abilityIconScale,0,col,1);
		draw_set_color(col);
		draw_text(surfW*(abilityListX+abilityTextXOffset),surfH*(abilityListY+(panelSep*i)+abilityTextYOffset),name)
		draw_set_halign(fa_center);
		draw_text(surfW*(abilityListX+abilityNumberXOffset),surfH*(abilityListY+(panelSep*i)+abilityNumberYOffset),num)
		draw_set_halign(fa_left);
	}
}
#endregion
#region details
	//description & info
		//textbox
scr_draw_textbox(surfW*abilityTextbox2X1,surfH*abilityTextbox2Y1,surfW*abilityTextbox2X2,surfH*abilityTextbox2Y2,abilityTextbox2Type,abilityTextbox2Scale,abilityTextbox2Colour);
		//description
if sY != 0
{
	draw_set_font(abilityDescriptionFont);
	draw_set_colour(c_white);
	if maxAbilities != 0
	{
		var abilityID = slot_options[sExpY];
		var desc = ability_get_data(selection, abilityID, abilityStats.description);
		draw_text_ext(surfW*abilityDescriptionX,surfH*abilityDescriptionY, desc, surfH*abilityDescriptionSep, surfW*abilityDescriptionWidth);
	}
}
	//AP Stats
		//textbox
scr_draw_textbox(surfW*abilityTextbox3X1,surfH*abilityTextbox3Y1,surfW*abilityTextbox3X2,surfH*abilityTextbox3Y2,abilityTextbox3Type,abilityTextbox3Scale,abilityTextbox3Colour);
	//Bar (CURRENT CODE HERE IS JUST THE TEXT COMPONENT
draw_set_valign(fa_center);
draw_set_halign(fa_right);
draw_set_font(fnt_alagard);	
	var apText = string(PlayerStats.ap)+"/"+string(PlayerStats.apMax);
	draw_text(surfW*abilityApDisplayX,surfH*abilityApDisplayY,apText);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
#endregion